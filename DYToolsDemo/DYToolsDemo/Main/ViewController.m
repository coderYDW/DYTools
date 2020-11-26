//
//  ViewController.m
//  DYToolsDemo
//
//  Created by Yangdongwu on 16/8/23.
//  Copyright © 2016年 DovYoung. All rights reserved.
//

#import "ViewController.h"
#import "DWRegularTool.h"
#import "DWScrollTextViewController.h"
#import "NSNumber+Format.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showScrollText:(id)sender {
    DWScrollTextViewController *stVC = [DWScrollTextViewController new];
    [self.navigationController pushViewController:stVC animated:YES];
}

@end
