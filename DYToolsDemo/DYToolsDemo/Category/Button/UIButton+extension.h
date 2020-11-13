//
//  UIButton+Extend.h
//  QHZC
//
//  Created by Cash on 30/9/16.
//  Copyright © 2016年 QHJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extension)

+(instancetype)buttonWithTitle:(nullable NSString *)title font:(CGFloat)fontFloat titleColor:(nullable UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor forState:(UIControlState)forState  addTarget:(nullable id)addTarget action:(NSString *)action isCorner:(BOOL)isCorner;

@end
