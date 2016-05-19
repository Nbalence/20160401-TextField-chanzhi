//
//  ViewController.m
//  02-LoginDemo
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYUserViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)login:(UIButton *)sender {
    //判断用户名和密码不能为空
    if (_userNameTF.text.length == 0 || _passWordTF.text.length == 0) {
        [self showAlert:@"用户名或密码不能为空"];
    }
    //判断用户名和密码是否正确
    if ([_userNameTF.text isEqualToString:@"123456"] && [_passWordTF.text isEqualToString:@"qwertyuiop"]) {
        //利用模态方式跳转个人中心
        //下面方法会调用QYUserViewController指定初始化方法
        //QYUserViewController *userVC = [[QYUserViewController alloc] init];
        //从storyboard加载QYUserViewController
        QYUserViewController *userVC = [self.storyboard instantiateViewControllerWithIdentifier:@"uservc"];
        userVC.userNameString = _userNameTF.text;
        
        //视图切换的动画效果
        userVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        [self presentViewController:userVC animated:YES completion:^{
            _userNameTF.text = nil;
            _passWordTF.text = nil;
        }];
        
    }else{
        [self showAlert:@"用户名或密码错误，请重新输入！"];
    }
}

-(void)showAlert:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
