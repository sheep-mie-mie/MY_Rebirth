//
//  MY_WeatherViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherViewController.h"
#import "MY_WeatherView.h"


@interface MY_WeatherViewController ()<MY_WeatherViewDelegate,MY_LocationManagerDelegate>

/**
 天气
 */
@property (nonatomic, strong) MY_WeatherView *myWeatherView;
/**
 定位
 */
@property (nonatomic, strong) MY_LocationManager *locationManager;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray <MY_DetailWeatherModel *>* dataArray;

@property (nonatomic, strong) MY_DetailWeatherModel *weatherModel;

@end

@implementation MY_WeatherViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置页面
    [self buildViewState];
    
//    [MYNetWorkAPI loadWeekWeatherInfoWithCityId:1797929 success:^(MY_WeekWeatherModel *result) {
//        if (result.cod == 200) {
//            
//        }
//    } faulure:^(NSError *error) {
//        
//    } showView:nil];

    
}

/**
 设置页面状态
 */
- (void)buildViewState {
    
    //天气
    [self.view addSubview:self.myWeatherView];
    //定位
    _locationManager = [MY_LocationManager myLocationManager];
    _locationManager.delegate = self;
    //更新url
    [MYNetworkingObject updateBaseUrl:weatherInfoUrl];
}


#pragma mark ------------//Location Manager\\------------
- (void)locationManager:(MY_LocationManager *)manager didUpCllocation:(CLLocation *)location {
    
    NSLog(@"%lf  %lf",location.coordinate.latitude, location.coordinate.longitude);
    [MYNetWorkAPI loadWeatherInfoWithLoactionLatitude:location.coordinate.latitude
                                            longitude:location.coordinate.longitude
                                              success:^(MY_DetailWeatherModel *result) {
                                                  if (result.cod == 200) {
                                                      [self.dataArray addObject:result];
                                                      _weatherModel = result;
                                                      self.myWeatherView.weatherModel = result;
                                                  }
                                              } failure:^(NSError *error) {
                                                  
                                              } showView:nil];
}

- (void)locationManager:(MY_LocationManager *)manager didFailed:(NSError *)error {
    
    
    
}

- (void)locationManagerServerClosed:(MY_LocationManager *)manager {
    
    
    
}





#pragma mark ------------//懒加载\\------------
- (MY_WeatherView *)myWeatherView {
    if (_myWeatherView == nil) {
        _myWeatherView = [[MY_WeatherView alloc] initWithFrame:self.view.bounds];
        _myWeatherView.layer.masksToBounds = YES;
        _myWeatherView.delegate = self;
        [_myWeatherView my_weatherViewBuildView];
    }
    return _myWeatherView;
}

- (NSMutableArray<MY_DetailWeatherModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
