//
//  UIView+shadowAndRadius.m
//  QHZC_DEV
//
//  Created by Vincent on 2019/4/7.
//  Copyright © 2019 QHJF. All rights reserved.
//

#import "UIView+shadowAndRadius.h"

@implementation UIView (shadowAndRadius)

- (void)makeCornerRadius:(CGFloat)radius AndIsShadow:(BOOL)isShadow ShadowColor:(UIColor *)shadowColor ShadowOffset:(CGSize)shadowOffset ShadowOpacity:(CGFloat)shadowOpacity ShadowRadius:(CGFloat)shadowRadius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    if(isShadow)
    {
        self.layer.shadowColor = shadowColor.CGColor;
        self.layer.shadowOffset = shadowOffset;
        self.layer.shadowOpacity = shadowOpacity;
        self.layer.shadowRadius = shadowRadius;
    }
}


/// 圆角
/// 使用自动布局，需要在layoutsubviews 中使用
/// MinXMinY 右下 MaxXMinY 右上
/// MinXMaxY 左下 MinXMinY 左上
/// @param radius 圆角尺寸
/// @param corner 圆角位置
/// @param cornerMask iOS11圆角位置

- (void)radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner CACornerMask:(CACornerMask)cornerMask
{
    
    self.clipsToBounds = true;
    if (@available(iOS 11.0, *)) {
        self.layer.cornerRadius = radius;
        self.layer.maskedCorners = (CACornerMask)corner;

    } else {
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;

    }
}

@end
