//
//  MY_HumidityCountLabel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_HumidityCountLabel.h"
#import "MY_NumberCount.h"

@interface MY_HumidityCountLabel ()<MY_NumberCountDelegate>

@end

@implementation MY_HumidityCountLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.countLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.alpha = 0;
        [self addSubview:self.countLabel];
        
        self.humidityCount = [MY_HumidityCount new];
        self.humidityCount.delegate = self;
    }
    return self;
}

- (void)my_numberCount:(MY_NumberCount *)numberCount currentSting:(NSAttributedString *)string {
    
    self.countLabel.attributedText = string;
}

- (void)my_hunidityCountShowDuration:(CGFloat)duration {
    
    self.humidityCount.fromValue = self.fromValue;
    self.humidityCount.toValue   = self.toValue;
    self.humidityCount.duration  = duration;
    self.countLabel.transform    = CGAffineTransformMake(1.5, 0, 0, 1.5, 0, 0);
    [self.humidityCount my_humidityCountAnimationStart];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        self.countLabel.alpha     = 1.f;
    }];
}

- (void)my_hunidityCountHideDuration:(CGFloat)duration {
    
    self.humidityCount.fromValue = self.toValue;
    self.humidityCount.toValue   = 0;
    self.humidityCount.duration  = duration;
    [self.humidityCount my_humidityCountAnimationStart];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
        self.countLabel.alpha =0.f;
    }];
}












@end
