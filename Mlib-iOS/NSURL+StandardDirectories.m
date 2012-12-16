//
//  NSURL+StandardDirectories.m
//  Mlib-iOS
//
//  Created by Mike on 12/13/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import "NSURL+StandardDirectories.h"

@implementation NSURL (StandardDirectories)

/////////////////////////////////////////////////////////////////////////
#pragma mark - App & User Directory convenience functions
/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForDirectory:(NSSearchPathDirectory)directoryConstant domainMask:(NSSearchPathDomainMask)domainMask
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:directoryConstant
                                             inDomains:domainMask];
    NSURL* url = nil;
    
    if ([possibleURLs count] >= 1) {
        // Use the first directory (if multiple are returned)
        url = [possibleURLs objectAtIndex:0];
    }
    
    return url;
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForApplicationSupportDataDirectory
{
    NSURL *appSupportDir = [self URLForDirectory:NSApplicationSupportDirectory domainMask:NSUserDomainMask];
    
    // If a valid app support directory exists, add the
    // app's bundle ID to it to specify the final directory.
    if (appSupportDir) {
        NSString* appBundleID = [[NSBundle mainBundle] bundleIdentifier];
        return [appSupportDir URLByAppendingPathComponent:appBundleID];
    } else
        return nil;
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForApplicationSupportWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForApplicationSupportDataDirectory] URLByAppendingPathComponent:pathToAppend];
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForUserDirectory
{
    return [self URLForDirectory:NSUserDirectory domainMask:NSUserDomainMask];
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForUserDirectoryWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForUserDirectory] URLByAppendingPathComponent:pathToAppend];
    
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForDocumentDirectory
{
    return [self URLForDirectory:NSDocumentDirectory domainMask:NSUserDomainMask];
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForDocumentDirectoryWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForDocumentDirectory] URLByAppendingPathComponent:pathToAppend];
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForCachesDirectory
{
    return [self URLForDirectory:NSCachesDirectory domainMask:NSUserDomainMask];
}

/////////////////////////////////////////////////////////////////////////

+ (NSURL *)URLForCachesDirectoryWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForCachesDirectory] URLByAppendingPathComponent:pathToAppend];
}

@end
