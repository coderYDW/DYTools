//
//  LDScrollTextView.h
//  QHZC_DEV
//
//  Created by Apple on 2020/7/23.
//  Copyright © 2020 QHJF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDScrollTextView : UIView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) UIColor *textColor;

//需要在设置text之前设置
@property (nonatomic, assign) CGFloat textFont;
@property (nonatomic, assign) CGFloat kSpeed;

- (void)removeAnimation;

@end

NS_ASSUME_NONNULL_END
