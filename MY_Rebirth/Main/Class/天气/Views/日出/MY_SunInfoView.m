//
//  MY_SunInfoView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_SunInfoView.h"

@interface MY_SunInfoView ()

@property (nonatomic, copy  ) NSString *sunRise;
@property (nonatomic, copy  ) NSString *sunSet;

@end



@implementation MY_SunInfoView

- (instancetype)initWithFrame:(CGRect)frame withSunSire:(NSString *)sunRise sunSet:(NSString *)sunSet {
    if (self = [super initWithFrame:frame]) {
        
        _sunRise = sunRise;
        
        //self.backgroundColor = [UIColor redColor];
        
        [self buildSunInfoView];
    }
    return self;
}


/**
 设置界面
 */
- (void)buildSunInfoView {
    
    __block MY_SunInfoView * weakSelf = self;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    titleLabel.frame = CGRectMake(20, 0, self.width - 40, 35);
    titleLabel.text  = @"Sunrise/Sunset";
    titleLabel.font  = [UIFont fontWithName:LATO_LIGHT size:AllTitleFont];
    //Sunrise 日出
    UIView *sunriseView = [[UIView alloc] init];
    [self addSubview:sunriseView];
    [sunriseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-weakSelf.width / 2));
        make.width.mas_equalTo(54);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.height.mas_equalTo(weakSelf.width / 2);
    }];
    //sunriseView.backgroundColor = [UIColor greenColor];
    
    UIImageView *sunriseImage = [[UIImageView alloc] init];
    [sunriseView addSubview:sunriseImage];
    [sunriseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(sunriseView);
        make.height.mas_equalTo(weakSelf.width / 4);
    }];
    sunriseImage.image = [UIImage imageNamed:@"sun"];
    //线
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [sunriseView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sunriseImage.mas_bottom).offset(1);
        make.right.left.mas_equalTo(sunriseView);
        make.height.mas_equalTo(1);
    }];
    UILabel *timeLabel = [[UILabel alloc] init];
    [sunriseView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sunriseImage.mas_bottom).offset(2);
        make.height.mas_equalTo(30);
        make.right.left.mas_equalTo(sunriseView);
    }];
    timeLabel.text = _sunRise;
    timeLabel.font = [UIFont systemFontOfSize:13];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //日落
    UIView *sunSetView = [[UIView alloc] init];
    [self addSubview:sunSetView];
    [sunSetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sunriseView.mas_right);
        make.top.mas_equalTo(sunriseView.mas_top);
        make.width.height.mas_equalTo(sunriseView);
    }];
    //sunSetView.backgroundColor = [UIColor grayColor];
    UIImageView *sunSetImage = [[UIImageView alloc] init];
    [sunSetView addSubview:sunSetImage];
    [sunSetImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(sunSetView.mas_bottom);
        make.height.mas_equalTo(self.width / 4);
        make.right.left.mas_equalTo(sunSetView);
    }];
    sunSetImage.image = [UIImage imageNamed:@"moon"];
    //线
    UIView *lineViewTwo = [[UIView alloc] init];
    lineViewTwo.backgroundColor = [UIColor grayColor];
    [sunSetView addSubview:lineViewTwo];
    [lineViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(sunSetImage.mas_top).offset(-1);
        make.right.left.mas_equalTo(sunSetImage);
        make.height.mas_equalTo(1);
    }];
    UILabel *timeSetLabel = [[UILabel alloc] init];
    [sunSetView addSubview:timeSetLabel];
    [timeSetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lineViewTwo.mas_top);
        make.right.left.mas_equalTo(lineViewTwo);
        make.height.mas_equalTo(30);
    }];
    timeSetLabel.text = _sunRise;
    timeSetLabel.font = [UIFont systemFontOfSize:13];
    timeSetLabel.textAlignment = NSTextAlignmentCenter;
    
    
}







@end
