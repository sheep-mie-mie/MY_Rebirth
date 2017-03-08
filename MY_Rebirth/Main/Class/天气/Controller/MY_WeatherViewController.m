//
//  MY_WeatherViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherViewController.h"
#import "MY_WeatherView.h"

@interface MY_WeatherViewController ()<MY_WeatherViewDelegate>

/**
 天气
 */
@property (nonatomic, strong) MY_WeatherView *myWeatherView;

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
    
    
}

/**
 设置页面状态
 */
- (void)buildViewState {
    
    //天气
    [self.view addSubview:self.myWeatherView];
    
    
    
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
