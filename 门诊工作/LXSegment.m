//
//  LXSegment.m
//  门诊工作
//
//  Created by lxmm on 17/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "LXSegment.h"
#import "regView.h"
#import "desView.h"

@implementation LXSegment{
    UIView *rView;
    UIView *lView;
    NSMutableArray *viewArr;
    UIView *bottomBar;
    NSMutableArray *btnArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        [self setBtns];
        viewArr = [NSMutableArray array];
        btnArr = [NSMutableArray array];
        
    }
    
    return self;
}
- (void)addViewAndTitleWithArray:(NSArray *)arr
{
    NSInteger c = arr.count;
    CGFloat btnW = 100;
    
    CGFloat margin = (self.width - c * btnW) / (c + 1);
//    CGFloat wid = self.width / (c * 2);
    for (int i = 0; i < c; i ++) {
        NSDictionary *dic = arr[i];
        UIView *v = [[dic allValues] firstObject];

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(margin + i * (btnW + margin), 0, 100, 50)];
        
//        btn.centerX = wid * (2 * i - 1);
        [btn setTitle:[dic.allKeys firstObject] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }
        else{
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

        }
//        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        
        
        btn.tag = i;
        [self addSubview:btn];
        [viewArr addObject:v];
        [btnArr addObject:btn];
    }
    bottomBar = [[UIView alloc] initWithFrame:CGRectMake(margin, 40, btnW, 3)];
    bottomBar.backgroundColor = [UIColor orangeColor];
    [self addSubview:bottomBar];
//    [self addSubview:bottomBar];
    
}

- (void)btnClick:(UIButton *)btn
{
    for (UIButton *tempBtn in btnArr) {
        if (tempBtn.tag == btn.tag) {
            [UIView animateWithDuration:0.25 animations:^{
                bottomBar.x = btn.x;
            }];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            ((UIView *)viewArr[tempBtn.tag]).hidden = NO;
        }
        else{
            [tempBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            ((UIView *)viewArr[tempBtn.tag]).hidden = YES;
        }
    }

}



@end
