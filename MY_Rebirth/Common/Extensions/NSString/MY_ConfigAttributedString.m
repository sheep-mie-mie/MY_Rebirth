//
//  MY_ConfigAttributedString.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_ConfigAttributedString.h"

@interface MY_ConfigAttributedString ()
/**
 富文本属性
 */
@property (nonatomic, strong) NSString *attribute;
/**
 富文本值
 */
@property (nonatomic, assign) id value;
/**
 富文本范围值
 */
@property (nonatomic, assign) NSRange range;

@end


@implementation MY_ConfigAttributedString
/**
 通用型配置
 */
+ (instancetype)attribute:(NSString *)attrubute
                    value:(id)value
                    range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = attrubute;
    config.value     = value;
    config.range     = range;
    return config;
}

/**
 设置字体
 */
+ (instancetype)font:(UIFont *)font range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSFontAttributeName;
    config.value = font;
    config.range =range;
    return config;
}
/**
 配置字体颜色
 */
+ (instancetype)foregroundColor:(UIColor *)color range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSForegroundColorAttributeName;
    config.value = color;
    config.range = range;
    return config;
}

/**
 配置字体背景颜色
 */
+ (instancetype)backgroundColor:(UIColor *)color range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSBackgroundColorAttributeName;
    config.value = color;
    config.range = range;
    return config;
}

/**
 配置文字的中划线
 */
+ (instancetype)strikethroughStyle:(NSInteger)number range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSStrikethroughStyleAttributeName;
    config.value = [NSNumber numberWithInteger:number];
    config.range = range;
    return config;
}

/**
 段落样式 需要将UILabel中的numberOfLines设置为0才有用
 */
+ (instancetype)paragraphStyle:(NSMutableParagraphStyle *)style range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSParagraphStyleAttributeName;
    config.value     = style;
    config.range     = range;
    return config;
}

/**
 字间距
 */
+ (instancetype)kern:(float)number range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSKernAttributeName;
    config.value     = [NSNumber numberWithFloat:number];
    config.range     = range;
    return config;
}

/**
 配置文字的下划线
 */
+ (instancetype)underlineStyle:(NSInteger)number range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSUnderlineStyleAttributeName;
    config.value     = [NSNumber numberWithInteger:number];
    config.range     = range;
    return config;
}

/**
 字体描边颜色以及描边宽度以及阴影 三个方法可以一起使用
 */
//颜色
+ (instancetype)strokeColor:(UIColor *)color range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSStrokeColorAttributeName;
    config.value     = color;
    config.range     = range;
    return config;
}
//宽度
+ (instancetype)strokeWidth:(float)number range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSStrokeWidthAttributeName;
    config.value     = [NSNumber numberWithFloat:number];
    config.range     = range;
    return config;
}
//阴影
+ (instancetype)shadow:(NSShadow *)shadow range:(NSRange)range {
    MY_ConfigAttributedString *config = [self new];
    config.attribute = NSShadowAttributeName;
    config.value     = shadow;
    config.range     = range;
    return config;
}













@end
