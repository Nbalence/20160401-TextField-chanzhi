//
//  ViewController.m
//  03-LoginDemo（segue）
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
   
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#if 0
//为segue做准备，阻止不了segue的跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //sender是触发segue的对象（登录按钮）
    //如果segue是登录，把用户名传递到个人中心
    if ([segue.identifier isEqualToString:@"login"]) {
        //获取目标视图控制器
        QYUserViewController *userVC = segue.destinationViewController;
        userVC.userName = _userNameTF.text;
    }
}
#endif
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
