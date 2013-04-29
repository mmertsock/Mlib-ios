//
//  NSStringTests.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/28/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "NSStringTests.h"
#import "Mlib_iOS.h"

@implementation NSStringTests

- (void)testIsAppendingTextWithRangeReplacementString
{
    NSString *orig = @"orig";
    
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(3, 1) replacementString:@""], @"deleting last character");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(0, 1) replacementString:@""], @"deleting first character");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(0, 0) replacementString:@"X"], @"inserting at start");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(3, 0) replacementString:@"X"], @"inserting before end");
    STAssertEquals(YES, [orig isAppendingTextWithRange:NSMakeRange(4, 0) replacementString:@"X"], @"adding to end");
    
    // Whenever existing characters are being replaced, do not consider
    // this to be appending text. "appending text" is more of the simple
    // case of typing at the end of a string when there is no selection.
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(3, 1) replacementString:@"X"], @"replacing at end");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(2, 2) replacementString:@"XYZ"], @"replacing at end with longer");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(2, 2) replacementString:@"X"], @"replacing at end with shorter");
    STAssertEquals(NO, [orig isAppendingTextWithRange:NSMakeRange(2, 1) replacementString:@"X"], @"replacing in center");
}

@end
