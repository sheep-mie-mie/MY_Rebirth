//
//  MY_WeekWeatherModel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MY_WeekWeatherModel : NSObject
@property (nonatomic, copy  ) NSString *city;
@property (nonatomic, assign) NSInteger cod;
@property (nonatomic, assign) CGFloat message;
@property (nonatomic, assign) NSInteger cnt;
@property (nonatomic, strong) NSArray *list;
@end

@interface MY_WeekWeatherCityModel : NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy  ) NSString *name;
@property (nonatomic, copy  ) NSString *coord;
@property (nonatomic, copy  ) NSString *country;
@property (nonatomic, assign) NSInteger population;
@end

@interface MY_WeekWeatherCityCoordModel : NSObject
@property (nonatomic, assign) CGFloat lon;
@property (nonatomic, assign) CGFloat lat;
@end

@interface MY_WeekWeatherListModel : NSObject
@property (nonatomic, assign) NSInteger dt;
@property (nonatomic, copy  ) NSString *temp;
@property (nonatomic, assign) CGFloat pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, strong) NSArray *weather;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) NSInteger deg;
@property (nonatomic, assign) NSInteger clouds;
@end

@interface MY_WeekWeatherListTempModel : NSObject
@property (nonatomic, assign) CGFloat day;
@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat max;
@property (nonatomic, assign) CGFloat night;
@property (nonatomic, assign) CGFloat eve;
@property (nonatomic, assign) CGFloat morn;
@end

@interface MY_WeekWeatherListWeatherModel : NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy  ) NSString *main;
@property (nonatomic, copy  ) NSString *description;
@property (nonatomic, copy  ) NSString *icon;
@end













