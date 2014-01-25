//
//  NSDecimalNumber+Mlib.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/28/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSDecimalNumber+Mlib.h"

@implementation NSDecimalNumber (Mlib)

- (NSUInteger)mm_fractionalPartToPlaces:(short)decimalPlaces
{
    NSAssert(decimalPlaces >= 0, @"decimalPlaces must not be negative");
    
    if (decimalPlaces == 0) return 0;
    
    NSDecimal value = [self decimalValue];
    
    NSDecimal integerPart;
    NSDecimalRound(&integerPart, &value, 0, NSRoundPlain);
    
    NSDecimal fractionalPart;
    NSDecimalSubtract(&fractionalPart, &value, &integerPart, NSRoundPlain);
    
    NSUInteger fractionalDigits = [[[NSDecimalNumber decimalNumberWithDecimal:fractionalPart] decimalNumberByMultiplyingByPowerOf10:decimalPlaces] unsignedIntegerValue];
    
    return fractionalDigits;
}

@end
