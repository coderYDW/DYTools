//
//  UIButton+Extend.m
//  QHZC
//
//  Created by Cash on 30/9/16.
//  Copyright © 2016年 QHJF. All rights reserved.
//

#import "UIButton+extension.h"
@implementation UIButton (extension)

+(instancetype)buttonWithTitle:(nullable NSString *)title font:(CGFloat)fontFloat titleColor:(nullable UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor forState:(UIControlState)forState  addTarget:(nullable id)addTarget action:(NSString *)action isCorner:(BOOL)isCorner{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:forState];
    [button setTitleColor:titleColor forState:forState];
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = [UIFont systemFontOfSize:fontFloat];
    if(isCorner){
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
    }
    if(addTarget){
        [button addTarget:addTarget action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

@end

