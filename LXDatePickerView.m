//
//  LXDatePickerView.m
//  门诊工作
//
//  Created by Xuan on 2017/6/11.
//  Copyright © 2017年 Xuan. All rights reserved.
//

#import "LXDatePickerView.h"

@interface LXDatePickerView()<UIPickerViewDataSource,UIPickerViewDelegate>

@end

@implementation LXDatePickerView{
    NSMutableArray *dataSource;
    NSMutableArray *arr0;
    NSArray *arr1;
    NSArray *arr2;
    NSInteger dateNum;
    NSInteger hourNum;
    NSInteger minNum;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dataInit];

    }
    return self;
}

- (void)dataInit
{
    dateNum = hourNum = minNum = 0;
    arr0 = [NSMutableArray array];
    NSInteger weekDay = [self getNowWeekday];
    for (NSInteger i = weekDay; i < weekDay + 7; i ++) {
        //周几string
        NSString *weekDayStr;
        switch (i % 7) {
            case 1:
                weekDayStr = @"星期天";
                break;
            case 2:
                weekDayStr = @"星期一";
                break;
            case 3:
                weekDayStr = @"星期二";
                break;
            case 4:
                weekDayStr = @"星期三";
                break;
            case 5:
                weekDayStr = @"星期四";
                break;
            case 6:
                weekDayStr = @"星期五";
                break;
            case 0:
                weekDayStr = @"星期六";
                break;
                
            default:
                break;
        }
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置 日期 格式 可以根据自己的需求 随时调整， 否则计算的结果可能为 nil
        formatter.dateFormat = @"MM月dd日";

        //日期string
        NSString *dateStr = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:i * 86400]];
//        NSLog(@"%@",[NSString stringWithFormat:@"%@ %@",dateStr,weekDayStr]);
        [arr0 addObject:[NSString stringWithFormat:@"%@ %@",dateStr,weekDayStr]];
    }
    
    arr1 = [NSArray arrayWithObjects:@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16", nil];
    arr2 = [NSArray arrayWithObjects:@"00",@"15",@"30",@"45", nil];
    self.dataSource = self;
    self.delegate = self;
    dataSource = [NSMutableArray arrayWithObjects:arr0,arr1,arr2, nil];
    
}

//返回1 是周日
//返回7 是周六
- (NSInteger)getNowWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDate *now = [NSDate date];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps weekday];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return dataSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *arr = dataSource[component];
    return arr.count;
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *arr = dataSource[component];
    return arr[row];
    
}

- (NSString *)getTitle{
    dateNum = [self selectedRowInComponent:0];
    hourNum = [self selectedRowInComponent:1];
    minNum  =[self selectedRowInComponent:2];
    NSString *str0 = [((NSArray *)dataSource[0]) objectAtIndex:dateNum];
    NSString *str1 = [((NSArray *)dataSource[1]) objectAtIndex:hourNum];
    NSString *str2 = [((NSArray *)dataSource[2]) objectAtIndex:minNum];
    NSString *str = [NSString stringWithFormat:@"%@ %@:%@",str0,str1,str2];
    return str;
    
}


//
//- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
//{
//    if (component == 0) {
//        dateNum = row;
//    }
//    else if (component == 1)
//    {
//        hourNum = row;
//    }
//    else{
//        minNum =row;
//    }
//    
//}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 200;
    }
    else{
        return 50;
    }
}

/*实现循环
//        for (int i = 0; i < 3; i++) {
//            [self selectRow:16384/2 inComponent:i animated:NO];
//        }

 titleForRow
 NSArray *tempArr = dataSource[component];
 //    myView.text = dataSource[component] objectAtIndex:row % [
 return [tempArr objectAtIndex:row % [tempArr count]];

 -(UIView *)viewForRow:(NSInteger)row forComponent:(NSInteger)component{
 int fontSize = 36;
 CGRect rect = CGRectMake(0.0, 0.0, 200, 50);
 if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
 rect = CGRectMake(0.0, 0.0, 200, 50);
 fontSize = 36;
 }else {
 rect = CGRectMake(0.0, 0.0, 100, 50);
 fontSize = 14;
 }
 
 UILabel *myView = [[UILabel alloc] initWithFrame:rect];
 myView.textAlignment = NSTextAlignmentCenter;;
 myView.font = [UIFont boldSystemFontOfSize:fontSize];
 
 myView.backgroundColor = [UIColor clearColor];
 NSArray *tempArr = dataSource[component];
 //    myView.text = dataSource[component] objectAtIndex:row % [
 myView.text = [tempArr objectAtIndex:row % [tempArr count]];
 NSLog(@"%@",[tempArr objectAtIndex:row % [tempArr count]]);
 // NSLog(@"end:row %d component %d,content:%@", row, component,myView.text );
 return myView;
 }
 
 row
 return 16384;

 
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
