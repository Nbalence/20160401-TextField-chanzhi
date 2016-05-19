//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passWordTextField;
@end

@implementation ViewController

-(UITextField *)userTextField {
    if (_userTextField == nil) {
        _userTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
        //占位信息
        _userTextField.placeholder = @"请输入用户名";
        //边框类型
        _userTextField.borderStyle = UITextBorderStyleRoundedRect;
//        字体、颜色
//        _userTextField.font = [UIFont systemFontOfSize:10.0];
//        _userTextField.textColor = [UIColor redColor];
        
        //对齐方式
        _userTextField.textAlignment = NSTextAlignmentLeft;
        //当编辑开始的时候清除文本
        //_userTextField.clearsOnBeginEditing = YES;
        //一键清除文本按钮显示的模式(当编辑的时候显示)
        _userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        //根据文本框宽度 文本自适应
        _userTextField.adjustsFontSizeToFitWidth = YES;
        _userTextField.minimumFontSize = 5;
        //背景(边框会影响显示效果，当边框为UITextBorderStyleNone的时候正常显示)
        _userTextField.background = [UIImage imageNamed:@"tfbg"];
        
        //设置左边视图
        UIImageView *leftUserImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"username"]];
        leftUserImageView.frame = CGRectMake(0, 0, 17, 17);
        _userTextField.leftView = leftUserImageView;
        //左视图显示的模式（默认UITextFieldViewModeNever）
        _userTextField.leftViewMode = UITextFieldViewModeUnlessEditing;
        
        
        //自定义键盘时候使用的view
//        CGFloat width = [UIScreen mainScreen].bounds.size.width;
//        UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 260)];
//        inputView.backgroundColor = [UIColor redColor];
//        _userTextField.inputView = inputView;
//        
//        UIView *accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
//        accessoryView.backgroundColor = [UIColor greenColor];
//        _userTextField.inputAccessoryView = accessoryView;
        
        //设置键盘类型为数字键盘
        _userTextField.keyboardType = UIKeyboardTypeNumberPad;
        
        //键盘显示的时候颜色深浅
        _userTextField.keyboardAppearance = UIKeyboardAppearanceDark;
        
        //设置代理
        _userTextField.delegate = self;
    }
    return _userTextField;
}

-(UITextField *)passWordTextField{
    if (_passWordTextField == nil) {
        _passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 150, 30)];
        _passWordTextField.placeholder = @"请输入密码";
        _passWordTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        //设置左边视图
        UIImageView *leftPassWordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password"]];
        leftPassWordImageView.frame = CGRectMake(0, 0, 17, 17);
        _passWordTextField.leftView = leftPassWordImageView;
        //左视图显示的模式（默认UITextFieldViewModeNever）
        _passWordTextField.leftViewMode = UITextFieldViewModeUnlessEditing;
        //设置键盘returnkey
        _passWordTextField.returnKeyType = UIReturnKeySend;
        //自动设置returnkey的可用状态
        _passWordTextField.enablesReturnKeyAutomatically = YES;
        //密文显示
        _passWordTextField.secureTextEntry = YES;
        
        _passWordTextField.delegate = self;
        
        //添加事件监听
        [_passWordTextField addTarget:self action:@selector(textFieldTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passWordTextField;
}

-(void)textFieldTextChanged:(UITextField *)textField {
    NSLog(@"textField.text：%@",textField.text);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加用户名
    [self.view addSubview:self.userTextField];
    
    //添加密码
    [self.view addSubview:self.passWordTextField];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITextFieldDelegate
//允许密码输入框编辑，用户名不可编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"%s",__func__);
    if (textField == _userTextField) {
        return YES;
    }
    //NSLog(@"%d",textField.editing);
    return YES;
}
//已经开始编辑（获取第一响应）
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //NSLog(@"%d",textField.editing);
    NSLog(@"%s",__func__);
}

//允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%s",__func__);
    return YES;
}
//已经结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{
    //NSLog(@"%d",textField.editing);
    NSLog(@"%s",__func__);
    //取消第一响应
    [textField resignFirstResponder];
}

//输入过程中是否允许输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"%s",__func__);
    //用户名不能大于11位
    if (textField == _userTextField) {
        if ((textField.text.length + string.length - range.length) > 11) {
            [self showAlert:@"您输入长度不能大于11位!"];
            return NO;
        }
    }
    
    //密码合法（字符或数字）
    
    if (textField == _passWordTextField) {
        //创建一个数字和字母集合
        NSCharacterSet *character = [NSCharacterSet alphanumericCharacterSet];
        for (int i = 0; i < string.length; i++) {
            unichar c = [string characterAtIndex:i];
            //判断集合中是否包含c
            if (![character characterIsMember:c]) {
                [self showAlert:@"您输入的密码不合法!"];
                return NO;
            }
        }
    }
    return YES;
}

//允许清除文本（当用户点击clear button 的时候调用）
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"%s",__func__);
    return YES;
}

//是否允许return（当用户点击return button的时候调用）
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"%s",__func__);
    return YES;
}



-(void)showAlert:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
