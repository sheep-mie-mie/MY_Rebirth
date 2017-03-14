//
//  MY_MaxTempView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_MaxTempView.h"

@interface MY_MaxTempView ()

/**
 最高温度
 */
@property (nonatomic, copy  ) NSString *heightTem;
/**
 最低温蒂
 */
@property (nonatomic, copy  ) NSString *lowTem;
@end


@implementation MY_MaxTempView

- (instancetype)initWithFrame:(CGRect)frame HeightTem:(NSString *)heightTem lowTem:(NSString *)lowTem {
    if (self = [super initWithFrame:frame]) {
        
        _heightTem = heightTem;
        _lowTem    = lowTem;
        
        [self buildMaxAndMinTemView];
    }
    return self;
}

/**
 设置界面
 */
- (void)buildMaxAndMinTemView {
    //标题
    UILabel *temTitleLabel = [[UILabel alloc] init];
    [self addSubview:temTitleLabel];
    [temTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.height.mas_equalTo(35);
        make.right.mas_equalTo(self.right).offset(-20);
    }];
    temTitleLabel.text = @"Min/Max Temp";
    temTitleLabel.font = [UIFont fontWithName:LATO_LIGHT size:AllTitleFont];
    //线条
    UIView *temLineView = [[UIView alloc] init];
    [self addSubview:temLineView];
    [temLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(30);
        make.left.mas_equalTo(self.mas_left).offset(25);
        make.right.mas_equalTo(self.mas_right).offset(-25);
        make.height.mas_equalTo(1);
    }];
    temLineView.backgroundColor = [UIColor blackColor];
    //柱形
    UIView *firstZhuView = [[UIView alloc] init];
    [self addSubview:firstZhuView];
    [firstZhuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(temLineView.mas_centerX).offset(-15);
        make.bottom.mas_equalTo(temLineView.mas_top);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(10);
    }];
    firstZhuView.backgroundColor = [UIColor blackColor];
    //柱二
    UIView *secondZhuView = [[UIView alloc] init];
    [self addSubview:secondZhuView];
    [secondZhuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(temLineView.mas_centerX).offset(15);
        make.bottom.mas_equalTo(temLineView.mas_top);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(40);
    }];
    secondZhuView.backgroundColor = [UIColor blackColor];
    //Min
    UILabel *minTemLabel = [[UILabel alloc] init];
    [self addSubview:minTemLabel];
    [minTemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(firstZhuView);
        make.top.mas_equalTo(temLineView.mas_bottom).offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(40);
    }];
    minTemLabel.text = [NSString stringWithFormat:@"Min%@°",_lowTem];
    minTemLabel.font = [UIFont systemFontOfSize:11];
    //Max
    UILabel *maxTemLabel = [[UILabel alloc] init];
    [self addSubview:maxTemLabel];
    [maxTemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(secondZhuView);
        make.top.mas_equalTo(temLineView.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(40);
    }];
    maxTemLabel.text = [NSString stringWithFormat:@"Min%@°",_heightTem];
    maxTemLabel.font = [UIFont systemFontOfSize:12];
}












@end
