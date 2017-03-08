//
//  MY_HumidityView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_HumidityView.h"
#import "MY_CircleView.h"
#import "MY_RotatedAngleView.h"
#import "MY_HumidityCountLabel.h"
#import "MY_TitleMoveLabel.h"

@interface MY_HumidityView ()

/**
 满圆
 */
@property (nonatomic, strong) MY_CircleView *fullCircle;
/**
 展示圆
 */
@property (nonatomic, strong) MY_CircleView *showCircle;
/**
 角度视图
 */
@property (nonatomic, strong) MY_RotatedAngleView *rotateView;
/**
 动画引擎
 */
@property (nonatomic, strong) MY_HumidityCountLabel *countLabel;
/**
 移动标题
 */
@property (nonatomic, strong) MY_TitleMoveLabel *titleMoveLabel;

@end


@implementation MY_HumidityView

- (void)my_humidityViewBuildView {
    
    CGRect circleRect = CGRectZero;
    CGRect rotateRect = CGRectZero;
    if (iPhone5_5s || iPhone4_4s) {
        
        circleRect = CGRectMake(0, 0, 100, 100);
        rotateRect = CGRectMake(37, 40, circleRect.size.width, circleRect.size.height);
    } else if (iPhone6_6s) {
        circleRect = CGRectMake(0, 0, 110, 110);
        rotateRect = CGRectMake(40, 50, circleRect.size.width, circleRect.size.height);
    } else if (iPhone6_6sPlus) {
        circleRect = CGRectMake(0, 0, 115, 115);
        rotateRect = CGRectMake(45, 55, circleRect.size.width, circleRect.size.height);
    } else {
        circleRect = CGRectMake(0, 0, 90, 90);
        rotateRect = CGRectMake(25, 15, circleRect.size.width, circleRect.size.height);
    }
    //移动的头部位
    self.titleMoveLabel = [MY_TitleMoveLabel withText:@"Humidity"];
    [self addSubview:self.titleMoveLabel];
    //完整的圆
    self.fullCircle = [MY_CircleView my_circkeViewCreateDefaultViewWithFrame:circleRect];
    self.fullCircle.lineColor = COLOR_CIRCLE_;
    [self.fullCircle my_circkeViewBuildView];
    //局部显示的圆
    self.showCircle = [MY_CircleView my_circkeViewCreateDefaultViewWithFrame:circleRect];
    [self.showCircle my_circkeViewBuildView];
    //旋转的圆
    self.rotateView = [[MY_RotatedAngleView alloc] initWithFrame:rotateRect];
    [self.rotateView addSubview:self.fullCircle];
    [self.rotateView addSubview:self.showCircle];
    [self addSubview:self.rotateView];
    //计数的数据
    self.countLabel = [[MY_HumidityCountLabel alloc] initWithFrame:rotateRect];
    self.countLabel.backgroundColor = [UIColor clearColor];
    self.countLabel.x += 4;
    [self addSubview:self.countLabel];
}

- (void)my_humidityViewAnimationShow {
    
    CGFloat circleFullPercent = 0.75;
    CGFloat duration = 1.5;
    //进行参数复位
    [self.fullCircle my_circkeViewStrokeEnd:0 animated:NO duration:0];
    [self.showCircle my_circkeViewStrokeEnd:0 animated:NO duration:0];
    [self.fullCircle my_circkeViewStrokeStart:0 animated:NO duration:0];
    [self.showCircle my_circkeViewStrokeStart:0 animated:NO duration:0];
    [self.rotateView my_rotatedAngle:0];
    //标题显示
    [self.titleMoveLabel my_titleModeShow];
    //设置动画
    [self.fullCircle my_circkeViewStrokeEnd:circleFullPercent animated:YES duration:duration];
    [self.showCircle my_circkeViewStrokeEnd:circleFullPercent * self.humidityPercent animated:YES duration:duration];
    [self.rotateView my_rotatedAngle:45.f duration:duration];
    self.countLabel.toValue = self.humidityPercent * 100;
    [self.countLabel my_hunidityCountShowDuration:duration];
    
}

- (void)my_humidityViewAnimationHide {
    
    CGFloat duration = 0.75;
    CGFloat circleFullPercent = 0.75;
    //标题隐藏
    [self.titleMoveLabel my_titleModelHide];
    
    [self.fullCircle my_circkeViewStrokeStart:circleFullPercent animated:YES duration:duration];
    [self.showCircle my_circkeViewStrokeStart:self.humidityPercent * circleFullPercent animated:YES duration:duration];
    [self.rotateView my_rotatedAngle:90.f duration:duration];
    [self.countLabel my_hunidityCountHideDuration:duration];
}

@end
