//
//  SixController.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "SixController.h"
#import "LDHUDTool.h"

@interface SixController ()

@end

@implementation SixController

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
    [LDHUDTool showHUDWithTitle:@"明文输入" placeholderText:@"请输入你的姓名" isSecureTextEntry:NO sureBtnText:@"确定" cancalBtnText:@"取消" sureBtnCb:^(NSString *input) {
        NSLog(@"你的姓名是：%@", input);
    } cancalBtnCb:^{
        NSLog(@"点击取消");
    }];
}

@end
