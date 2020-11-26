//
//  DYHudTool.m
//  HUDDemo
//
//  Created by DovYoung on 2017/1/4.
//  Copyright © 2017年 DovYoung. All rights reserved.
//

#import "DYHudTool.h"

#define ROTATE_WIDTH 60
#define LOGO_WIDTH 50
#define TEXT_FONT_SIZE 15
#define TEXT_EDGE 15
#define BACKGROUND_WIDTH 100

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DYHudTool ()

//子控件
@property (nonatomic, strong) UIImageView *logoImage; //标题
@property (nonatomic, strong) UIImageView *rotateImage; //旋转图片
@property (nonatomic, strong) UIView *bottomView; //背景提示
@property (nonatomic, strong) UILabel *hudText; //hud文字显示
@property (nonatomic, strong) UILabel *text; //纯文字
@property (nonatomic, strong) UIActivityIndicatorView *AIView; //默认提示

@end

@implementation DYHudTool

#pragma mark - 文字提示
+ (DYHudTool *)showText:(NSString *)text hideDelayAfter:(NSTimeInterval)interval {
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    for (UIView *sub in window.subviews) {
        
        if ([sub isKindOfClass:[self class]]) {
            
            [self hideHud:window];
            
        }
        
    }
    
    //hudView
    DYHudTool *hudView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    hudView.userInteractionEnabled = YES;
    
    [window addSubview:hudView];
    
    //textLabel
    UILabel *textLabel = [self text];
    
    hudView.text = textLabel;
    
    textLabel.font = [UIFont systemFontOfSize:TEXT_FONT_SIZE];
    
    textLabel.text = text;
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 2 * TEXT_EDGE,
                                                        SCREEN_HEIGHT - 2 * TEXT_EDGE)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{
                                               NSFontAttributeName:[UIFont systemFontOfSize:TEXT_FONT_SIZE]
                                               }
                                     context:nil].size;
    
    textLabel.frame = CGRectMake(0,
                                 0,
                                 size.width + TEXT_EDGE * 2,
                                 size.height + TEXT_EDGE * 2);
    
    textLabel.center = CGPointMake(SCREEN_WIDTH / 2,
                                   SCREEN_HEIGHT / 2);
    
    textLabel.backgroundColor = [self defaultColor];
    
    textLabel.textColor = [UIColor blackColor];
    
    textLabel.alpha = 1;
    
    textLabel.layer.cornerRadius = TEXT_EDGE / 2;
    
    textLabel.layer.masksToBounds = YES;
    
    [hudView addSubview:textLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [hudView removeFromSuperview];
        
    });
    
    return hudView;
}

#pragma mark - 转圈提示

+ (DYHudTool *)showHud:(id)target text:(NSString *)text {
    
    BOOL haveText = text && text.length;
    
    //hudView
    DYHudTool *hudView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    hudView.userInteractionEnabled = YES;
    [target addSubview:hudView];
    
    //bottomView
    UIView *bottomView = [self bottomView];
    hudView.bottomView = bottomView;
    [hudView addSubview:bottomView];
    
    CGFloat bottomHeight = BACKGROUND_WIDTH;
    CGFloat bottomWidth = BACKGROUND_WIDTH;
    
    if (haveText) {
        
        CGSize size = [self sizeFromText:text
                                    font:15
                               limitSize:CGSizeMake(SCREEN_WIDTH,
                                                    SCREEN_HEIGHT)];
        
        bottomHeight += size.height;
        
        bottomWidth = BACKGROUND_WIDTH > size.width + TEXT_EDGE ? BACKGROUND_WIDTH : size.width + TEXT_EDGE;
        
    }
    
    bottomView.frame = CGRectMake(0,
                                  0,
                                  bottomWidth,
                                  bottomHeight);
    
    bottomView.center = CGPointMake(SCREEN_WIDTH / 2,
                                    SCREEN_HEIGHT / 2);
    
    //ActivityIndicatorView
    UIActivityIndicatorView *AIView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [AIView startAnimating];
    [bottomView addSubview:AIView];
    
    AIView.frame = CGRectMake(0,
                              0,
                              ROTATE_WIDTH,
                              ROTATE_WIDTH);
    
    AIView.center = CGPointMake(bottomWidth / 2,
                                BACKGROUND_WIDTH / 2);
    
    //text
    UILabel *textLabel = [self text];
    hudView.hudText = textLabel;
    textLabel.text = text;
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:textLabel];
    textLabel.hidden = text && text.length ? NO : YES;
    
    textLabel.frame = CGRectMake(0,
                                 (BACKGROUND_WIDTH + ROTATE_WIDTH) / 2,
                                 bottomWidth,
                                 bottomHeight - BACKGROUND_WIDTH);
    
    return hudView;
    
}


