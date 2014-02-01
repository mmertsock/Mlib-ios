//
//  NSDictionary+Mlib.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 2/1/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "NSDictionary+Mlib.h"

@implementation NSDictionary (Mlib)

- (NSString *)mm_stringWithKey:(id)key value:(id)value
{
    return [NSString stringWithFormat:@"%@: %@", key, value];
}

- (NSString *)mm_keysAndValuesAsLines
{
    NSMutableArray *lines = [NSMutableArray arrayWithCapacity:self.count];
    for (id key in self) {
        [lines addObject:[self mm_stringWithKey:key value:self[key]]];
    }
    return [lines componentsJoinedByString:@"\n"];
}

@end
