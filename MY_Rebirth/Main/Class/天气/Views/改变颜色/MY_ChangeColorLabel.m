//
//  MY_ChangeColorLabel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_ChangeColorLabel.h"
#import "MY_AlphaView.h"

@interface MY_ChangeColorLabel ()

@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UILabel *alphaLabel;
@property (nonatomic, strong) MY_AlphaView *alphaView;

@end


@implementation MY_ChangeColorLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initLabels];
    }
    return self;
}

- (void)initLabels {
    
    self.showLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.showLabel];
    self.alphaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.alphaLabel];
    //设定alphaView
    self.alphaView = [[MY_AlphaView alloc] initWithFrame:CGRectZero];
    self.alphaView.colors = @[[UIColor clearColor],
                              [UIColor blackColor],
                              [UIColor blackColor],
                              [UIColor blackColor]];
    self.alphaView.locations = @[@(0.f), @(0.05), @(0.95), @(1.f)];
    self.alphaView.startPoint = CGPointMake(0, 0);
    self.alphaView.endPoint = CGPointMake(1, 0);
    self.alphaView.maskView = self.alphaView;
}

/**
 设定文本后将会重新更新控件
 */
- (void)my_changeColorUpdateLabelView {
    //字体
    UIFont *font = (self.font == nil ? self.showLabel.font : self.font);
    //设置文本+设置颜色+设置字体
    self.showLabel.text = self.text;
    self.alphaLabel.text = self.text;
    self.showLabel.textColor = self.textColor;
    self.alphaLabel.textColor = self.changedColor;
    self.showLabel.font = font;
    self.alphaLabel.font = font;
    //重置文本位置
    [self.showLabel sizeToFit];
    [self.alphaLabel sizeToFit];
    //重写设置alphaView的frame值
    self.alphaView.width = self.showLabel.width;
    self.alphaView.height = self.showLabel.height;
}

- (void)my_changeColorPercent:(CGFloat)percent {
    if (percent <= 0) {
        self.alphaView.x = -self.showLabel.width;
    } else {
        self.alphaView.x = -self.showLabel.width + percent * self.showLabel.width;
    }
}






@end
