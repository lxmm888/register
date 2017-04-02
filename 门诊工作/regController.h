//
//  regController.h
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classModel.h"
#import "noticeView.h"


@interface regController : UIViewController
@property (nonatomic, strong) NSArray *classDoctor;
@property (nonatomic, strong) NSString *className;

@property (nonatomic, strong) classModel *m;

@property (nonatomic, strong) noticeView *nView;


@end
