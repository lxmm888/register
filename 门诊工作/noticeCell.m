//
//  noticeCell.m
//  门诊工作
//
//  Created by Xuan on 2017/3/27.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "noticeCell.h"
#import "Masonry.h"

@implementation noticeCell

+ (UITableViewCell *)cellWithTableview:(UITableView *)tableView
{
//    static NSString *idd = @"cell";
    noticeCell *cell = [[noticeCell alloc] init];
    return cell;
}

- (instancetype)init
{
    self.height = 30;
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"姓名";
    [self.contentView addSubview:nameLabel];
    
    
    UITextField *textField = [UITextField new];
    [self.contentView addSubview:textField];
                        

    return self;
}

@end
