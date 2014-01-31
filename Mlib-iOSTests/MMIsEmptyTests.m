//
//  MMIsEmpty.m
//  Mlib-iOS
//
//  Created by Mike on 10/23/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import "MMIsEmptyTests.h"
#import "Mlib_iOS.h"

@interface MMTestClassWithCustomLengthProperty : NSObject { }
- (id)initWithLength:(NSUInteger)aLength;
@property NSUInteger length;
@end;

@implementation MMTestClassWithCustomLengthProperty
- (id)initWithLength:(NSUInteger)aLength
{
    if (self = [super init])
        self.length = aLength;
    return self;
}
@end

@implementation MMIsEmptyTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testIsEmptyIsYesForEmptyValues
{
    XCTAssertTrue(MMIsEmpty(nil), @"nil is empty");
    XCTAssertTrue(MMIsEmpty([NSNull null]), @"NSNull is empty");
    XCTAssertTrue(MMIsEmpty(@""), @"Zero-length string is empty");
    XCTAssertTrue(MMIsEmpty([NSArray array]), @"Zero-count array is empty");
    XCTAssertTrue(MMIsEmpty([NSDictionary dictionary]), @"Zero-count dict is empty");
    XCTAssertTrue(MMIsEmpty([[MMTestClassWithCustomLengthProperty alloc] initWithLength:0]),
                 @"Custom length property=0 is empty");
}

- (void)testIsEmptyIsNoForNonEmptyValues
{
    NSUUID* nonNil = [NSUUID UUID];
    XCTAssertFalse(MMIsEmpty(nonNil), @"non nil is not empty");
    XCTAssertFalse(MMIsEmpty(@"test"), @"String with chars is not empty");
    XCTAssertFalse(MMIsEmpty([NSArray arrayWithObject:@"test"]),
                  @"Array with elements is not empty");
    XCTAssertFalse(MMIsEmpty([NSDictionary dictionaryWithObject:@"test" forKey:@"test"]),
                  @"Dict with data is not empty");
    XCTAssertFalse(MMIsEmpty([[MMTestClassWithCustomLengthProperty alloc] initWithLength:5]),
                  @"Custom length property=5 is not empty");
    XCTAssertFalse(MMStringIsEmpty(@"  \t \n  "),
                  @"String with only whitespace is non empty");
}

- (void)testStringIsEmptyIsYesForEmptyOrNilStrings
{
    XCTAssertTrue(MMStringIsEmpty(nil), @"nil string is empty");
    XCTAssertTrue(MMStringIsEmpty(@""), @"zero length string is empty");
}

- (void)testStringIsEmptyIsNoForNonEmptyStrings
{
    XCTAssertFalse(MMStringIsEmpty(@"test"), @"String with chars is non empty");
    XCTAssertFalse(MMStringIsEmpty(@"  \t \n  "), @"String with only whitespace is non empty");
}

- (void)testStringIsEmptyOrWhitespaceIsYesForEmptyOrWhitespaceStrings
{
    XCTAssertTrue(MMStringIsEmptyOrWhitespace(nil), @"nil string is empty/whitespace");
    XCTAssertTrue(MMStringIsEmptyOrWhitespace(@""), @"zero length string is empty/whitespace");
    XCTAssertTrue(MMStringIsEmptyOrWhitespace(@"  \t \n  "), @"String with only whitespace is empty/whitespace");
}

- (void)testStringIsEmptyOrWhitespaceIsNoForNonEmptyStrings
{
    XCTAssertFalse(MMStringIsEmptyOrWhitespace(@"  test  "), @"String with chars is non empty");
}

@end
