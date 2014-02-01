//
//  MMDictionaryTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 2/1/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+Mlib.h"

@interface MMDictionaryTests : XCTestCase

@end

@implementation MMDictionaryTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testKeysAndValuesAsLines
{
    NSDictionary *dict = @{};
    XCTAssertEqualObjects(@"", [dict mm_keysAndValuesAsLines], @"Empty dict -> empty string");
    
    dict = @{@"K1": @"V1"};
    XCTAssertEqualObjects(@"K1: V1", [dict mm_keysAndValuesAsLines], @"One item -> one line");
    
    dict = @{@"K1": @"V1", @"K2": @"V2"};
    XCTAssertEqualObjects(@"K1: V1\nK2: V2", [dict mm_keysAndValuesAsLines], @"Multiple items -> multiple lines");
}

@end
