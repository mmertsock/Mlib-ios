//
//  NSArray+Mlib.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 5/25/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSArray+Mlib.h"

@implementation NSArray (Mlib)

- (NSArray *)mm_arrayByRemovingObject:(id)anObject
{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self];
    [newArray removeObject:anObject];
    return newArray;
}

- (NSArray *)mm_arrayByInsertingObject:(id)anObject
                               atIndex:(NSUInteger)index
{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self];
    [newArray insertObject:anObject atIndex:index];
    return newArray;
}

@end
