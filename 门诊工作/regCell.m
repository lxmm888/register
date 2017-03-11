//
//  regCell.m
//  门诊工作
//
//  Created by Xuan on 2017/3/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "regCell.h"

@implementation regCell

+ (UITableViewCell *)tableViewToCell:(UITableView *)tableView{
    static NSString *idd = @"cell";
    regCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[regCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idd];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    self.textLabel.textAlignment = NSTextAlignmentLeft
    self.detailTextLabel.text = @"专治疑难杂症";
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return self;
}

- (void)setDoctorName:(NSString *)doctorName
{
    _doctorName = doctorName;
    self.textLabel.text = doctorName;
}

@end
