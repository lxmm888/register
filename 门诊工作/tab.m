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
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    homeController *home = [homeController new];
//    [self addChild:home imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
//    [home.tabBarController.tabBar setBarTintColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];
//    [home.tabBarItem setImage:[UIImage imageNamed:@"1"]];
//    home.title = title;
    // 设置tabbarItem图片（普通状态和选中状态）
    home.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    //
    UIImage *selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
    //
    //    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //
    ////    childVc.tabBarItem.selectedImage = selectedImage;
    home.tabBarItem.selectedImage = selectedImage;

    
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[UITextAttributeTextColor] = [UIColor blackColor];
    textAttr[UITextAttributeFont] = [UIFont systemFontOfSize:10];
    [home.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectdTextAttr = [NSMutableDictionary dictionary];
    selectdTextAttr[UITextAttributeTextColor] = [UIColor orangeColor];
    [home.tabBarItem setTitleTextAttributes:selectdTextAttr forState:UIControlStateSelected];
    LXNav* nav=[[LXNav alloc]initWithRootViewController:home];
    [self addChildViewController:nav];
    
    
    // Do any additional setup after loading the view.
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
