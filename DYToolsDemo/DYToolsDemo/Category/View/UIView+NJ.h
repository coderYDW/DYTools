//
//  HP_TopTitleView.m
//  TopTitle
//
//  Created by 胡鹏 on 9/22/16.
//  Copyright © 2016 Vince. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIView (NJ)

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

- (UIView *)getParsentView:(UIView *)view;

@end
