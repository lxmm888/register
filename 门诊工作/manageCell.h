//
//  manageCell.h
//  门诊工作
//
//  Created by Xuan on 2017/3/13.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "regPerson.h"

@interface manageCell : UITableViewCell

@property (nonatomic, strong) regPerson *rp;

+ (UITableViewCell *)tableViewToCell:(UITableView *)tableView;

@end
