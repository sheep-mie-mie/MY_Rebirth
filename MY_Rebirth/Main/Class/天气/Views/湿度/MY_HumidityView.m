//
//  MY_HumidityView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_HumidityView.h"


@interface MY_HumidityView ()



@end


@implementation MY_HumidityView



- (instancetype)initWithFrame:(CGRect)frame withHumidity:(CGFloat)humidity {
    if (self = [super initWithFrame:frame]) {
        
        //self.backgroundColor = [UIColor goldColor];
        
        [self my_humidityViewBuildView];
        
    }
    return self;
}


- (void)my_humidityViewBuildView {
    //
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left + 20);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(self.width - 40);
    }];
    titleLabel.text = @"Humidity";
    titleLabel.font = [UIFont fontWithName:LATO_LIGHT size:AllTitleFont];
    
    //layer层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    //贝塞尔曲线
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:MAINSCREEN_WIDTH / 7 startAngle:M_PI_4 endAngle:M_PI / 4 * 7 clockwise:YES];
    shapeLayer.path = shapePath.CGPath;
    shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth   = 2.f;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    //动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"shrokeEnd"];
    pathAnimation.duration = 5.f;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    pathAnimation.toValue   = [NSNumber numberWithFloat:1.f];
    pathAnimation.fillMode  = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    //湿度百分比
    //layer层
    CAShapeLayer *percentLayer = [CAShapeLayer layer];
    percentLayer.frame = self.bounds;
    //贝塞尔曲线
    UIBezierPath *percentPath =  [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:MAINSCREEN_WIDTH / 7 startAngle:M_PI_4 endAngle:M_PI / 4 * 4 clockwise:YES];
    percentLayer.path = percentPath.CGPath;
    percentLayer.fillColor   = [UIColor clearColor].CGColor;
    percentLayer.lineWidth   = 2.f;
    percentLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:percentLayer];
    //动画
    CABasicAnimation *percentAnimat = [CABasicAnimation animationWithKeyPath:@"percent"];
    percentAnimat.duration = 5.f;
    percentAnimat.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    percentAnimat.fromValue = [NSNumber numberWithFloat:0.f];
    percentAnimat.toValue   = [NSNumber numberWithFloat:0.5f];
    percentAnimat.fillMode  = kCAFillModeForwards;
    percentAnimat.removedOnCompletion = NO;
    [shapeLayer addAnimation:percentAnimat forKey:@"percentAnimat"];
//
    UILabel *percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self addSubview:percentLabel];
    percentLabel.center = CGPointMake(self.width / 2, self.height / 2);
//    [percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.mas_equalTo(self.width / 12);
//        make.width.height.mas_equalTo(40);
//    }];
    percentLabel.text = @"10%";
    percentLabel.textAlignment = NSTextAlignmentCenter;
    
}


@end
