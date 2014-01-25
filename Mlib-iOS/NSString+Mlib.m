//
//  NSString+Mlib.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/28/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSString+Mlib.h"

@implementation NSString (Mlib)

- (BOOL)mm_isAppendingTextWithRange:(NSRange)range
                  replacementString:(NSString *)string
{
    return range.location == self.length
        && range.length == 0
        && string.length > 0;
}

@end
