//
//  manageCell.m
//  门诊工作
//
//  Created by Xuan on 2017/3/13.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "manageCell.h"

@implementation manageCell

+ (UITableViewCell *)tableViewToCell:(UITableView *)tableView{
    static NSString *idd = @"cell";
    manageCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[manageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idd];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        UIView *icon = [[UIView alloc] init];
//        icon.backgroundColor = [UIColor blackColor];
//        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
//            make.width.height.equalTo(@(40)).key(@"head_width_height");
//            
//        }];
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    //    self.textLabel.textAlignment = NSTextAlignmentLeft
    
    return self;
}

@end
