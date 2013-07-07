//
//  UIStoryboardSegue+MMNavigationController.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 7/7/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboardSegue (MMNavigationController)

// Gets destinationViewCotroller. But if that controller
// is a NavigationController, returns the nav controller's
// top level view controller instead.
@property (readonly) id topLevelDestinationViewController;

@end
