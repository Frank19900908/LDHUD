//
//  SevenController.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "SevenController.h"
#import "LDHUDTool.h"

@interface SevenController ()

@end

@implementation SevenController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 80, 50);
    [btn setTitle:@"弹窗" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    [LDHUDTool showHUDWithTitle:@"密文输入" placeholderText:@"请输入你的密码" isSecureTextEntry:YES sureBtnText:@"确定" cancalBtnText:@"忘记密码" sureBtnCb:^(NSString *input) {
        NSLog(@"你的密码是：%@", input);
    } cancalBtnCb:^{
        NSLog(@"点击忘记密码");
    }];
}

@end
