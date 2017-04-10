//
//  LXButton.h
//  门诊工作
//
//  Created by lxmm on 17/4/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXButton : UIView

@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *titleName;

+ (UIView *)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName;
+ (UIView *)initWithDoctorName:(NSString *)doctorName className:(NSString *)className;

@end
