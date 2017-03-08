//
//  MY_AnimatedLineView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_AnimatedLineView : UIView

/**
 显示的图片
 */
@property (nonatomic, strong) UIImage *my_animatedLineimage;

/**
 显示出来

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_animatedLineViewShowWithDuration:(CGFloat)duration animated:(BOOL)animated;

/**
 隐藏

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_animatedLineViewHideWithDuration:(CGFloat)duration animated:(BOOL)animated;



@end
