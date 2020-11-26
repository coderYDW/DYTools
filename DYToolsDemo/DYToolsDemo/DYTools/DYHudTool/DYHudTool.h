//
//  DYHudTool.h
//  HUDDemo
//
//  Created by DovYoung on 2017/1/4.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DYHudModeDefault,
    DYHudModeCustom,
} DYHudMode;

@interface DYHudTool : UIView


//设置
@property (nonatomic, strong) UIColor *bottomColor; //!< 底部颜色
@property (nonatomic, assign) CGFloat bottomAlpha; //!< 底部透明度
@property (nonatomic, strong) UIColor *indicatorColor; //!< 提示颜色
@property (nonatomic, strong) UIColor *textColor; //!< 文字颜色
@property (nonatomic, strong) UIColor *hudTextColor; //hud文字颜色

/**
 显示提示框,默认样式
 
 @param target 提示框载体
 @param text 文字(可为空)
 */
+ (DYHudTool *)showHud:(id)target text:(NSString *)text;

/**
 显示提示框,自定义
 
 @param target 提示框载体
 @param text 文字(可为空)
 @param logo logo图片
 */
+ (DYHudTool *)showCustomHud:(id)target text:(NSString *)text logo:(UIImage *)logo;

/**
 *  隐藏 DYProgressHUD 提示符
 *
 *  @param target 目标
 */
+ (void)hideHud:(id)target;

/**
 显示文字提示
 
 @param text 文字
 @param interval 消失时间
 */
+ (DYHudTool *)showText:(NSString *)text hideDelayAfter:(NSTimeInterval)interval;



@end
