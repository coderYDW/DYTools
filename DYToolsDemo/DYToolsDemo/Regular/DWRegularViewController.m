//
//  DWRegularViewController.m
//  DYToolsDemo
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 DovYoung. All rights reserved.
//

#import "DWRegularViewController.h"
#import "DWRegularTool.h"

@interface DWRegularViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation DWRegularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)startAction:(id)sender {
    
    BOOL result01 = [DWRegularTool checkForMobilePhoneNo:self.textField.text];
    NSLog(@"result01 = %@", result01 ? @"YES" : @"NO");
    
//     [DWRegularTool matchPriceStr:self.textField.text];
//    NSLog(@"reult = %@", result);
//    if (result) {
//        self.resultLabel.text = result;
//    }
//    else {
//        self.resultLabel.text = @"匹配失败";
//    }
    
}


@end
