//
//  QYUserViewController.m
//  04-传值
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYUserViewController.h"
#import "QYChangeTextForDescLabelDelegate.h"
@interface QYUserViewController ()<QYChangeTextForDescLabelDelegate>
@property (weak, nonatomic) IBOutlet UILabel *welComeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;        //个性签名

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _welComeLabel.text = [NSString stringWithFormat:@"欢迎您，%@",_userName];
    // Do any additional setup after loading the view.
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
        
        //设置代理
        [destVC setValue:self forKey:@"delegate"];
    }
}

//更改个性签名
-(void)changeTextForDescLabel:(NSString *)text{
    _descLabel.text = text;
}
@end
