//
//  UIStoryboardSegue+MMNavigationController.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 7/7/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "UIStoryboardSegue+MMNavigationController.h"

@implementation UIStoryboardSegue (MMNavigationController)

- (id)topLevelDestinationViewController
{
    id dest = self.destinationViewController;
    if ([dest isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nav = dest;
        dest = nav.topViewController;
    }
    return dest;
}

@end
