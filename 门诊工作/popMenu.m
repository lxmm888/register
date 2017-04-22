//
//  popMenu.m
//  门诊工作
//
//  Created by lxmm on 17/3/22.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "popMenu.h"
#import "regPerson.h"


@interface popMenu()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation popMenu{
    UIButton *cover;
    UIView *containView;
    UITableView *insideTableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setCover];
        [self popView];
    }
    return self;
}

- (void)popView
{
    containView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 160, 0)];
    containView.centerX = self.width * 0.5;
    [self addSubview:containView];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160,200)];
    
    [containView addSubview:iv];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"popover_background"];
    iv.image = [backgroundImage stretchableImageWithLeftCapWidth:backgroundImage.size.width * 0.5 topCapHeight:backgroundImage.size.height * 0.5];
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        containView.height = iv.height;
    }];
    
    insideTableView = [UITableView new];
    CGFloat border = 10;
    insideTableView.x = iv.frame.origin.x + border;
    insideTableView.y = iv.frame.origin.y + border;
    insideTableView.width = iv.frame.size.width - 2 * border;
    insideTableView.height = iv.frame.size.height - 2 * border;
    insideTableView.backgroundColor = [UIColor clearColor];
    insideTableView.delegate = self;
    insideTableView.dataSource = self;
    insideTableView.tableFooterView = [UIView new];
    [containView addSubview:insideTableView];
    
}

- (void)setIsDim:(BOOL)isDim
{
    _isDim = isDim;
    [UIView animateWithDuration:0.5 animations:^{
        if (_isDim) {
            cover.backgroundColor = [UIColor blackColor];
            cover.alpha = 0.3;
        }else{
            cover.backgroundColor = [UIColor clearColor];
            cover.alpha = 1.0;
//

        }
    } completion:^(BOOL finished) {
        if (_isDim == NO) {
            [self removeFromSuperview];

        }
    }];
    
    
}

- (void)setCover
{
    cover = [[UIButton alloc] initWithFrame:self.frame];
    self.isDim = NO;
    
    [self addSubview:cover];
    [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setArrowPosition:(ArrowPosition)arrowPosition
{
    _arrowPosition = arrowPosition;
    switch (arrowPosition) {
        case ArrowPositionCenter:
            
            break;
        case ArrowPositionLeft:
            
            break;
        case ArrowPositionRight:
            
            break;
            
        default:
            break;
    }
}

-(void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    [insideTableView reloadData];
}

- (void)coverClick
{
    self.isDim = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    regPerson *r = _dataSource[indexPath.row];
    cell.textLabel.text = r.nameStr;//[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
