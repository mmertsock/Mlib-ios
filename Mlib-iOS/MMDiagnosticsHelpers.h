//
//  MMDiagnosticsHelpers.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 2/1/14.
//  Copyright (c) 2014 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIDevice;

@interface MMDiagnosticsHelpers : NSObject

+ (NSDictionary *)infoDictionary;

+ (NSDictionary *)infoForBundle:(NSBundle *)bundle
                         locale:(NSLocale *)locale
                         device:(UIDevice *)device;

@end
