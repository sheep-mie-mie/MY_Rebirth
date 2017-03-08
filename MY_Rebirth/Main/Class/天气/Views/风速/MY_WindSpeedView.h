//
//  MY_WindSpeedView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_WindSpeedView : UIView

/**
 一秒钟转几圈
 */
@property (nonatomic, assign) CGFloat circleByOneSecond;

/**
 风的速度
 */
@property (nonatomic, assign) CGFloat windSpeed;

/**
 创建View
 */
- (void)my_windSpeedViewBuildView;

/**
 显示
 */
- (void)my_windSpeedViewShow;

/**
 隐藏
 */
- (void)my_windSpeedViewHide;



@end
