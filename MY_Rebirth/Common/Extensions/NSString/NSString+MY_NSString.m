//
//  NSString+MY_NSString.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "NSString+MY_NSString.h"
#import "MY_ConfigAttributedString.h"

@implementation NSString (MY_NSString)
/**1
 通过整理空白字符串
 */
- (NSString *)stringByTrimingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


/**2
 计算字符串行数
 */
- (NSUInteger)numberOfLines {
    return [[self componentsSeparatedByString:@"\n"] count] + 1;
}


/**3
 创建富文本并配置富文本
 @param configs NSArray中的数据必须是NSMutableAttributedString对象合集
 @return 富文本
 */
- (NSMutableAttributedString *)createAttributedStrubgAndConfig:(NSArray *)configs {
    
    NSMutableAttributedString *attributedString = \
    [[NSMutableAttributedString alloc] initWithString:self];
    
    [configs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MY_ConfigAttributedString *oneConfig = obj;
        [attributedString addAttribute:oneConfig.attribute
                                 value:oneConfig.value
                                 range:oneConfig.range];
    }];
    return attributedString;
}


/**4
 用于搜寻一段字符串在另一段字符串中的NSRange值
 @param string 字符串
 @return NSRange
 */
- (NSRange)rangeFrom:(NSString *)string {
   
    return [string rangeOfString:self];
}


/**5
 本字符串的range
 @return range
 */
- (NSRange)range {
    
    return NSMakeRange(0, self.length);
}







@end
