//
//  MY_NumberCount.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MY_NumberCount;
@protocol MY_NumberCountDelegate <NSObject>

@optional

/**
 最原始的方法

 @param numberCount 对象自己
 @param number 变化的值
 */
- (void)my_numberCount:(MY_NumberCount *)numberCount currentNumber:(NSNumber *)number;

/**
 子类可以实现的方法

 @param numberCount 对象自己
 @param string 子类返回的富文本
 */
- (void)my_numberCount:(MY_NumberCount *)numberCount currentSting:(NSAttributedString *)string;


@end

@interface MY_NumberCount : NSObject

/**
 代理
 */
@property (nonatomic, assign) id<MY_NumberCountDelegate> delegate;

/**
 动画实体
 */
@property (nonatomic, strong) POPBasicAnimation *countAnimation;

/**
 初始值
 */
@property (nonatomic, assign) CGFloat fromValue;

/**
 结束值
 */
@property (nonatomic, assign) CGFloat toValue;

/**
 动画持续时间
 */
@property (nonatomic, assign) CGFloat duration;

/**
 开始动画
 */
- (void)my_numberCountAnimationStart;







@end
