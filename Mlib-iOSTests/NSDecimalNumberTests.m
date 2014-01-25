//
//  NSDecimalNumberTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/28/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSDecimalNumberTests.h"
#import "Mlib_iOS.h"

@implementation NSDecimalNumberTests

- (void)testFractionalPartToPlaces
{
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"123"] mm_fractionalPartToPlaces:0], (NSUInteger)0, @"no point, 0 places");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"123"] mm_fractionalPartToPlaces:1], (NSUInteger)0, @"no point, 1 place");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"123"] mm_fractionalPartToPlaces:2], (NSUInteger)0, @"no point, 2 places");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"123"] mm_fractionalPartToPlaces:3], (NSUInteger)0, @"no point, 3 places");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"12.3"] mm_fractionalPartToPlaces:0], (NSUInteger)0, @"1 point, 0 places");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"12.3"] mm_fractionalPartToPlaces:1], (NSUInteger)3, @"1 point, 1 place");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"12.3"] mm_fractionalPartToPlaces:2], (NSUInteger)30, @"1 point, 2 places");
    STAssertEquals([[NSDecimalNumber decimalNumberWithString:@"12.03"] mm_fractionalPartToPlaces:3], (NSUInteger)30, @"2 points, 3 places");
}

@end
