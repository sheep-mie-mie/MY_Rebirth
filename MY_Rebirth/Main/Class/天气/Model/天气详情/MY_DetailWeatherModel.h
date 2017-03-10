//
//  MY_DetailWeatherModel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MY_DetailWeatherCoordModel;
@class MY_DetailWeatherMainModel;
@class MY_DetailWeatherWindModel;
@class MY_DetailWeatherCloudsModel;
@class MY_DetailWeatherSysModel;

@interface MY_DetailWeatherModel : NSObject
@property (nonatomic, strong) MY_DetailWeatherCoordModel  *coord;
@property (nonatomic, strong) NSArray   *weather;
@property (nonatomic, copy  ) NSString  *base;
@property (nonatomic, strong) MY_DetailWeatherMainModel  *main;
@property (nonatomic, assign) NSInteger visibility;
@property (nonatomic, strong) MY_DetailWeatherWindModel  *wind;
@property (nonatomic, strong) MY_DetailWeatherCloudsModel  *clouds;
@property (nonatomic, assign) NSInteger dt;
@property (nonatomic, strong) MY_DetailWeatherSysModel  *sys;
@property (nonatomic, assign) NSInteger cityId;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, assign) NSInteger cod;
@end


@interface MY_DetailWeatherCoordModel : NSObject
@property (nonatomic, assign) CGFloat lon;
@property (nonatomic, assign) CGFloat lat;
@end


@interface MY_DetailWeatherInfoModel : NSObject
@property (nonatomic, assign) NSInteger weatherId;
@property (nonatomic, copy  ) NSString  *main;
@property (nonatomic, copy  ) NSString  *weatherdescription;
@property (nonatomic, copy  ) NSString  *icon;
@end

@interface MY_DetailWeatherMainModel : NSObject
@property (nonatomic, assign) NSInteger temp;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, assign) NSInteger temp_min;
@property (nonatomic, assign) NSInteger temp_max;
@end

@interface MY_DetailWeatherWindModel : NSObject
@property (nonatomic, assign) NSInteger speed;
@end

@interface MY_DetailWeatherCloudsModel : NSObject
@property (nonatomic, assign) NSInteger all;
@end

@interface MY_DetailWeatherSysModel : NSObject
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger sysId;
@property (nonatomic, copy  ) NSString *country;
@property (nonatomic, assign) NSInteger sunrise;
@property (nonatomic, assign) NSInteger sunset;
@end













