//
//  MY_NumberCount.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_NumberCount.h"

@implementation MY_NumberCount

- (instancetype)init {
    if (self = [super init]) {
        
        self.countAnimation = [POPBasicAnimation animation];
    }
    return self;
}

- (void)my_numberCountAnimationStart {
    //初始值
    CGFloat fromValue = self.fromValue;
    CGFloat toValue   = self.toValue;
    CGFloat duration  = (self.duration <= 0 ? 1.f : self.duration);
    //设定动画
    self.countAnimation.fromValue = @(fromValue);
    self.countAnimation.toValue   = @(toValue);
    self.countAnimation.timingFunction = \
    [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    self.countAnimation.duration  = duration;
    //只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(my_numberCount:currentNumber:)]) {
        //将计算出来的值通过writeBlock动态给控件设定
        self.countAnimation.property = \
        [POPMutableAnimatableProperty propertyWithName:@"conutAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
            
            prop.writeBlock = ^(id obj, const CGFloat values[]) {
                NSNumber *number = @(values[0]);
                [_delegate my_numberCount:self currentNumber:number];
            };
        }];
    }
    //添加动画
    [self pop_addAnimation:self.countAnimation forKey:nil];
}























@end
