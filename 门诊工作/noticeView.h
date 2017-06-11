//
//  noticeView.h
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classModel.h"

@interface noticeView : UIView
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *name;


@property (nonatomic, strong) int(^btnBlock)(void);
@property (nonatomic, strong) classModel *m;
@property (nonatomic, strong) UIViewController *regController;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, strong) NSString *doctorName;
/** */

@property (nonatomic, assign) BOOL isDim;

@end
