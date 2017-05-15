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
#import "meController.h"
#import "manageController.h"

@interface tab ()

@end

@implementation tab

- (void)viewDidLoad {
    [super viewDidLoad];
    homeController *home = [homeController new];
    [self addChild:home imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    
    manageController *mc = [manageController new];
    mc.title = @"预约单";
    [self addChild:mc imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
    
    meController *me = [meController new];
    me.title = @"我的资料";
    [self addChild:me imageName:@"预约单" selectImageName:@"tabbar_profile_selected"];
    
    
}

- (void)addChild:(UIViewController *)childVc imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];

    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectImageName];
    //    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //
    ////    childVc.tabBarItem.selectedImage = selectedImage;
    childVc.tabBarItem.selectedImage = selectedImage;
    
    
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[UITextAttributeTextColor] = [UIColor blackColor];
    textAttr[UITextAttributeFont] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectdTextAttr = [NSMutableDictionary dictionary];
    selectdTextAttr[UITextAttributeTextColor] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectdTextAttr forState:UIControlStateSelected];
    LXNav* nav=[[LXNav alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];

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
