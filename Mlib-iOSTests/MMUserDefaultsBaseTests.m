//
//  MMUserPreferencesTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 1/30/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MMUserDefaultsBase.h"

@interface MMUserDefaultsBaseTests : XCTestCase {
    MMUserDefaultsBase *_oldSharedPrefs;
}

@end

@implementation MMUserDefaultsBaseTests

- (void)setUp
{
    [super setUp];
    _oldSharedPrefs = [MMUserDefaultsBase sharedDefaults];
}

- (void)tearDown
{
    [MMUserDefaultsBase setSharedDefaults:_oldSharedPrefs];
    [super tearDown];
}

- (void)testDefaultSharedPreferences
{
    MMUserDefaultsBase *SUT = [MMUserDefaultsBase sharedDefaults];
    XCTAssertNotNil(SUT);
    XCTAssertEqual(SUT.userDefaults, [NSUserDefaults standardUserDefaults]);
}

@end
