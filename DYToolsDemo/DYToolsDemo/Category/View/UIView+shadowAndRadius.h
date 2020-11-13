//
//  UIView+shadowAndRadius.h
//  QHZC_DEV
//
//  Created by Vincent on 2019/4/7.
//  Copyright © 2019 QHJF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (shadowAndRadius)

- (void)makeCornerRadius:(CGFloat)radius
             AndIsShadow:(BOOL)isShadow
             ShadowColor:(UIColor *)shadowColor
            ShadowOffset:(CGSize)shadowOffset
           ShadowOpacity:(CGFloat)shadowOpacity
            ShadowRadius:(CGFloat)shadowRadius;

- (void)radiusWithRadius:(CGFloat)radius
                  corner:(UIRectCorner)corner
            CACornerMask:(CACornerMask)cornerMask;


@end

NS_ASSUME_NONNULL_END
