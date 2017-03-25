//
//  ScriptRunner.swift
//  Outlander
//
//  Created by Joseph McBride on 4/11/15.
//  Copyright (c) 2015 Joe McBride. All rights reserved.
//

import Foundation

@objc
public class ScriptRunner : NSObject, ISubscriber {
    
    class func newInstance(context:GameContext, notifier:INotifyMessage) -> ScriptRunner {
        return ScriptRunner(context: context, notifier: notifier)
    }
    
    var notifier:INotifyMessage
    var context:GameContext
    var scriptLoader:ScriptLoader
   
    private var scripts:[IScript]
    
    init(context:GameContext, notifier:INotifyMessage) {
        
        self.context = context
        self.notifier = notifier
        self.scriptLoader = ScriptLoader(self.context, and: LocalFileSystem())
        self.scripts = []
        
        super.init()
        
        context.events.subscribe(self, token: "startscript")
        context.events.subscribe(self, token: "script")
        context.events.subscribe(self, token: "ol:game-parse")
        context.events.subscribe(self, token: "ol:game-stream")
        
        self.context.globalVars.changed.subscribeNext { (obj:AnyObject?) -> Void in
            
            if let changed = obj as? Dictionary<String, String> {
                self.notifyVars(changed)
            }
        }
    }
    
    public func handle(token:String, data:[String:AnyObject]) {
        if token == "ol:game-stream" {
            self.stream(data)
        } else if token == "ol:game-parse" {
            self.parse(data)
        } else if token == "startscript" {
            self.start(data)
        } else if token == "script" {
            self.manage(data)
        }
    }
    
    func start(dict:[String:AnyObject]) {
        
        let scriptName = dict["target"] as! String
        let tokens = dict["args"] as? NSArray;

        if(!self.scriptLoader.exists(scriptName)) {
            self.context.events.echoText("Cannot find script \(scriptName).cmd", mono: true, preset: "scripterror")
            return
        }
        
        self.abort(scriptName)

        do {
            let script = try Script(loader: { (name) in
                return self.scriptLoader.load(name)
                }, scriptName, self.context)

            self.scripts.append(script)
            self.context.events.publish("script:add", data: ["scriptName":script.fileName])

            script.run(self.argsToParams(tokens))
        }
        catch {
        }


//        self.loadAsync(scriptName, tokens: tokens)

//        self.context.events.publish("script:add", data: ["scriptName":script.scriptName])
    }
    
    private func remove(name:String) {
        let found = self.scripts.find { $0.fileName == name }
        if let idx = found {
            self.scripts.removeAtIndex(idx)
            self.context.events.publish("script:remove", data: ["scriptName":name])
        }
    }
    
    func argsToParams(args:NSArray?) -> [String] {
        if let input = args {
            var params:[String] = []
            
            for item in input {
                params.append(item as! String)
            }
            
            return params
        }
        
        return []
    }
    
    func stream(dict:[String:AnyObject]) {
        let nodes = dict["nodes"] as! [Node]
        let text = dict["text"] as! String
        
        for (_, script) in self.scripts.enumerate() {
//            script.stream(text, nodes: nodes)
        }
    }
    
    func parse(userInfo:[String:AnyObject]) {
        if let dict = userInfo as? [String:String] {
            let text = dict["text"] ?? ""
            
            for (_, script) in self.scripts.enumerate() {
//                script.stream(text, nodes: [])
            }
        }
    }
    
    func manage(userInfo:[String:AnyObject]) {
        if let dict = userInfo as? [String:String] {
            let scriptName = dict["target"]!
            let action = dict["action"]!
            
            if action == "abort" {
                self.abort(scriptName)
                
                if scriptName == "all" {
                    self.context.events.publish("script:removeAll", data: [:])
                }
            }
            else if action == "pause" {
                self.pause(scriptName)
                self.context.events.publish("script:pause", data: ["scriptName":scriptName])
            }
            else if action == "resume" {
                self.resume(scriptName)
                self.context.events.publish("script:resume", data: ["scriptName":scriptName])
            }
            else if action == "vars" {
                self.vars(scriptName)
            }
            else if action == "debug" {
                let levelNum = Int(dict["param"] ?? "")
                let level = ScriptLogLevel(rawValue: levelNum ?? -1) ?? ScriptLogLevel.None
                self.debug(scriptName, level: level)

                var data = [String:AnyObject]()
                data["scriptName"] = scriptName
                data["level"] = level.rawValue
                
                self.context.events.publish("script:debug", data: data)
            } else if action == "list" {
                self.listAll()
            }
        }
    }
    
    private func abort(name:String) {
        var names:[String] = []
        for (_, script) in self.scripts.enumerate() {
            if name == "all" || script.fileName == name {
//                script.cancel()
                names.append(script.fileName)
                
                if name != "all" {
                    break
                }
            }
        }
        
        if name == "all" {
            self.scripts = []
        } else {
            for n in names {
                self.remove(n)
            }
        }
    }
    
    private func pause(name:String) {
        for (_, script) in self.scripts.enumerate() {
            
            if name == "all" || script.fileName == name {
//                script.pause()

                if name != "all" {
                    break
                }
            }
        }
    }
    
    private func resume(name:String) {
        for (_, script) in self.scripts.enumerate() {
            
            if name == "all" || script.fileName == name {
//                script.resume()

                if name != "all" {
                    break
                }
            }
        }
    }
    
    private func vars(name:String) {
        for (_, script) in self.scripts.enumerate() {
            if script.fileName == name {
//                script.vars()
                break
            }
        }
    }
    
    private func debug(name:String, level:ScriptLogLevel) {
        for (_, script) in self.scripts.enumerate() {
            if script.fileName == name {
//                script.setLogLevel(level)
                break
            }
        }
    }
    
    private func listAll() {
        for (_, script) in self.scripts.enumerate() {
//            script.printInfo()
        }
        
        if self.scripts.count == 0 {
            self.notifier.notify(TextTag("\n[No scripts current running.]\n\n", mono: true))
        }
    }
    
    private func notifyVars(vars:[String:String]) {
        for (_, script) in self.scripts.enumerate() {
//            script.varsChanged(vars)
        }
    }
}
