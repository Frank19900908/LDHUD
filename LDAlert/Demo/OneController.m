//
//  OneController.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "OneController.h"
#import "LDHUDTool.h"

@interface OneController ()

@end

@implementation OneController

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
#if 1
    [LDHUDTool showHUDWithTitle:@"消息提示" message:@"好好学习，天天向上!" btnTextArray:@[@"确定", @"取消"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:^{
        NSLog(@"点击取消");
    }];
#endif
    
#if 0
    [LDHUDTool showHUDWithTitle:nil message:@"好好学习，天天向上!" btnTextArray:@[@"确定", @"取消"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:^{
        NSLog(@"点击取消");
    }];
#endif
    
#if 0
    [LDHUDTool showHUDWithTitle:nil message:@"好好学习，天天向上!" btnTextArray:@[@"确定"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:nil];
#endif
}

@end
