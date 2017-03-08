//
//  MY_RotatedAngleView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_RotatedAngleView.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)

@interface MY_RotatedAngleView ()

@property (nonatomic, assign) CGAffineTransform defaultTransform;

@end


@implementation MY_RotatedAngleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //存储默认的旋转值
        self.defaultTransform = self.transform;
    }
    return self;
}

/**
 旋转角度和持续时间
 @param angle 旋转角度
 @param duration 持续时间
 */
- (void)my_rotatedAngle:(CGFloat)angle duration:(CGFloat)duration {
    
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformRotate(_defaultTransform, RADIAN(angle));
    }];
}

/**
 旋转角度
 @param angle 旋转角度
 */
- (void)my_rotatedAngle:(CGFloat)angle {
    
    self.transform = CGAffineTransformRotate(_defaultTransform, RADIAN(angle));
}

/**
 恢复动画效果
 @param duration 恢复的时间
 */
- (void)my_recoverDuration:(CGFloat)duration {
    
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformRotate(_defaultTransform, 0);
    }];
}





















@end
