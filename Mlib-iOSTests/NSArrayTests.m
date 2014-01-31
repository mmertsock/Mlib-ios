//
//  NSArrayTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 5/25/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSArrayTests.h"
#import "NSArray+Mlib.h"

@implementation NSArrayTests

- (void)testArrayByRemovingObject
{
    NSArray *original = @[@"a", @"b", @"c", @"b"];
    
    NSArray *modified = [original mm_arrayByRemovingObject:nil];
    XCTAssertEqualObjects(modified, original, @"Removing nil should produce equal array");
    
    modified = [original mm_arrayByRemovingObject:@"bogus"];
    XCTAssertEqualObjects(modified, original, @"Removing item not in array should produce equal array");
    
    modified = [original mm_arrayByRemovingObject:@"a"];
    XCTAssertEqualObjects(modified, (@[@"b", @"c", @"b"]), @"The new array should not contain 'a'.");
    
    modified = [original mm_arrayByRemovingObject:@"b"];
    XCTAssertEqualObjects(modified, (@[@"a", @"c"]), @"The new array should not contain either instance of 'b'.");
}

- (void)testArrayByInsertingObjectAtIndex
{
    NSArray *original = @[@"a", @"b", @"c"];
    
    NSArray *modified = [original mm_arrayByInsertingObject:@"new"
                                                 atIndex:0];
    XCTAssertEqualObjects(modified, (@[@"new", @"a", @"b", @"c"]), @"New object is inserted at the start");
    
    modified = [original mm_arrayByInsertingObject:@"new"
                                        atIndex:(original.count - 1)];
    XCTAssertEqualObjects(modified, (@[@"a", @"b", @"new", @"c"]), @"New object is inserted in the middle");
    
    modified = [original mm_arrayByInsertingObject:@"new"
                                        atIndex:original.count];
    XCTAssertEqualObjects(modified, (@[@"a", @"b", @"c", @"new"]), @"New object is inserted at the end");
}

@end
