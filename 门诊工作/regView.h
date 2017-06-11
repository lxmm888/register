//
//  regView.h
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classModel.h"

@interface regView : UIView
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) void(^btnBlock)(id object);

@end

@interface MyButton : UIButton
@property (nonatomic,strong) classModel* m;
@end
