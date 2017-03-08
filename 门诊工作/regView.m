//
//  regView.m
//  门诊工作
//
//  Created by Xuan on 2017/3/6.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "regView.h"

@interface regView()<UITableViewDataSource>

@end

@implementation regView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
    }
    return self;
}

- (void)setViews
{
    UITableView *tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.height)];
    tView.dataSource = self;
    [self addSubview:tView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idd = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"项目%ld",(long)indexPath.row];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
