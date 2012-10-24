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
    STAssertTrue(MMIsEmpty(nil), @"nil is empty");
    STAssertTrue(MMIsEmpty([NSNull null]), @"NSNull is empty");
    STAssertTrue(MMIsEmpty(@""), @"Zero-length string is empty");
    STAssertTrue(MMIsEmpty([NSArray array]), @"Zero-count array is empty");
    STAssertTrue(MMIsEmpty([NSDictionary dictionary]), @"Zero-count dict is empty");
    STAssertTrue(MMIsEmpty([[MMTestClassWithCustomLengthProperty alloc] initWithLength:0]),
                 @"Custom length property=0 is empty");
}

- (void)testIsEmptyIsNoForNonEmptyValues
{
    NSUUID* nonNil = [NSUUID UUID];
    STAssertFalse(MMIsEmpty(nonNil), @"non nil is not empty");
    STAssertFalse(MMIsEmpty(@"test"), @"String with chars is not empty");
    STAssertFalse(MMIsEmpty([NSArray arrayWithObject:@"test"]),
                  @"Array with elements is not empty");
    STAssertFalse(MMIsEmpty([NSDictionary dictionaryWithObject:@"test" forKey:@"test"]),
                  @"Dict with data is not empty");
    STAssertFalse(MMIsEmpty([[MMTestClassWithCustomLengthProperty alloc] initWithLength:5]),
                  @"Custom length property=5 is not empty");
    STAssertFalse(MMStringIsEmpty(@"  \t \n  "),
                  @"String with only whitespace is non empty");
}

- (void)testStringIsEmptyIsYesForEmptyOrNilStrings
{
    STAssertTrue(MMStringIsEmpty(nil), @"nil string is empty");
    STAssertTrue(MMStringIsEmpty(@""), @"zero length string is empty");
}

- (void)testStringIsEmptyIsNoForNonEmptyStrings
{
    STAssertFalse(MMStringIsEmpty(@"test"), @"String with chars is non empty");
    STAssertFalse(MMStringIsEmpty(@"  \t \n  "), @"String with only whitespace is non empty");
}

- (void)testStringIsEmptyOrWhitespaceIsYesForEmptyOrWhitespaceStrings
{
    STAssertTrue(MMStringIsEmptyOrWhitespace(nil), @"nil string is empty/whitespace");
    STAssertTrue(MMStringIsEmptyOrWhitespace(@""), @"zero length string is empty/whitespace");
    STAssertTrue(MMStringIsEmptyOrWhitespace(@"  \t \n  "), @"String with only whitespace is empty/whitespace");
}

- (void)testStringIsEmptyOrWhitespaceIsNoForNonEmptyStrings
{
    STAssertFalse(MMStringIsEmptyOrWhitespace(@"  test  "), @"String with chars is non empty");
}

@end
