//
//  MY_CircleView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_CircleView : UIView

#warning mark--是否可以外部修改 后面是否外部调用 如果不调用可以改为成员变量
/**
 线条宽度
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 线条颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 旋转方向 顺时针/逆时针
 */
@property (nonatomic, assign) BOOL clockWise;

/**
 开始角度
 */
@property (nonatomic, assign) CGFloat startAngle;

/**
 创建视图
 */
- (void)my_circkeViewBuildView;

/**
 做stroke动画
 
 @param value 取值 [0,1]
 @param animated 是否执行动画
 @param duration 持续时间
 */
//结束
- (void)my_circkeViewStrokeEnd:(CGFloat)value
                      animated:(BOOL)animated
                      duration:(CGFloat)duration;
//开始
- (void)my_circkeViewStrokeStart:(CGFloat)value
                        animated:(BOOL)animated
                        duration:(CGFloat)duration;


/**
 创建出默认配置的View

 @param frame 设置view大小
 @return 实例对象
 */
+ (instancetype)my_circkeViewCreateDefaultViewWithFrame:(CGRect)frame;










@end
