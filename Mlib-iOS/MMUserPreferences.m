//
//  MMUserPreferences.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 1/30/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMUserPreferences.h"

static __strong MMUserPreferences *_sharedPreferences;

@interface MMUserPreferences () {
    __strong NSUserDefaults *_userDefaults;
}
@property (readonly, nonatomic) NSUserDefaults *userDefaults;
@end

@implementation MMUserPreferences

+ (MMUserPreferences *)sharedPreferences
{
    return _sharedPreferences ?: (_sharedPreferences = [MMUserPreferences new]);
}

+ (void)setSharedPreferences:(MMUserPreferences *)instance
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
