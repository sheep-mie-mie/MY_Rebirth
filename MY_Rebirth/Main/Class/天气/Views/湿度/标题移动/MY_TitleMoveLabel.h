//
//  MY_TitleMoveLabel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TITLE_MOVE_LABEL_SHOW_DURATION  1.75
#define TITLE_MOVE_LABEL_HIDE_DURATION  0.75

@interface MY_TitleMoveLabel : UIView

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *textColor;

/**
 移动距离
 */
@property (nonatomic, assign) CGFloat moveGap;

/**
 创建View
 */
- (void)my_titleModeBuildView;

/**
 展示view
 */
- (void)my_titleModeShow;

/**
 隐藏view
 */
- (void)my_titleModelHide;

+ (MY_TitleMoveLabel *)withText:(NSString *)text;



@end
