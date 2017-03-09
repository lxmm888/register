//
//  regCell.h
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classModel.h"
@interface regCell : UITableViewCell

@property (nonatomic, strong) NSString *doctorName;

+ (UITableViewCell *)tableViewToCell:(UITableView *)tableView;

@end
