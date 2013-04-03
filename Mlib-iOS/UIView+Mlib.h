//
//  UIView+Mlib.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 4/2/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Mlib)

+ (CGFloat)mm_phoneKeyboardPortraitStandardHeight;

+ (NSTimeInterval)mm_defaultKeyboardAnimationDuration;

+ (void)mm_animateConditionally:(BOOL)animate
                   withDuration:(NSTimeInterval)duration
                          block:(void (^)(void))animationsOrImmediateChanges;

@end
