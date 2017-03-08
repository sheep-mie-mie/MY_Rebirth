//
//  NSString+MY_NSString.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MY_NSString)
/**1
 通过整理空白字符串
 @return 不含有空格的字符串
 */
- (NSString *)stringByTrimingWhitespace;


/**2
 计算字符串展示几行
 @return 行数
 */
- (NSUInteger)numberOfLines;


/**3
 创建富文本并配置富文本
 @param configs NSArray中的数据必须是NSMutableAttributedString对象合集
 @return 富文本
 */
- (NSMutableAttributedString *)createAttributedStrubgAndConfig:(NSArray *)configs;


/**4
 用于搜寻一段字符串在另一段字符串中的NSRange值
 @param string 字符串
 @return NSRange
 */
- (NSRange)rangeFrom:(NSString *)string;


/**5
 本字符串的range
 @return range
 */
- (NSRange)range;




@end
