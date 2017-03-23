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
@property (nonatomic, strong) void(^btnBlock)(id object);
@property (nonatomic, strong) classModel *m;


@end
