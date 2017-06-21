# LDHUD
弹窗展示、进度展示

// 1.样式一
[LDHUDTool showHUDWithTitle:@"消息提示" message:@"好好学习，天天向上!" btnTextArray:@[@"确定", @"取消"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:^{
        NSLog(@"点击取消");
}];

// 2.样式二
[LDHUDTool showHUDWithTitle:nil message:@"好好学习，天天向上!" btnTextArray:@[@"确定", @"取消"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:^{
        NSLog(@"点击取消");
}];

// 3.样式三
[LDHUDTool showHUDWithTitle:nil message:@"好好学习，天天向上!" btnTextArray:@[@"确定"] sureBtnCb:^{
        NSLog(@"点击确定");
    } cancalBtnCb:nil];
    
// 4.样式四
[LDHUDTool showHUDWithText:@"登录名和密码不能为空!"];

// 5.样式五
[LDHUDTool showHUDWithSuccessText:@"登录成功!"];

// 6.样式六
[LDHUDTool showHUDWithErrorText:@"登录失败!"];

// 7.样式七
[LDHUDTool showHUDWithProgressText:@"正在登录中..."];
[LDHUDTool hideHUDWithProgress];

// 8.样式八
[LDHUDTool showHUDWithTitle:@"明文输入" placeholderText:@"请输入你的姓名" isSecureTextEntry:NO sureBtnText:@"确定" cancalBtnText:@"取消" sureBtnCb:^(NSString *input) {
        NSLog(@"你的姓名是：%@", input);
    } cancalBtnCb:^{
        NSLog(@"点击取消");
}];

// 9.样式九
[LDHUDTool showHUDWithTitle:@"明文输入" placeholderText:@"请输入你的姓名" isSecureTextEntry:NO sureBtnText:@"确定" cancalBtnText:@"取消" sureBtnCb:^(NSString *input) {
        NSLog(@"你的姓名是：%@", input);
    } cancalBtnCb:^{
        NSLog(@"点击取消");
}];

// 10.样式十
[LDHUDTool showHUDWithTitle:@"密文输入" placeholderText:@"请输入你的密码" isSecureTextEntry:YES sureBtnText:@"确定" cancalBtnText:@"忘记密码" sureBtnCb:^(NSString *input) {
        NSLog(@"你的密码是：%@", input);
    } cancalBtnCb:^{
        NSLog(@"点击忘记密码");
}];

