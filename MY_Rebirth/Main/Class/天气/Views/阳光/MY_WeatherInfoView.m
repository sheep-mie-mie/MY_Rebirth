//
//  MY_WeatherInfoView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeatherInfoView.h"
#import "UIView+GlowView.h"
#import "WeatherNumberMeaningTransform.h"

@interface MY_WeatherInfoView ()

/**
 天气文本
 */
@property (nonatomic, assign) NSInteger weatherNumber;

@property (nonatomic, strong) UILabel   *glowLabel;


@end


@implementation MY_WeatherInfoView

- (instancetype)initWithFrame:(CGRect)frame weatherNumber:(NSInteger)weatherNumber {
    if (self = [super initWithFrame:frame]) {
        
        _weatherNumber = weatherNumber;
        
        [self buildWeatherInfoView];
    }
    return self;
}

/**
 设置天气
 */
- (void)buildWeatherInfoView {
    
    //标题
    UILabel *weatherTitleLabel = [[UILabel alloc] init];
    [self addSubview:weatherTitleLabel];
    [weatherTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self.width - 40);
        make.height.mas_equalTo(35);
    }];
    weatherTitleLabel.text = @"Weather";
    weatherTitleLabel.font = [UIFont fontWithName:LATO_LIGHT size:AllTitleFont];
    
    //创建
    self.glowLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.glowLabel.textAlignment = NSTextAlignmentCenter;
    self.glowLabel.font   = [UIFont fontWithName:WEATHER_TIME size:110];
    self.GCDTimerInterval = @(1.75);
    self.glowLayerOpacity = @(1.5);
    self.glowDuration     = @(1.f);
    self.glowLabel.alpha  = 1.f;
    self.glowLabel.text   = [WeatherNumberMeaningTransform fontTextWeatherNumber:[NSNumber numberWithInteger:self.weatherNumber]];
    [self.glowLabel createGlowLayerWithColor:[WeatherNumberMeaningTransform iconColor:[NSNumber numberWithInteger:self.weatherNumber]] glowRadius:2.f];
    [self.glowLabel startGlow];
    self.glowLabel.alpha  = 0.f;
    [self addSubview:self.glowLabel];
    [UIView animateWithDuration:1.75 animations:^{
        self.glowLabel.alpha = 1.f;
    }];
}
















@end
