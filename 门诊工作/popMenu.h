//
//  popMenu.h
//  门诊工作
//
//  Created by lxmm on 17/3/22.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ArrowPositionCenter = 0,
    ArrowPositionLeft = 1,
    ArrowPositionRight = 2

}ArrowPosition;

@interface popMenu : UIView

/** */
@property (nonatomic, assign) BOOL isDim;
/** */
@property (nonatomic, assign) ArrowPosition arrowPosition;

@end
