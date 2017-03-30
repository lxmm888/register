//
//  noticeCell.h
//  门诊工作
//
//  Created by Xuan on 2017/3/27.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface noticeCell : UITableViewCell

@property (nonatomic, assign) CGFloat cellH;

+ (UITableViewCell *)cellWithTableview:(UITableView *)tableView;

@end
