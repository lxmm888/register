//
//  departModel.h
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "classModel.h"
@class departModel;
@interface departModel : NSObject

@property (nonatomic, strong) NSString *departName;
@property (nonatomic, strong) NSArray *departClass;
@property (nonatomic, strong) classModel *classModel;
@property (nonatomic, strong) NSMutableArray *classModelArr;



- (departModel *)initDictToModel:(NSDictionary *)dict;
+ (departModel *)dictToModel:(NSDictionary *)dict;

@end
