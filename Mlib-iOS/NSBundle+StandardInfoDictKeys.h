//
//  NSBundle+StandardInfoDictKeys.h
//  Mlib-iOS
//
//  Created by Mike on 12/19/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (StandardInfoDictKeys)
@property (nonatomic, readonly) NSString* versionString;
@property (nonatomic, readonly) NSString* buildNumberString;
@end
