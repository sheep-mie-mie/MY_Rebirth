//
//  MY_WindSpeedCount.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WindSpeedCount.h"
#import "MY_ConfigAttributedString.h"


@implementation MY_WindSpeedCount

- (void)my_windSpeedCountStartAnimation {
    
    //初始化
    CGFloat fromeValue = self.fromValue;
    CGFloat toValue    = self.toValue;
    CGFloat duration   = (self.duration <= 0 ? 1.f : self.duration);
    //设定动画
    self.countAnimation.fromValue      = @(fromeValue);
    self.countAnimation.toValue        = @(toValue);
    self.countAnimation.timingFunction = \
    [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    self.countAnimation.duration       = duration;
    //只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(my_numberCount:currentSting:)]) {
        //将计算出来的值通过writeBlick动态给控件设定
        self.countAnimation.property = \
        [POPMutableAnimatableProperty propertyWithName:@"conutAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
            prop.writeBlock      = ^(id obj, const CGFloat values[]) {
                NSNumber *number = @(values[0]);
                NSAttributedString *ats = [self accessNumber:number];
                [self.delegate my_numberCount:self currentSting:ats];
            };
        }];
        //添加动画
        [self pop_addAnimation:self.countAnimation forKey:nil];
    }
}

- (NSAttributedString *)accessNumber:(NSNumber *)number {
    
    CGFloat count    = [number floatValue];
    
    NSString *countStr = [NSString stringWithFormat:@"%.2f", count];
    NSString *totalStr = [NSString stringWithFormat:@"%@ mps", countStr];
    UIFont *font1       = [UIFont fontWithName:LATO_REGULAR size:12.f];
    UIFont *font2       = [UIFont fontWithName:LATO_BOLD size:10.f];
    // 全局的区域
    NSRange totalRange   = [totalStr range];
    // %的区域
    NSRange countRange   = [countStr rangeFrom:totalStr];
    
    return [totalStr createAttributedStrubgAndConfig:@[
                                                       //全局设置
                                                       [MY_ConfigAttributedString font:font2 range:totalRange],
                                                       [MY_ConfigAttributedString font:font1 range:countRange],
                                                       [MY_ConfigAttributedString foregroundColor:COLOR_CIRCLE_ range:totalRange],
                                                       //局部设置
                                                       [MY_ConfigAttributedString foregroundColor:[UIColor blackColor] range:countRange],
                                                       ]];
}








@end
