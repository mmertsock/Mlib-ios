//
//  NSURL+StandardDirectories.h
//  Mlib-iOS
//
//  Created by Mike on 12/13/12.
//  Copyright (c) 2012 Mike Mertsock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (StandardDirectories)

/////////////////////////////////////////////////////////////////////////
#pragma mark - App & User Directory convenience functions
/////////////////////////////////////////////////////////////////////////

/** Returns an NSURL representing the first path found matching the specified constants or nil if none */
+ (NSURL *)URLForDirectory:(NSSearchPathDirectory)directoryConstant domainMask:(NSSearchPathDomainMask)domainMask;

/** Returns the application support directory with the app's bundle id appended.  As recommended in the Fil System Programming Guide */
+ (NSURL *)URLForApplicationSupportDataDirectory;

/** Append a subfolder/file path onto the app data directory */
+ (NSURL *)URLForApplicationSupportWithAppendedPath:(NSString *)pathToAppend;

/** Returns the user directory */
+ (NSURL *)URLForUserDirectory;

/** Append a subfolder/file path onto the user directory */
+ (NSURL *)URLForUserDirectoryWithAppendedPath:(NSString *)pathToAppend;

/** Returns the user's document directory */
+ (NSURL *)URLForDocumentDirectory;

/** Append a subfolder/file path onto the user's document directory */
+ (NSURL *)URLForDocumentDirectoryWithAppendedPath:(NSString *)pathToAppend;

/** Returns the user's caches directory */
+ (NSURL *)URLForCachesDirectory;

/** Append a subfolder/file path onto the user's caches directory */
+ (NSURL *)URLForCachesDirectoryWithAppendedPath:(NSString *)pathToAppend;

@end
