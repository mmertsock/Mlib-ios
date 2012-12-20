//
//  NSBundle+StandardInfoDictKeys.m
//  Mlib-iOS
//
//  Created by Mike on 12/19/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import "NSBundle+StandardInfoDictKeys.h"

@implementation NSBundle (StandardInfoDictKeys)

- (NSString *)versionString
{
    return self.infoDictionary[@"CFBundleShortVersionString"];
}

- (NSString *)buildNumberString
{
    return self.infoDictionary[@"CFBundleVersion"];
}

@end
