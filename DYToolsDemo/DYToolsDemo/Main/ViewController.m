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

- (IBAction)showHUD:(id)sender {
    NSNumber *num = [NSNumber numberWithDouble:69.9];
    NSLog(@"%@\n%@", num.stringValue, num.dw_decimalString);
    DYHudTool *hud = [DYHudTool showHud:self.view text:num.dw_priceString];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DYHudTool hideHud:self.view];
    });
}


@end
