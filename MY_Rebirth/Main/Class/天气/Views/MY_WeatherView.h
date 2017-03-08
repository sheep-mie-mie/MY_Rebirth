//
//  MY_WeatherView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MY_WeatherViewDelegate <NSObject>

/**
 上拉加载事件

 @param condition 数据
 */
- (void)my_weatherViewPullUpEventWithData:(NSDictionary *)condition;
/**
 下拉刷新
 */
- (void)my_weatherViewPullDownToRefreshData;

@end


@interface MY_WeatherView : UIView


/**
 代理
 */
@property (nonatomic, assign) id<MY_WeatherViewDelegate> delegate;

#warning mark--天气数据

/**
 显示动画
 */
- (void)my_weatherViewAnimationShow;

/**
 隐藏动画
 */
- (void)my_weatherViewAnimationHide;

/**
 创建出View
 */
- (void)my_weatherViewBuildView;














@end
