//
//  AppSettings.h
//  Outlander
//
//  Created by Joseph McBride on 5/6/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

@interface AppSettings : NSObject

@property (nonatomic, copy) NSString *defaultProfile;
@property (nonatomic, copy) NSString *profile;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, copy) NSString *character;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, assign) BOOL loggingEnabled;
@property (nonatomic, assign) BOOL rawLoggingEnabled;

@property (nonatomic, assign) BOOL checkForApplicationUpdates;

@property (nonatomic, copy) NSString *homeDirectory;
@property (nonatomic, copy) NSString *configFolder;
@property (nonatomic, copy) NSString *logsFolder;
@property (nonatomic, copy) NSString *profilesFolder;
@property (nonatomic, copy) NSString *scriptsFolder;
@property (nonatomic, copy) NSString *mapsFolder;
@property (nonatomic, copy) NSString *soundsFolder;

- (BOOL)isValid;

@end
