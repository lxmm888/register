//
//  manageController.h
//  门诊工作
//
//  Created by Xuan on 2017/3/10.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "regPerson.h"

@interface manageController : UIViewController
@property (nonatomic, strong) NSString *account;

@property (nonatomic, strong) UITableView *tView;
@property (nonatomic, strong) regPerson *regPerson;

- (void)initData;

@end
