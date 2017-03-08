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
 改变颜色Label
 */
@property (nonatomic, strong) MY_ChangeColorLabel *changeColorLabel;
/**
 风速
 */
@property (nonatomic, strong) MY_WindSpeedView *windSpeedView;

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
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width, Width / 2.f, Width / 2.f)];
        [self.humidityView my_humidityViewBuildView];
        self.humidityView.backgroundColor = [UIColor goldColor];
        [self.myWeatherTableView addSubview:self.humidityView];
        //风速
        self.windSpeedView = [[MY_WindSpeedView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width / 2.f, Width / 2.f, Width / 2.f)];
        [self.windSpeedView my_windSpeedViewBuildView];
        [self.myWeatherTableView addSubview:self.windSpeedView];
        //气温差
        
        //阳光
        
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
    self.windSpeedView.windSpeed = 3;
    self.windSpeedView.circleByOneSecond = 3 / 10.f;
    
    [self.humidityView my_humidityViewAnimationShow];
    [self.windSpeedView my_windSpeedViewShow];
    
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
