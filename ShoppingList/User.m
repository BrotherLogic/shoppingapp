//
//  User.m
//  ShoppingList
//
//  Created by Simon Tucker on 03/08/2014.
//  Copyright (c) 2014 Brotherlogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

@synthesize userName;
@synthesize userId;
@synthesize avatarURL;

-(id)init: (NSString *)nme :(NSInteger *)uid :(NSURL*)avatar
{
    self = [super init];
    
    self.userName = nme;
    self.userId = uid;
    self.avatarURL = avatar;
    
    return self;
}

@end