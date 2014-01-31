//
//  MMUserPreferences.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 1/30/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

// Simple wrapper around NSUserDefaults for abstraction and testability.
// This is meant to be subclassed.
@interface MMUserPreferences : NSObject

+ (MMUserPreferences *)sharedPreferences;
+ (void)setSharedPreferences:(MMUserPreferences *)instance; // for testing

- (id)init;
- (id)initWithUserDefaults:(NSUserDefaults *)userDefaults; // for testing

- (void)synchronize;

@end
