//
//  MY_WeekWeatherModel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeekWeatherModel.h"

@implementation MY_WeekWeatherModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"city":@"MY_WeekWeatherCityModel",
             @"list":@"MY_WeekWeatherListModel"};
}
@end

@implementation MY_WeekWeatherCityModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"coord":@"MY_WeekWeatherCityCoordModel"};
}
@end

@implementation MY_WeekWeatherListModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"temp":@"MY_WeekWeatherListTempModel",
             @"weather":@"MY_WeekWeatherListWeatherModel"};
}
@end

@implementation MY_WeekWeatherCityCoordModel
@end

@implementation MY_WeekWeatherListTempModel
@end

@implementation MY_WeekWeatherListWeatherModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"weatherId":@"id",
             @"weatherDescription":@"description"};
}
@end









