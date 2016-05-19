//
//  QYStoryboardSegue.m
//  03-LoginDemo（segue）
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYStoryboardSegue.h"

@implementation QYStoryboardSegue
//执行视图切换
-(void)perform {
    
    UIViewController *sourceVC = self.sourceViewController;
    UIViewController *destVC = self.destinationViewController;
    
    //获取用户名和密码
    NSString *userName = [sourceVC valueForKeyPath:@"userNameTF.text"];
    NSString *passWord = [sourceVC valueForKeyPath:@"passWordTF.text"];
    //判断用户名和密码不能为空
    if (userName.length == 0 || passWord.length == 0) {
        [self showAlert:@"用户名或密码不能为空"];
    }
    
    //判断用户名和密码是否正确
    if ([userName isEqualToString:@"123456"] && [passWord isEqualToString:@"qwertyuiop"]) {
        //利用模态方式跳转个人中心
        //利用kvc设置个人中心视图控制器中的userName属性
        [destVC setValue:userName forKey:@"userName"];
        //视图切换的动画效果
        destVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        [sourceVC presentViewController:destVC animated:YES completion:^{
            [sourceVC setValue:nil forKeyPath:@"userNameTF.text"];
            [sourceVC setValue:nil forKeyPath:@"passWordTF.text"];
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
    
    [self.sourceViewController presentViewController:alertController animated:YES completion:nil];
}

@end
