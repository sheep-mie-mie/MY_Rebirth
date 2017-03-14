//
//  MY_WeatherView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MY_WeatherViewDelegate <NSObject>



@end


@interface MY_WeatherView : UIView

@property (nonatomic, strong) MY_DetailWeatherModel *weatherModel;

/**
 代理
 */
@property (nonatomic, assign) id<MY_WeatherViewDelegate> delegate;



/**
 创建视图
 */
- (void)my_weatherViewBuildView;












@end
