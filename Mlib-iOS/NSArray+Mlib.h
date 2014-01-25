//
//  NSArray+Mlib.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 5/25/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Mlib)

- (NSArray *)mm_arrayByRemovingObject:(id)anObject;
- (NSArray *)mm_arrayByInsertingObject:(id)anObject
                               atIndex:(NSUInteger)index;

@end
