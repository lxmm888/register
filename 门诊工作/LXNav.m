//
//  LXController.m
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "LXNav.h"

@interface LXNav ()

@end

@implementation LXNav

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationBar setBarTintColor:[UIColor colorWithRed:60/255.0 green:210/255.0 blue:130/255.0 alpha:1.0]];
    [self.navigationBar setBarTintColor:[UIColor orangeColor]];

    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>=1) {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
