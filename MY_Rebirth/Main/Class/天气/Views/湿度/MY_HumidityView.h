//
//  MY_HumidityView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_HumidityView : UIView


/**
 湿度百分比
 */
@property (nonatomic, assign) CGFloat humidityPercent;

/**
 创建视图
 */
- (void)my_humidityViewBuildView;

/**
 显示动画
 */
- (void)my_humidityViewAnimationShow;

/**
 隐藏动画
 */
- (void)my_humidityViewAnimationHide;



@end
