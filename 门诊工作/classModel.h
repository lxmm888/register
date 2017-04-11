//
//  classModel.h
//  门诊工作
//
//  Created by Xuan on 2017/3/8.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface classModel : NSObject


@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray *classDoctor;
@property (nonatomic, strong) NSString *departName;
- (classModel *)initDictToModel:(NSDictionary *)dict;
+ (classModel *)dictToModel:(NSDictionary *)dict;
@end
