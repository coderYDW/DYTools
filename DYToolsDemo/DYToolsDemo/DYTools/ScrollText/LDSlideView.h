//
//  LDSlideView.h
//  QHZC_DEV
//
//  Created by Apple on 2019/7/18.
//  Copyright © 2019 QHJF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDSlideView : UIView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign) CGFloat textFont;

@property (nonatomic, assign) CGFloat kSpeed;

- (void)removeAnimation;

@end

NS_ASSUME_NONNULL_END
