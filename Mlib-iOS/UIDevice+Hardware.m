//
//  UIDevice+Hardware.m
//  Mlib-iOS
//
//  Created by Mike on 12/19/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//
// See https://github.com/erica/uidevice-extension/blob/master/UIDevice-Hardware.m

#import "UIDevice+Hardware.h"
#include <sys/sysctl.h>

NSString* getSystemInfoForIdentifier(char * typeSpecifier)
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

@implementation UIDevice (Hardware)


- (NSString *)platform
{
    return getSystemInfoForIdentifier("hw.machine");
}

@end
