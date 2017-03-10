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
 重写init方法

 @param frame frame
 @param windSpeed 风速
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame windSpeed:(CGFloat)windSpeed;



@end
