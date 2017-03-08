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
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
//        [self setBtns];
        viewArr = [NSMutableArray array];
        
    }
    return self;
}
- (void)addViewAndTitleWithArray:(NSArray *)arr
{
    NSInteger c = arr.count;
    CGFloat wid = self.width / c;
    for (int i = 0; i < c; i ++) {
        NSDictionary *dic = arr[i];
        UIView *v = [[dic allValues] firstObject];

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(wid * i, 0, 100, 50)];
        [btn setTitle:[dic.allKeys firstObject] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateFocused];
        btn.tag = i;
        [self addSubview:btn];
        [viewArr addObject:v];
    }
    
}

- (void)btnClick:(UIButton *)btn
{
    for (int i = 0; i < viewArr.count; i ++) {
        if (i == btn.tag) {
            ((UIView *)viewArr[i]).hidden = NO;
        }
        else{
            ((UIView *)viewArr[i]).hidden = YES;
        }
    }
//    UIView *v = viewArr[btn.tag];
////    [self bringSubviewToFront:v];
//    v.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
