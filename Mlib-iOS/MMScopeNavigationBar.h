//
//  MMScopeNavigationBar.h
//  Mlib-iOS
//
//  Created by Mike Mertsock on 11/21/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMScopeNavigationBar : UINavigationBar

@property (nonatomic, readonly) UISegmentedControl *segmentedControl;

- (void)setSegmentedControlTitles:(NSArray *)titles;

@end
