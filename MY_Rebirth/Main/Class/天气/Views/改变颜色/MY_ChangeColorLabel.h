//
//  MY_ChangeColorLabel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_ChangeColorLabel : UIView
/**
 字号
 */
@property (nonatomic, strong) UIFont *font;
/**
 字体颜色
 */
@property (nonatomic, strong) UIColor *textColor;
/**
 改变颜色
 */
@property (nonatomic, strong) UIColor *changedColor;


/**
 文本
 */
@property (nonatomic, strong) NSString *text;

/**
 设置文本后将会重新更新控件
 */
- (void)my_changeColorUpdateLabelView;

/**
 颜色百分百

 @param percent 颜色的百分比
 */
- (void)my_changeColorPercent:(CGFloat)percent;











@end
