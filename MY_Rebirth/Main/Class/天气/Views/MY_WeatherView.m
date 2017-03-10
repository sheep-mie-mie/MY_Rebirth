//
//  MY_WeatherView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherView.h"
#import "MY_HumidityView.h"
#import "MY_ChangeColorLabel.h"
#import "MY_WindSpeedView.h"
#import "MY_TemperatureView.h"
#import "MY_SunInfoView.h"
#import "MY_MaxTempView.h"
#import "MY_WeatherInfoView.h"

@interface MY_WeatherView ()<UITableViewDelegate>

/**
 tableView
 */
@property (nonatomic, strong) UITableView *myWeatherTableView;
/**
 湿度
 */
@property (nonatomic, strong) MY_HumidityView *humidityView;
/**
 风速
 */
@property (nonatomic, strong) MY_WindSpeedView *windSpeedView;
/**
 气温
 */
@property (nonatomic, strong) MY_TemperatureView *temperatureView;
/**
 日出
 */
@property (nonatomic, strong) MY_SunInfoView *sunInfoView;
/**
 温差
 */
@property (nonatomic, strong) MY_MaxTempView *maxTempView;
/**
 阳光
 */
@property (nonatomic, strong) MY_WeatherInfoView *weatherInfoView;


@end


@implementation MY_WeatherView

/**
 创建视图
 */
- (void)my_weatherViewBuildView {
    
    [self addSubview:self.myWeatherTableView];
    
    if (iPhone4_4s) {
        //显示控件
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width / 2.f, Width / 2.f, Width / 2.f)];
        [self.myWeatherTableView addSubview:self.humidityView];
        //阳光
        
        //气温
        
        //天气
        
    } else {
        //显示控件
        //温度
        self.temperatureView = [[MY_TemperatureView alloc] initWithFrame:CGRectMake(Width / 2, Height - 3 * Width / 2 - 64, Width / 2.f, Width / 2.f) temperature:16];
        [self.myWeatherTableView addSubview:self.temperatureView];
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width - 64, Width / 2.f, Width / 2.f)];
        [self.humidityView my_humidityViewBuildView];
        self.humidityView.backgroundColor = [UIColor goldColor];
        [self.myWeatherTableView addSubview:self.humidityView];
        //风速
        self.windSpeedView = [[MY_WindSpeedView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width / 2.f - 64, Width / 2.f, Width / 2.f) windSpeed:1.f];
        [self.myWeatherTableView addSubview:self.windSpeedView];
        //气温差
        
        //阳光
        self.weatherInfoView = [[MY_WeatherInfoView alloc] initWithFrame:CGRectMake(0, Height - 3 * Width / 2 - 64, Width / 2, Width / 2) weatherNumber:800];
        [self.myWeatherTableView addSubview:self.weatherInfoView];
        //气温表
        
        //天气
        
    }
    //创建出线条
    
    
    
    
}


/**
 显示动画
 */
- (void)my_weatherViewAnimationShow {
    
    //湿度
    self.humidityView.humidityPercent = 14/100.f;
    //风速显示
    
    self.windSpeedView.circleByOneSecond = 3 / 10.f;
    
    [self.humidityView my_humidityViewAnimationShow];
    
    
}
























#pragma mark ------------//懒加载\\------------
- (UITableView *)myWeatherTableView {
    if (_myWeatherTableView == nil) {
        _myWeatherTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _myWeatherTableView.delegate = self;
        _myWeatherTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myWeatherTableView.backgroundColor = [UIColor clearColor];
    }
    return _myWeatherTableView;
}










@end
