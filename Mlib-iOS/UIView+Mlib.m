//
//  UIView+Mlib.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/2/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "UIView+Mlib.h"

@implementation UIView (Mlib)

+ (CGFloat)mm_phoneKeyboardPortraitStandardHeight
{
    return 216.0f;
}

+ (NSTimeInterval)mm_defaultKeyboardAnimationDuration
{
    return 0.25f;
}

+ (void)mm_animateConditionally:(BOOL)animate
                   withDuration:(NSTimeInterval)duration
                          block:(void (^)(void))animationsOrImmediateChanges
{
    if (animate)
        [UIView animateWithDuration:duration animations:animationsOrImmediateChanges];
    else
        animationsOrImmediateChanges();
}

@end
