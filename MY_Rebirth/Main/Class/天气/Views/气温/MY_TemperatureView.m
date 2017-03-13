//
//  MY_TemperatureView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_TemperatureView.h"

@interface MY_TemperatureView ()

/**
 气温
 */
@property (nonatomic, assign) CGFloat temperature;

@end


@implementation MY_TemperatureView

- (instancetype)initWithFrame:(CGRect)frame temperature:(CGFloat)temperature {
    if (self = [super initWithFrame:frame]) {
        
        _temperature = temperature;
        //self.backgroundColor = [UIColor goldColor];
        [self buildTemperatureView];
    }
    return self;
}

/**
 设置界面
 */
- (void)buildTemperatureView {
    //标题
    UILabel *temperatureTitleLabel = [[UILabel alloc] init];
    [self addSubview:temperatureTitleLabel];
    [temperatureTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(self);
        make.width.mas_equalTo(self.width - 40);
        make.height.mas_equalTo(35);
    }];
    temperatureTitleLabel.text = @"Temperature";
    temperatureTitleLabel.textAlignment = NSTextAlignmentCenter;
    temperatureTitleLabel.font = [UIFont fontWithName:LATO_LIGHT size:20];
    //温度
    UILabel *temperatureLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:temperatureLabel];
//    [temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.top);
//        make.left.mas_equalTo(temperatureTitleLabel.left + 20);
//        make.width.height.mas_equalTo(self.width - 50);
//    }];
    //temperatureLabel.backgroundColor = [UIColor goldColor];
    temperatureLabel.text = [NSString stringWithFormat:@"%d°",(int)_temperature];
    temperatureLabel.font = [UIFont fontWithName:LATO_LIGHT size:100];
    temperatureLabel.textAlignment = NSTextAlignmentCenter;
    temperatureLabel.textColor = [UIColor paleVioletRed];
}
















@end
