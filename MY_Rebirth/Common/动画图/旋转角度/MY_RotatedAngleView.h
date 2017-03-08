//
//  MY_RotatedAngleView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_RotatedAngleView : UIView


/**
 旋转角度和持续时间

 @param angle 旋转角度
 @param duration 持续时间
 */
- (void)my_rotatedAngle:(CGFloat)angle duration:(CGFloat)duration;

/**
 旋转角度

 @param angle 旋转角度
 */
- (void)my_rotatedAngle:(CGFloat)angle;

/**
 恢复动画效果

 @param duration 恢复的时间
 */
- (void)my_recoverDuration:(CGFloat)duration;














@end
