//
//  MMScopeNavigationBar.m
//  Mlib-iOS
//
//  Created by Mike Mertsock on 11/21/13.
//  Copyright (c) 2013 Mike Mertsock. All rights reserved.
//

#import "MMScopeNavigationBar.h"

static const CGFloat SCOPE_HEIGHT = 44.0f;

@interface MMScopeNavigationBar ()
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
- (void)configureAppearance;
@end

@implementation MMScopeNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configureAppearance];
    }
    return self;
}

- (void)awakeFromNib
{
    [self configureAppearance];
}

- (void)configureAppearance
{
    [self setTitleVerticalPositionAdjustment:-SCOPE_HEIGHT
                               forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearanceWhenContainedIn:[MMScopeNavigationBar class], nil]
     setBackgroundVerticalPositionAdjustment:-SCOPE_HEIGHT forBarMetrics:UIBarMetricsDefault];
}

- (void)setSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (_segmentedControl)
        [_segmentedControl removeFromSuperview];
    _segmentedControl = segmentedControl;
    if (_segmentedControl)
        [self addSubview:_segmentedControl];
}

- (void)setSegmentedControlTitles:(NSArray *)titles
{
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:titles];
    seg.segmentedControlStyle = UISegmentedControlStyleBar;
    self.segmentedControl = seg;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    size.width = self.frame.size.width;
    size.height = 2 * SCOPE_HEIGHT;
    return size;
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    if ([subview isKindOfClass:[UIToolbar class]]) {
        CGRect frame = subview.frame;
        subview.frame = CGRectMake(frame.origin.x, frame.origin.y + SCOPE_HEIGHT, frame.size.width, frame.size.height);
    } else if ([subview isKindOfClass:[UISegmentedControl class]]) {
        CGRect frame = subview.frame;
        CGFloat x = 0.5f * (self.bounds.size.width - frame.size.width);
        subview.frame = CGRectMake(x, frame.origin.y + SCOPE_HEIGHT, frame.size.width, frame.size.height);
    }
}

@end
