//
//  MY_HumidityCountLabel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_HumidityCount.h"

@interface MY_HumidityCountLabel : UIView

/**
 起始值
 */
@property (nonatomic, assign) CGFloat fromValue;

/**
 结束值
 */
@property (nonatomic, assign) CGFloat toValue;

/**
 动画引擎
 */
@property (nonatomic, strong) MY_HumidityCount *humidityCount;

/**
 显示用的label
 */
@property (nonatomic, strong) UILabel *countLabel;

/**
 显示动画

 @param duration 动画时间
 */
- (void)my_hunidityCountShowDuration:(CGFloat)duration;

/**
 隐藏动画

 @param duration 隐藏时间
 */
- (void)my_hunidityCountHideDuration:(CGFloat)duration;




@end
