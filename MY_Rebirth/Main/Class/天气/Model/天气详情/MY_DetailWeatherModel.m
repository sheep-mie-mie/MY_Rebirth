//
//  MY_DetailWeatherModel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_DetailWeatherModel.h"

@implementation MY_DetailWeatherModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"coord":@"MY_DetailWeatherCoordModel",
             @"weather":@"MY_DetailWeatherInfoModel",
             @"main":@"MY_DetailWeatherMainModel",
             @"wind":@"MY_DetailWeatherWindModel",
             @"clouds":@"MY_DetailWeatherCloudsModel",
             @"sys":@"MY_DetailWeatherSysModel"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"cityId":@"id"};
}
@end

@implementation MY_DetailWeatherCoordModel
@end

@implementation MY_DetailWeatherInfoModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"weatherId":@"id",
             @"weatherdescription":@"description"};
}
@end

@implementation MY_DetailWeatherMainModel
@end

@implementation MY_DetailWeatherWindModel
@end

@implementation MY_DetailWeatherCloudsModel
@end

@implementation MY_DetailWeatherSysModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"sysId":@"id"};
}
@end







