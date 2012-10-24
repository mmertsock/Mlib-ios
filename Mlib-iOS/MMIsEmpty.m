//
//  MMIsEmpty.m
//  Mlib-iOS
//
//  Created by Mike on 10/23/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import "MMIsEmpty.h"

BOOL MMIsEmpty(id obj) {
	return obj == nil
        || obj == [NSNull null]
        || ([obj respondsToSelector:@selector(length)] && [(NSData *)obj length] == 0)
        || ([obj respondsToSelector:@selector(count)] && [obj count] == 0);
}


BOOL MMStringIsEmpty(NSString *s) {
    // JSON parser can return a NSNull when a string is expected.
	return s == nil || (id)s == (id)[NSNull null] || [s length] == 0;
}

BOOL MMStringIsEmptyOrWhitespace(NSString* s) {
    if (MMStringIsEmpty(s)) return YES;
    if(0 == [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length)
        return YES;
    return NO;
}
