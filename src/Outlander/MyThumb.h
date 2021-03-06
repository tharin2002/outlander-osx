//
//  MyThumb.h
//  Outlander
//
//  Created by Joseph McBride on 1/26/14.
//  Copyright (c) 2014 Joe McBride. All rights reserved.
//

#import "Shared.h"

@interface MyThumb : NSView

@property (atomic, strong) CompleteBlock down;
@property (atomic, strong) CompleteBlock up;
@property (atomic, strong) CompleteBlock dragged;

- (id)initWithFrame:(NSRect)frame withCursor:(NSCursor *)cursor;

@end
