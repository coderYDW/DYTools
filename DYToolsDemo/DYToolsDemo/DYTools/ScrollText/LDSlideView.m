//
//  LDSlideView.m
//  QHZC_DEV
//
//  Created by Apple on 2019/7/18.
//  Copyright © 2019 QHJF. All rights reserved.
//

#import "LDSlideView.h"

@interface LDSlideView ()

@property (nonatomic, strong) UILabel *textFirstLabel;
@property (nonatomic, strong) UILabel *textSecondLabel;
@property (nonatomic, strong) UIView *slideView;

@end

@implementation LDSlideView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    //设置UI
    [self setupUI];
    
}

- (void)setupUI {
    [self addSubview:self.slideView];
    [self.slideView addSubview:self.textFirstLabel];
    [self.slideView addSubview:self.textSecondLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
//        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [self.textFirstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.slideView);
        make.centerY.equalTo(self.slideView);
    }];
    
    [self.textSecondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textFirstLabel.mas_right).offset(100);
        make.centerY.equalTo(self.slideView);
    }];
    
}


- (UIView *)slideView {
    if (_slideView == nil) {
        _slideView = [[UIView alloc] init];
        _slideView.backgroundColor = [UIColor clearColor];
        //        _slideView.layer.masksToBounds = YES;
    }
    return _slideView;
}

- (UILabel *)textFirstLabel {
    if (_textFirstLabel == nil) {
        _textFirstLabel = [UILabel labelWithText:@"" font:12 textColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] isSizeToFit:YES];
    }
    return _textFirstLabel;
}

- (UILabel *)textSecondLabel {
    if (_textSecondLabel == nil) {
        _textSecondLabel = [UILabel labelWithText:@"" font:12 textColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] isSizeToFit:YES];
    }
    return _textSecondLabel;
}

- (void)setText:(NSString *)text {
    _text = text;
    
    [self removeAnimation];
    
    self.textFirstLabel.text = text;
    self.textSecondLabel.text = text;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGFloat font = self.textFont ? self.textFont : 12;
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:font];
        CGSize size =  [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        
        CGFloat distance = size.width + 100 - CGRectGetWidth(self.slideView.frame)*0.5;
        CGFloat kSpeed = self.kSpeed ? self.kSpeed : 50.0;
        
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(-distance, CGRectGetHeight(self.bounds) * 0.5)];
        basicAnimation.duration = distance/kSpeed;
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.repeatCount = CGFLOAT_MAX;
        
        [self.slideView.layer addAnimation:basicAnimation forKey:@"moveLoopAnimation001"];
        
    });

}

- (void)removeAnimation {
    [self.slideView.layer removeAnimationForKey:@"moveLoopAnimation001"];
}

-(void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textFirstLabel.textColor = textColor;
    self.textSecondLabel.textColor = textColor;
}

- (void)setTextFont:(CGFloat)textFont {
    _textFont = textFont;
    self.textFirstLabel.font = [UIFont systemFontOfSize:textFont];
    self.textSecondLabel.font = [UIFont systemFontOfSize:textFont];
}

@end
