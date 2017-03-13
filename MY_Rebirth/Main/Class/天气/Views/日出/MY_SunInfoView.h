//
//  MY_SunInfoView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_SunInfoView : UIView


/**
 重写init方法

 @param frame 大小
 @param sunSire 日出值
 @param sunSet 日落值
 @return self对象
 */
- (instancetype)initWithFrame:(CGRect)frame
                  withSunSire:(NSString *)sunRise
                       sunSet:(NSString *)sunSet;








@end
