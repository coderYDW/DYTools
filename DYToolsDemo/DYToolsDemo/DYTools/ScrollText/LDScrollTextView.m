//
//  LDScrollTextView.m
//  QHZC_DEV
//
//  Created by Apple on 2020/7/23.
//  Copyright © 2020 QHJF. All rights reserved.
//

#import "LDScrollTextView.h"
#import "LDSlideView.h"

@interface LDScrollTextView ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) LDSlideView *slideView;

@end

@implementation LDScrollTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor clearColor];
    
    //设置UI
    [self setupUI];
    
}

- (void)setupUI {
    
    [self addSubview:self.textLabel];
    [self addSubview:self.slideView];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [UILabel new];
        _textLabel.text = @"";
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.numberOfLines = 1;
    }
    return _textLabel;
}

- (LDSlideView *)slideView {
    if (_slideView == nil) {
        _slideView = [[LDSlideView alloc] init];
    }
    return _slideView;
}

- (void)removeAnimation {
    [self.slideView removeAnimation];
}

-(void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textLabel.textColor = textColor;
    self.slideView.textColor = textColor;
}

- (void)setTextFont:(CGFloat)textFont {
    _textFont = textFont;
    self.textLabel.font = [UIFont systemFontOfSize:textFont];
    self.slideView.textFont = textFont;
}

- (void)setKSpeed:(CGFloat)kSpeed {
    _kSpeed = kSpeed;
    self.slideView.kSpeed = kSpeed;
}


- (void)setText:(NSString *)text {
    _text = text;
    
    self.textLabel.text = text;
    if ([self needScroll]) {
        self.slideView.text = text;
        self.slideView.hidden = NO;
        self.textLabel.hidden = YES;
    } else {
        self.slideView.hidden = YES;
        self.textLabel.hidden = NO;
    }
}

- (BOOL)needScroll {
    
    if (self.text.length <= 0) {
        return NO;
    }
    
    if (CGRectIsEmpty(self.frame)) {
        return NO;
    }
    
    CGFloat font = self.textFont ? self.textFont : 12;
    CGFloat width = [self getWidthOfString:font text:self.text];
    if (width >= CGRectGetWidth(self.frame)) {
        return YES;
    } else {
        return NO;
    }
    
}

- (CGFloat)getWidthOfString:(CGFloat)fontSize text:(NSString *)text {
    
    if (text.length <= 0) {
        return 0.0;
    }
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, [UIScreen mainScreen].bounds.size.height)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                     context:nil];
    
    return CGRectGetWidth(rect);
    
}


@end
