//
//  MY_TitleMoveLabel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_TitleMoveLabel.h"

@interface MY_TitleMoveLabel ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, assign) CGRect startRect;
@property (nonatomic, assign) CGRect midRect;
@property (nonatomic, assign) CGRect endRect;

@end


@implementation MY_TitleMoveLabel

- (void)my_titleModeBuildView {
    
    self.backgroundColor = [UIColor clearColor];
    //添加label
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = self.text;
    [self addSubview:self.label];
    
    //设置文本颜色
    if (self.textColor) {
        self.label.textColor = self.textColor;
    }
    //设置字体
    if (self.font) {
        self.label.font = self.font;
    }
    //重置frame值
    [self.label sizeToFit];
    //重置当前view的frame值
    self.width = self.label.width;
    self.height = self.label.height;
    //存储frame值
    self.label.x  -= self.moveGap;
    self.startRect = self.label.frame;
    self.label.x += self.moveGap;
    self.midRect  = self.label.frame;
    self.label.x += self.moveGap;
    self.endRect  = self.label.frame;
    //复位frame值
    self.label.frame = self.startRect;
    self.label.alpha = 0.f;
}

- (void)my_titleModeShow {
    [UIView animateWithDuration:TITLE_MOVE_LABEL_SHOW_DURATION animations:^{
        self.label.frame = self.midRect;
        self.label.alpha = 1.f;
    }];
}

- (void)my_titleModelHide {
    [UIView animateWithDuration:TITLE_MOVE_LABEL_HIDE_DURATION animations:^{
        self.label.frame = self.endRect;
        self.label.alpha = 0.f;
    } completion:^(BOOL finished) {
        self.label.frame = self.startRect;
    }];
}

+ (MY_TitleMoveLabel *)withText:(NSString *)text {
    
    MY_TitleMoveLabel *titleMove = [[MY_TitleMoveLabel alloc] initWithFrame:CGRectMake(20, 10, 0, 0)];
    titleMove.text = text;
    titleMove.textColor = [UIColor blackColor];
    
    if (iPhone4_4s || iPhone5_5s) {
        titleMove.font = [UIFont fontWithName:LATO_BOLD size:LATO_14];
    } else if (iPhone6_6s) {
        titleMove.font = [UIFont fontWithName:LATO_LIGHT size:17];
    } else if (iPhone6_6sPlus) {
        titleMove.font = [UIFont fontWithName:LATO_LIGHT size:20];
    } else {
        titleMove.font = [UIFont fontWithName:LATO_BOLD size:LATO_14];
    }
    titleMove.moveGap = 10.f;
    [titleMove my_titleModeBuildView];
    
    return titleMove;
}



@end
