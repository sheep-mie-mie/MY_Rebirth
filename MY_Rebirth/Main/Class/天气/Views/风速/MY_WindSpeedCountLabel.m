//
//  MY_WindSpeedCountLabel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WindSpeedCountLabel.h"

@interface MY_WindSpeedCountLabel ()<MY_NumberCountDelegate>

@end


@implementation MY_WindSpeedCountLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.countLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.countLabel.textAlignment = NSTextAlignmentRight;
        self.countLabel.alpha = 0;
        [self addSubview:self.countLabel];
        
        self.windSpeedCount = [MY_WindSpeedCount new];
        self.windSpeedCount.delegate = self;
    }
    return self;
}

- (void)my_numberCount:(MY_NumberCount *)numberCount currentSting:(NSAttributedString *)string {
    
    self.countLabel.attributedText = string;
}

- (void)my_windSpeedCountLabelShowDuration:(CGFloat)duration {
    
    self.windSpeedCount.fromValue = self.fromValue;
    self.windSpeedCount.toValue = self.toValue;
    self.windSpeedCount.duration = duration;
    [self.windSpeedCount my_windSpeedCountStartAnimation];
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha = 1.f;
    }];
}

- (void)my_windSpeedCountLabelHideDuration:(CGFloat)duration {
    
    self.windSpeedCount.fromValue = self.toValue;
    self.windSpeedCount.toValue = 0;
    self.windSpeedCount.duration = duration;
    [self.windSpeedCount my_windSpeedCountStartAnimation];
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha = 0.f;
    }];
    
}





@end
