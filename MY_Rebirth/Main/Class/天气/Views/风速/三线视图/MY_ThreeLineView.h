//
//  MY_ThreeLineView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MY_ThreeLineView : UIView

/**
 显示出来

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_threeLineViewShowWithDuration:(CGFloat)duration animated:(BOOL)animated;


/**
 隐藏

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_threeLineViewHideWithDuration:(CGFloat)duration animated:(BOOL)animated;

/**
 风的速度 这个值必须给
 */
@property (nonatomic, assign) CGFloat circleByOneSecond;

/**
 一秒钟旋转几圈
 */
- (void)my_threeLineViewRotateImageViewWithCircleByOneSecond;


@end
