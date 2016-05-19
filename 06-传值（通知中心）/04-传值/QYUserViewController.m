//
//  QYUserViewController.m
//  04-传值
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYUserViewController.h"
#import "Common.h"
@interface QYUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welComeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;        //个性签名

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _welComeLabel.text = [NSString stringWithFormat:@"欢迎您，%@",_userName];
    
    //首先获取通知中心
    //添加通知监听
    //第一个参数：通知的接收者（接收到通知响应事件的对象）,第二个参数：接收到通知之后所做的事件,第三个参数：当前通知的名称,第四个参数：当前通知的发送者（一般为nil）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextForDescLabel:) name:NotificationName object:nil];
    // Do any additional setup after loading the view.
}

-(void)changeTextForDescLabel:(NSNotification *)notification {
    NSDictionary *dict = notification.userInfo;
    _descLabel.text = dict[@"value"];
}

-(void)dealloc {
    //移除通知
    //第一个参数：通知的接受者 ，第二个参数:移除的通知的名称 ,第三个参数:通知的发送者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotificationName object:nil];
}

- (IBAction)logout:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"changeDesc"]) {
        //目标视图控制器
        UIViewController *destVC = segue.destinationViewController;
        
        //传递个性签名
        [destVC setValue:_descLabel.text forKey:@"descString"];
        
    }
}


@end
