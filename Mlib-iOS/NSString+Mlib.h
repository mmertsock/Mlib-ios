//
//  NSString+Mlib.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/28/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Mlib)
// use this to determine if text is being appended to a string rather than
// removing or replacing characters elsewhere in the string
- (BOOL)isAppendingTextWithRange:(NSRange)range
               replacementString:(NSString *)string;
@end
