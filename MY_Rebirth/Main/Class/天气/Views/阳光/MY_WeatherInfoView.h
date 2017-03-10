//
//  MY_WeatherInfoView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_WeatherInfoView : UIView


/**
 重写init

 @param frame frame
 @param weatherNumber 天气文本
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame weatherNumber:(NSInteger)weatherNumber;




@end
