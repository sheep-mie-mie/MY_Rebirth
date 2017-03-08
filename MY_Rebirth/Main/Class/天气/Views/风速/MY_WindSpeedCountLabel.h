//
//  MY_WindSpeedCountLabel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_WindSpeedCount.h"

@interface MY_WindSpeedCountLabel : UIView

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
@property (nonatomic, strong) MY_WindSpeedCount *windSpeedCount;

/**
 显示用的label
 */
@property (nonatomic, strong) UILabel *countLabel;

/**
 显示动画

 @param duration 动画时间
 */
- (void)my_windSpeedCountLabelShowDuration:(CGFloat)duration;

/**
 隐藏动画

 @param duration 隐藏时间
 */
- (void)my_windSpeedCountLabelHideDuration:(CGFloat)duration;










@end
