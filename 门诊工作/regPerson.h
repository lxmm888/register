//
//  regPerson.h
//  门诊工作
//
//  Created by lxmm on 17/4/9.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface regPerson : NSObject
/** 病人姓名*/
@property (nonatomic, strong) NSString *nameStr;
@property (nonatomic, strong) NSString *telStr;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *doctorName;
@property (nonatomic, strong) NSString *departName;
@property (nonatomic, strong) NSString *regTime;
@property (nonatomic, strong) NSString *orderTime;



+ (regPerson *)dictToModel:(NSDictionary *)dict;
- (regPerson *)initWithDict:(NSDictionary *)dict;

@end
