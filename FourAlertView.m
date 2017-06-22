//
//  FourAlertView.m
//  LDAlert
//
//  Created by Frank on 17/6/21.
//  Copyright © 2017年 Raythonsoft Mac 02. All rights reserved.
//

#import "FourAlertView.h"

#define kInputMaxLength 16

@interface FourAlertView ()<UITextFieldDelegate>

@property (nonatomic, copy) FourAlertViewClickSureBtnCallBack sureBtnCallBack;
@property (nonatomic, copy) FourAlertViewClickCancalBtnCallBack cancalBtnCallBack;

@end

@implementation FourAlertView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title placeholderText:(NSString *)placeholder isSecureTextEntry:(BOOL)isSecureTextEntry sureBtnText:(NSString *)sureBtnText cancalBtnText:(NSString *)cancalBtnText sureBtnCb:(FourAlertViewClickSureBtnCallBack)sureBtnCb cancalBtnCb:(FourAlertViewClickCancalBtnCallBack)cancalBtnCb
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        // 回调
        self.sureBtnCallBack = sureBtnCb;
        self.cancalBtnCallBack = cancalBtnCb;
        // sureBtn
        CGFloat sureBtnW = (self.bounds.size.width - 1) / 2.0;
        CGFloat sureBtnH = 45;
        CGFloat sureBtnX = 0;
        CGFloat sureBtnY = self.bounds.size.height - sureBtnH;
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        sureBtn.frame = CGRectMake(sureBtnX, sureBtnY, sureBtnW, sureBtnH);
        [sureBtn setTitle:sureBtnText forState:UIControlStateNormal];
        sureBtn.tintColor = [UIColor blueColor];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sureBtn];
        // cancalBtn
        CGFloat cancalBtnW = sureBtn.bounds.size.width;
        CGFloat cancalBtnH = sureBtn.bounds.size.height;
        CGFloat cancalBtnX = self.bounds.size.width - cancalBtnW;
        CGFloat cancalBtnY = sureBtn.frame.origin.y;
        UIButton *cancalBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        cancalBtn.frame = CGRectMake(cancalBtnX, cancalBtnY, cancalBtnW, cancalBtnH);
        [cancalBtn setTitle:cancalBtnText forState:UIControlStateNormal];
        cancalBtn.tintColor = [UIColor redColor];
        cancalBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancalBtn addTarget:self action:@selector(cancalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancalBtn];
        // lineHView
        CGFloat lineHViewX = CGRectGetMaxX(sureBtn.frame);
        CGFloat lineHViewY = sureBtn.frame.origin.y;
        CGFloat lineHViewW = 1;
        CGFloat lineHViewH = sureBtn.bounds.size.height;
        UIView *lineHView = [[UIView alloc] initWithFrame:CGRectMake(lineHViewX, lineHViewY, lineHViewW, lineHViewH)];
        lineHView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
        [self addSubview:lineHView];
        // lineView
        CGFloat lineViewW = self.bounds.size.width;
        CGFloat lineViewH = 1;
        CGFloat lineViewX = sureBtn.frame.origin.x;
        CGFloat lineViewY = sureBtn.frame.origin.y - lineViewH;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH)];
        lineView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1];
        [self addSubview:lineView];
        // titleLabel
        CGFloat titleLabelX = 15;
        CGFloat titleLabelY = 0;
        CGFloat titleLabelW = self.bounds.size.width - titleLabelX * 2;
        CGFloat titleLabelH = (lineView.frame.origin.y - 20) / 2.0;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH)];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        // inputFeild
        CGFloat inputFieldX = titleLabel.frame.origin.x;
        CGFloat inputFieldY = CGRectGetMaxY(titleLabel.frame);
        CGFloat inputFieldW = titleLabel.bounds.size.width;
        CGFloat inputFieldH = titleLabel.bounds.size.height;
        UITextField *inputField = [[UITextField alloc] initWithFrame:CGRectMake(inputFieldX, inputFieldY, inputFieldW, inputFieldH)];
        inputField.borderStyle = UITextBorderStyleRoundedRect;
        inputField.placeholder = placeholder;
        inputField.font = [UIFont systemFontOfSize:15];
        inputField.textColor = [UIColor lightGrayColor];
        inputField.returnKeyType = UIReturnKeyDone;
        inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
        inputField.secureTextEntry = isSecureTextEntry;
        inputField.delegate = self;
        inputField.tag = 101;
        [self addSubview:inputField];
        
        // 注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:nil];
    }
    return self;
}

#pragma mark - 按钮点击事件
// 1.确定
- (void)sureBtnClick:(UIButton *)sender
{
    [self endEditing:YES];
    if (self.sureBtnCallBack) {
        UITextField *inputField = [self viewWithTag:101];
        self.sureBtnCallBack(inputField.text);
    }
}
// 2.取消
- (void)cancalBtnClick:(UIButton *)sender
{
    [self endEditing:YES];
    if (self.cancalBtnCallBack) {
        self.cancalBtnCallBack();
    }
}

#pragma mark - <UITextFieldDelegate>代理协议方法
// 1.点击return调用 - 使textField失去第一响应者
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
// 2.文本输入时调用(不可以输入空格)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL res = YES;
    NSCharacterSet *tmpSet = [NSCharacterSet characterSetWithCharactersInString:@" "];
    int i = 0;
    while (i < string.length) {
        NSString *subString = [string substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [subString rangeOfCharacterFromSet:tmpSet];
        if (range.length > 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

#pragma mark - 通知事件
// 输入文本时调用
- (void)textFiledEditChanged:(NSNotification *)notification
{
    // 限制长度输入
    // 键盘输入模式
    UITextField *inputField = [self viewWithTag:101];
    NSString *lang = [inputField.textInputMode primaryLanguage];
    // 简体中文输入，包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"]) {
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (inputField.text.length > kInputMaxLength) {
            inputField.text = [inputField.text substringToIndex:kInputMaxLength];
            // 清除undoManager
            [inputField.undoManager removeAllActions];
        }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    } else {
        if (inputField.text.length > kInputMaxLength) {
            inputField.text = [inputField.text substringToIndex:kInputMaxLength];
            // 清除undoManager
            [inputField.undoManager removeAllActions];
        }
    }
}

#pragma mark - 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:nil];
}

@end
