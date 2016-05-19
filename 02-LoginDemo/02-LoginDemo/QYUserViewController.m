//
//  QYUserViewController.m
//  02-LoginDemo
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYUserViewController.h"

@interface QYUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welComeLabel;

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _welComeLabel.text = [NSString stringWithFormat:@"欢迎您，%@",_userNameString];
    
    // Do any additional setup after loading the view.
}
- (IBAction)logOut:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
