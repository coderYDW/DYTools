//
//  DWScrollTextViewController.m
//  DYToolsDemo
//
//  Created by Apple on 2020/11/13.
//  Copyright © 2020 DovYoung. All rights reserved.
//

#import "DWScrollTextViewController.h"
#import "LDScrollTextView.h"

@interface DWScrollTextViewController ()

@end

@implementation DWScrollTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:({
        LDScrollTextView *st = [LDScrollTextView new];
        st.frame = CGRectMake(20, 140, CGRectGetWidth(self.view.bounds) - 40, 44);
        st.text = @"nihasdlfijasdfksadgkhghsfigjhasldfjalsdkgjfsadlkgjdflghkjfjalsdkgjfsadlkgjdflghkjfjalsdkgjfsadlkgjdflghkjfjalsdkgjfsadlkgjdflghkj";
        st;
    })];
}



@end
