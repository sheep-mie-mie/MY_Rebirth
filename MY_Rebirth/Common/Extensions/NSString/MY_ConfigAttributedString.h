//
//  MY_ConfigAttributedString.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MY_ConfigAttributedString : NSObject

/**
 富文本属性
 */
@property (nonatomic, strong, readonly) NSString *attribute;
/**
 富文本值
 */
@property (nonatomic, assign, readonly) id value;
/**
 富文本范围值
 */
@property (nonatomic, assign, readonly) NSRange range;


/**
 通用型配置

 @param attrubute 富文本属性
 @param value 富文本值
 @param range 富文本范围值
 @return 富文本
 */
+ (instancetype)attribute:(NSString *)attrubute
                    value:(id)value
                    range:(NSRange)range;

/**
 设置字体
 
 @param font font
 @param range 取值
 @return 字体
 */
+ (instancetype)font:(UIFont *)font range:(NSRange)range;

/**
 配置字体颜色
 
 @param color 字体颜色
 @param range 取值
 @return 颜色
 */
+ (instancetype)foregroundColor:(UIColor *)color range:(NSRange)range;

/**
 配置字体背景颜色

 @param color 背景颜色
 @param range 取值
 @return 颜色
 */
+ (instancetype)backgroundColor:(UIColor *)color range:(NSRange)range;


/**
 字体描边颜色以及描边宽度以及阴影 三个方法可以一起使用

 @param color 颜色
 @param range 取值
 @return 颜色
 */
+ (instancetype)strokeColor:(UIColor *)color range:(NSRange)range;
+ (instancetype)strokeWidth:(float)number range:(NSRange)range;
+ (instancetype)shadow:(NSShadow *)shadow range:(NSRange)range;

/**
 配置文字的中划线

 @param number number
 @param range 取值
 @return 划线
 */
+ (instancetype)strikethroughStyle:(NSInteger)number range:(NSRange)range;

/**
 配置文字的下划线

 @param number number
 @param range 取值
 @return 划线
 */
+ (instancetype)underlineStyle:(NSInteger)number range:(NSRange)range;

/**
 字间距

 @param number number
 @param range 取值
 @return 字间距
 */
+ (instancetype)kern:(float)number range:(NSRange)range;


/**
 段落样式 需要将UILabel中的numberOfLines设置为0才有用

 @param style 格式
 @param range 取回
 @return 样式
 */
+ (instancetype)paragraphStyle:(NSMutableParagraphStyle *)style range:(NSRange)range;






@end
