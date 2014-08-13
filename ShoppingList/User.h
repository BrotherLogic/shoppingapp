//
//  User.h
//  ShoppingList
//
//  Created by Simon Tucker on 03/08/2014.
//  Copyright (c) 2014 Brotherlogic. All rights reserved.
//

@interface User : NSObject

@property (strong,nonatomic) NSString* userName;
@property (nonatomic) NSInteger* userId;
@property (strong,nonatomic) NSURL* avatarURL;

-(id)init: (NSString *)nme :(NSInteger *)uid :(NSURL*)avatar;

@end