+ (DYHudTool *)showCustomHud:(id)target text:(NSString *)text logo:(UIImage *)logo {
    
    BOOL haveText = text && text.length;
    
    //hudView
    DYHudTool *hudView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    hudView.userInteractionEnabled = YES;
    
    [target addSubview:hudView];
    
    //bottomView
    UIView *bottomView = [self bottomView];
    
    hudView.bottomView = bottomView;
    
    [hudView addSubview:bottomView];
    
    CGFloat backgroundHeight = BACKGROUND_WIDTH;
    
    if (haveText) {
        
        backgroundHeight += 30;
        
    }
    
    bottomView.frame = CGRectMake(0,
                                      0,
                                      BACKGROUND_WIDTH,
                                      backgroundHeight);
    
    bottomView.center = CGPointMake(SCREEN_WIDTH / 2,
                                        SCREEN_HEIGHT / 2);
    
    //rotateView
    UIImageView *rotateImage = [self rotateImage];
    
    hudView.rotateImage = rotateImage;
    
    [bottomView addSubview:rotateImage];
    
    rotateImage.frame = CGRectMake(0,
                                   0,
                                   ROTATE_WIDTH,
                                   ROTATE_WIDTH);
    
    rotateImage.center = CGPointMake(BACKGROUND_WIDTH / 2,
                                     BACKGROUND_WIDTH / 2);
    
    //logoView
    UIImageView *logoImage = [self logoImage];
    
    logoImage.image = logo;
    
    hudView.logoImage = logoImage;
    
    [bottomView addSubview:logoImage];
    
    [rotateImage.layer addAnimation:[self animation] forKey:@"dov_rotate"];
    
    logoImage.frame = CGRectMake(0,
                                 0,
                                 LOGO_WIDTH,
                                 LOGO_WIDTH);
    
    logoImage.center = CGPointMake(BACKGROUND_WIDTH / 2,
                                   BACKGROUND_WIDTH / 2);
    
    //text
    UILabel *textLabel = [self text];
    
    hudView.hudText = textLabel;
    
    textLabel.text = text;
    
    textLabel.font = [UIFont systemFontOfSize:15];
    
    [bottomView addSubview:textLabel];
    
    textLabel.hidden = text && text.length ? NO : YES;
    
    textLabel.frame = CGRectMake(0,
                                 (BACKGROUND_WIDTH + ROTATE_WIDTH) / 2,
                                 BACKGROUND_WIDTH,
                                 30);
    
    return hudView;
    
}


/**
 *  隐藏 DYProgressHUD 提示符
 *
 *  @param target 目标
 */
+ (void)hideHud:(id)target {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        DYHudTool *hudView = [self HUDForView:target];
        
        [hudView.rotateImage.layer removeAnimationForKey:@"dov_rotate"];
        
        [hudView removeFromSuperview];
        
    });
    
}

#pragma mark - 遍历子模块
+ (DYHudTool *)HUDForView:(UIView *)view {
    
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    
    for (UIView *subview in subviewsEnum) {
        
        if ([subview isKindOfClass:self]) {
            
            return (DYHudTool *)subview;
            
        }
        
    }
    
    return nil;
    
}

#pragma mark - 创建子模块
+ (CAAnimation *)animation {
    
    //旋转
    CABasicAnimation * tranformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    tranformAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    
    tranformAnimation.toValue = [NSNumber numberWithFloat:M_PI];
    
    tranformAnimation.cumulative = YES;
    
    tranformAnimation.removedOnCompletion = YES;
    
    tranformAnimation.repeatCount = FLT_MAX;
    
    tranformAnimation.duration = 0.5;
    
    return tranformAnimation;
    
}

+ (UIImageView *)logoImage {
    
    UIImageView *logoImage = [[UIImageView alloc] init];
    
    return logoImage;
    
}

+ (UIImageView *)rotateImage {
    
    UIImageView *rotateImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rotateCircle"]];
    
    return rotateImage;
    
}

+ (UIView *)bottomView {
    
    UIView *bgView = [UIView new];
    
    bgView.backgroundColor = [self defaultColor];
    
    bgView.layer.cornerRadius = 5;
    
    bgView.layer.masksToBounds = YES;
    
    return bgView;
    
}

+ (UILabel *)text {
    
    UILabel *text = [[UILabel alloc] init];
    
    text.font = [UIFont systemFontOfSize:20];
    
    text.textAlignment = NSTextAlignmentCenter;
    
    text.textColor = [UIColor blackColor];
    
    text.backgroundColor = [self defaultColor];
    
    text.numberOfLines = 0;
    
    return text;
    
}

#pragma mark - 属性设置

+ (UIColor *)defaultColor {
    
    CGFloat colorRGBFloat = 210.0f;
    
    return [UIColor colorWithRed:colorRGBFloat/255.0
                           green:colorRGBFloat/255.0
                            blue:colorRGBFloat/255.0
                           alpha:1];
    
}

- (void)setBottomColor:(UIColor *)bottomColor {
    
    _bottomColor = bottomColor;
    
    if (self.bottomView) {
        
        self.bottomView.backgroundColor = bottomColor;
        
    }
    
    if (self.text) {
        
        self.text.backgroundColor = bottomColor;
        
    }
    
}

- (void)setBottomAlpha:(CGFloat)bottomAlpha {
    
    _bottomAlpha = bottomAlpha;
    
    if (self.bottomView) {
        
        self.bottomView.alpha = bottomAlpha;
        
    }
    
}

- (void)setTextColor:(UIColor *)textColor {

    _textColor = textColor;
    
    if (self.text) {
        
        self.text.textColor = textColor;
        
    }
    
}

- (void)setHudTextColor:(UIColor *)hudTextColor {
    
    _hudTextColor = hudTextColor;
    
    if (self.hudText) {
        
        self.hudText.textColor = hudTextColor;
        
    }
    
}

#pragma mark - 根据文字得出size

+ (CGSize)sizeFromText:(NSString *)text
                  font:(CGFloat)font
             limitSize:(CGSize)limitSize {

    return [text boundingRectWithSize:limitSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{
                                        NSFontAttributeName:[UIFont systemFontOfSize:font]
                                        }
                              context:nil].size;

}

@end
