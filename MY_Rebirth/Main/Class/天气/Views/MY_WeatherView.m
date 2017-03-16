//
//  MY_WeatherView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherView.h"
#import "MY_HumidityView.h"
#import "MY_WindSpeedView.h"
#import "MY_TemperatureView.h"
#import "MY_SunInfoView.h"
#import "MY_MaxTempView.h"
#import "MY_WeatherInfoView.h"
#import "MY_WeekWeatherViewController.h"

@interface MY_WeatherView ()<UITableViewDelegate,UIViewControllerTransitioningDelegate>

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
/**
 数据源
 */
@property (nonatomic, strong) MY_WeekWeatherModel *weekWeatherModel;

@end


@implementation MY_WeatherView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}


/**
 创建视图
 */
- (void)my_weatherViewBuildView {
    
    [self addSubview:self.myWeatherTableView];
    
    //定位地址
    UILabel *locationLabel = [[UILabel alloc] init];
    [self.myWeatherTableView addSubview:locationLabel];
    [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(_myWeatherTableView);
        make.width.mas_equalTo(MAINSCREEN_WIDTH / 2);
        make.height.mas_equalTo(40);
    }];
    locationLabel.text = [NSString stringWithFormat:@"  %@",_weatherModel.name];
    locationLabel.font = [UIFont fontWithName:LATO_LIGHT size:30];
    //时间
    UILabel *dateLabel = [[UILabel alloc] init];
    [self.myWeatherTableView addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(_myWeatherTableView);
        make.left.mas_equalTo(locationLabel.mas_right);
        make.height.mas_equalTo(locationLabel.mas_height);
    }];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSString *nowDateStr = [formatter stringFromDate:nowDate];
    dateLabel.text = [NSString stringWithFormat:@"%@",nowDateStr];
    dateLabel.font = [UIFont fontWithName:LATO_LIGHT size:15];
    dateLabel.textAlignment = NSTextAlignmentRight;
    
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
        self.temperatureView = [[MY_TemperatureView alloc] initWithFrame:CGRectMake(Width / 2, Height - 3 * Width / 2 - 64, Width / 2.f, Width / 2.f) temperature:(CGFloat)_weatherModel.main.temp - 273.15];
        [self.myWeatherTableView addSubview:self.temperatureView];
        //湿度
        self.humidityView = [[MY_HumidityView alloc] initWithFrame:CGRectMake(0, Height - Width - 64, Width / 2.f, Width / 2.f) withHumidity:_weatherModel.main.humidity];
        [self.myWeatherTableView addSubview:self.humidityView];
        //风速
        self.windSpeedView = [[MY_WindSpeedView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width / 2.f - 64, Width / 2.f, Width / 2.f) windSpeed:_weatherModel.wind.speed];
        [self.myWeatherTableView addSubview:self.windSpeedView];
        //气温差
        self.maxTempView = [[MY_MaxTempView alloc] initWithFrame:CGRectMake(0, Height - Width / 2.f - 64, Width / 2.f, Width / 2.f) HeightTem:[NSString stringWithFormat:@"%.f",_weatherModel.main.temp_max - 273.15] lowTem:[NSString stringWithFormat:@"%.f",_weatherModel.main.temp_min - 273.15]];
        [self.myWeatherTableView addSubview:self.maxTempView];
        //阳光
        MY_DetailWeatherInfoModel *weatherInfoModel = _weatherModel.weather[0];
        self.weatherInfoView = [[MY_WeatherInfoView alloc] initWithFrame:CGRectMake(0, Height - 3 * Width / 2 - 64, Width / 2, Width / 2) weatherNumber:weatherInfoModel.weatherId];
        [self.myWeatherTableView addSubview:self.weatherInfoView];
        //日出/落
        self.sunInfoView = [[MY_SunInfoView alloc] initWithFrame:CGRectMake(Width / 2.f, Height - Width - 64, Width / 2.f, Width / 2.f) withSunSire:[self accessUtcSecSecond:_weatherModel.sys.sunrise] sunSet:[self accessUtcSecSecond:_weatherModel.sys.sunset]];
        [self.myWeatherTableView addSubview:self.sunInfoView];
    }
    //创建出线条
    UIView *firstLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 3 * Width / 2 - 64, MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:firstLV];
    firstLV.backgroundColor = [UIColor lightGrayColor];
    //线二
    UIView *secondLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - Width - 64,  MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:secondLV];
    secondLV.backgroundColor = [UIColor lightGrayColor];
    //线三
    UIView *threeLV = [[UIView alloc] initWithFrame:CGRectMake(0, Height - Width / 2.f - 64, MAINSCREEN_WIDTH, 1)];
    [self.myWeatherTableView addSubview:threeLV];
    threeLV.backgroundColor = [UIColor lightGrayColor];
    //线四
    UIView *fourLV = [[UIView alloc] initWithFrame:CGRectMake(Width / 2, Height - 3 * Width / 2 - 64, 1, MAINSCREEN_WIDTH / 2 * 3)];
    [self.myWeatherTableView addSubview:fourLV];
    fourLV.backgroundColor = [UIColor lightGrayColor];
    
    //加载一周天气
    [self loadWeekWeatherInfoCityId:_weatherModel.cityId];
}


/**
 加载一周天气
 */
- (void)loadWeekWeatherInfoCityId:(NSInteger)cityId {
    
    [MYNetWorkAPI loadWeekWeatherInfoWithCityId:cityId success:^(MY_WeekWeatherModel *result) {
        if (result.cod == 200) {
            self.weekWeatherModel = result;
        }
    } faulure:^(NSError *error) {
        
    } showView:nil];
    
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //位移超过60后执行动画效果
    if (scrollView.contentOffset.y >= 60) {
        MY_WeekWeatherViewController *weatherVC = [[MY_WeekWeatherViewController alloc] init];
        weatherVC.weekWeatherModel = self.weekWeatherModel;
        [[MY_GlobalManager currentViewController] presentViewController:weatherVC animated:YES
                                                             completion:nil];
    }
}

//制定转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return nil;
}






- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return nil;
}







/**
 计算时间
 */
- (NSString *)accessUtcSecSecond:(NSInteger)secondTime {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    NSTimeInterval timeInterval = secondTime;
    NSDate *sunTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *sunTimeStr = [dateFormatter stringFromDate:sunTime];
    
    return sunTimeStr;
}

- (void)setWeatherModel:(MY_DetailWeatherModel *)weatherModel {
    _weatherModel = weatherModel;
    
    [self my_weatherViewBuildView];
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
