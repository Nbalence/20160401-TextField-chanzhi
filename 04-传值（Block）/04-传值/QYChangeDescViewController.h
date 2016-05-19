//
//  QYChangeDescViewController.h
//  04-传值
//
//  Created by qingyun on 16/4/1.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYChangeDescViewController : UIViewController
@property (nonatomic, strong) NSString *descString;
@property (nonatomic, strong) void (^changeDescLabel)(NSString *text);
@end
