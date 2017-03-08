//
//  tab.m
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "tab.h"
#import "homeController.h"
#import "LXNav.h"

@interface tab ()

@end

@implementation tab

- (void)viewDidLoad {
    [super viewDidLoad];
    homeController *home = [homeController new];
    LXNav* nav=[[LXNav alloc]initWithRootViewController:home];
    [self addChildViewController:nav];
    
    // Do any additional setup after loading the view.
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
