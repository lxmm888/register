//
//  manageController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "manageController.h"
#import "popMenu.h"

@interface manageController ()

@end

@implementation manageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [titleBtn setTitle:@"点击弹出" forState:UIControlStateNormal];
    titleBtn.backgroundColor = [UIColor blackColor];
    self.navigationItem.titleView = titleBtn;
    [titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)titleBtnClick
{
    popMenu *pm = [[popMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.height)];
    pm.isDim = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:pm];
}

@end
