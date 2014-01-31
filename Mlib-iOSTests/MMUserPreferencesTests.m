//
//  MMUserPreferencesTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 1/30/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MMUserPreferences.h"

@interface MMUserPreferencesTests : XCTestCase {
    MMUserPreferences *_oldSharedPrefs;
}

@end

@implementation MMUserPreferencesTests

- (void)setUp
{
    [super setUp];
    _oldSharedPrefs = [MMUserPreferences sharedPreferences];
}

- (void)tearDown
{
    [MMUserPreferences setSharedPreferences:_oldSharedPrefs];
    [super tearDown];
}

- (void)testDefaultSharedPreferences
{
    MMUserPreferences *SUT = [MMUserPreferences sharedPreferences];
    XCTAssertNotNil(SUT);

    id defaults = [SUT performSelector:@selector(userDefaults)];
    XCTAssertEqual(defaults, [NSUserDefaults standardUserDefaults]);
}

@end
