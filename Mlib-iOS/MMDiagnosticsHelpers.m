//
//  MMDiagnosticsHelpers.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 2/1/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import "MMDiagnosticsHelpers.h"
#import "NSBundle+StandardInfoDictKeys.h"
#import "UIDevice+Hardware.h"

@implementation MMDiagnosticsHelpers

+ (NSDictionary *)infoDictionary
{
    return [self infoForBundle:[NSBundle mainBundle]
                        locale:[NSLocale currentLocale]
                        device:[UIDevice currentDevice]];
}

+ (NSDictionary *)infoForBundle:(NSBundle *)bundle
                         locale:(NSLocale *)locale
                         device:(UIDevice *)device
{
    id versionInfo = [NSString stringWithFormat:@"%@ (%@)",
                      bundle.versionString,
                      bundle.buildNumberString];
    
    id platformInfo = [NSString stringWithFormat:@"%@ %@",
                       device.systemName,
                       device.systemVersion];
    
    id deviceInfo = device.platform;
    
    id localeInfo = [NSString stringWithFormat:@"%@-%@",
                     [locale objectForKey:NSLocaleLanguageCode],
                     [locale objectForKey:NSLocaleCountryCode]];
    
    return @{@"App Version": versionInfo,
             @"iOS Version": platformInfo,
             @"Device": deviceInfo,
             @"Locale": localeInfo};
}

@end
