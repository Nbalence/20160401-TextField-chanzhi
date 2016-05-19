//
//  QYChangeDescViewController.m
//  04-传值
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYChangeDescViewController.h"

@interface QYChangeDescViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation QYChangeDescViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.text = _descString;
    // Do any additional setup after loading the view.
}
- (IBAction)back:(UIButton *)sender {
    //判断当前代理对象是否能够响应changeTextForDescLabel
    if ([self.delegate respondsToSelector:@selector(changeTextForDescLabel:)]) {
        [self.delegate changeTextForDescLabel:_textField.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
