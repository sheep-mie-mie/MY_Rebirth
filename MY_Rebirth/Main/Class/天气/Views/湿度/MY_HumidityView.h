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
 重写init方法

 @param frame frame
 @param humidity 湿度
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame withHumidity:(CGFloat)humidity;





@end
