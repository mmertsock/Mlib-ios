//
//  MMUserPreferences.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 1/30/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMUserDefaultsBase.h"

static __strong MMUserDefaultsBase *_sharedPreferences;

@interface MMUserDefaultsBase () {
    __strong NSUserDefaults *_userDefaults;
}
@end

@implementation MMUserDefaultsBase

+ (instancetype)sharedDefaults
{
    return _sharedPreferences ?: (_sharedPreferences = [[self alloc] init]);
}

+ (void)setSharedDefaults:(MMUserDefaultsBase *)instance
{
    _sharedPreferences = instance;
}

- (id)init
{
    return [self initWithUserDefaults:nil];
}

- (id)initWithUserDefaults:(NSUserDefaults *)userDefaults
{
    if (self = [super init]) {
        _userDefaults = userDefaults;
    }
    return self;
}

- (NSUserDefaults *)userDefaults
{
    return _userDefaults ?: [NSUserDefaults standardUserDefaults];
}

- (void)synchronize
{
    [self.userDefaults synchronize];
}

@end
