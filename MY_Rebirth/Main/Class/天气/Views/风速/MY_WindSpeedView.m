//
//  MY_WindSpeedView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WindSpeedView.h"


@interface MY_WindSpeedView ()

/**
 风速
 */
@property (nonatomic, assign) CGFloat windSpeed;

@end


@implementation MY_WindSpeedView

- (instancetype)initWithFrame:(CGRect)frame
                    windSpeed:(CGFloat)windSpeed {
    if (self = [super initWithFrame:frame]) {
        
        _windSpeed = windSpeed;
        
        [self buildWindSpeedView];
    }
    return self;
}

/**
 设置风速页面
 */
- (void)buildWindSpeedView {
    
    //self.backgroundColor = [UIColor orangeRed];
    
    UIView *shanView = [[UIView alloc] init];
    shanView.bounds = CGRectMake(0, 0, MAINSCREEN_WIDTH / 2 - 45, MAINSCREEN_WIDTH / 2 - 45);
    //shanView.backgroundColor = [UIColor blueViolet];
    shanView.center =  CGPointMake(MAINSCREEN_WIDTH / 4, MAINSCREEN_WIDTH / 4 );
    [self addSubview:shanView];
    //标题
    UILabel *windTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, MAINSCREEN_WIDTH / 2 - 40, 35)];
    windTitleLabel.text = @"Wind Speed";
    windTitleLabel.font = [UIFont fontWithName:LATO_LIGHT size:AllTitleFont];
    //windTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:windTitleLabel];
    //windTitleLabel.backgroundColor = [UIColor blueColor];
    //棍
    UIView *gunView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, MAINSCREEN_WIDTH / 4 - 20)];
    gunView.backgroundColor = [UIColor blackColor];
    [shanView addSubview:gunView];
    gunView.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 4 * 3 - 10);
    
    //扇叶一
    UIView *shanOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, MAINSCREEN_WIDTH / 2 - 90)];
    shanOne.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2 - 10);
    [shanView addSubview:shanOne];
    UIImageView *imageOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 15, (MAINSCREEN_WIDTH / 2 - 90) / 2)];
    [shanOne addSubview:imageOne];
    imageOne.image = [UIImage imageNamed:@"WindSpeed"];
    imageOne.contentMode = UIViewContentModeScaleAspectFit;
    [shanOne addSubview:imageOne];
    //扇叶二
    UIView *shanTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, MAINSCREEN_WIDTH / 2 - 90)];
    shanTwo.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2 - 10);
    [shanView addSubview:shanTwo];
    UIImageView *imageTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 15, (MAINSCREEN_WIDTH / 2 - 90) / 2)];
    [shanOne addSubview:imageTwo];
    imageTwo.image = [UIImage imageNamed:@"WindSpeed"];
    imageTwo.contentMode = UIViewContentModeScaleAspectFit;
    [shanTwo addSubview:imageTwo];
    shanTwo.transform = CGAffineTransformRotate(shanTwo.transform, M_PI/180.f*120);
    //扇叶三
    UIView *shanThree = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, MAINSCREEN_WIDTH / 2 - 90)];
    shanThree.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2 - 10);
    [shanView addSubview:shanThree];
    UIImageView *imageThree = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 15, (MAINSCREEN_WIDTH / 2 - 90) / 2)];
    [shanThree addSubview:imageThree];
    imageThree.image = [UIImage imageNamed:@"WindSpeed"];
    imageThree.contentMode = UIViewContentModeScaleAspectFit;
    [shanThree addSubview:imageThree];
    shanThree.transform = CGAffineTransformRotate(shanThree.transform, M_PI/180.f*240);
    
    //动画
    CABasicAnimation *posttionAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnima.fromValue  = @(0);
    posttionAnima.toValue    = @(M_PI / 3 * 2);
    posttionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnima.duration    = _windSpeed;
    posttionAnima.repeatCount = HUGE_VALF;
    posttionAnima.fillMode    = kCAFillModeForwards;
    posttionAnima.removedOnCompletion = NO;
    [shanOne.layer addAnimation:posttionAnima forKey:@"shanOne"];
    
    CABasicAnimation *posttionAnimaTwo = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnimaTwo.fromValue = @(M_PI / 3 * 2);
    posttionAnimaTwo.toValue   = @(M_PI / 3 * 4);
    posttionAnimaTwo.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnimaTwo.duration = _windSpeed;
    posttionAnimaTwo.repeatCount = HUGE_VALF;
    posttionAnimaTwo.fillMode = kCAFillModeForwards;
    posttionAnimaTwo.removedOnCompletion = NO;
    [shanTwo.layer addAnimation:posttionAnimaTwo forKey:@"shanTwo"];
    
    CABasicAnimation *posttionAnimaThree = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnimaThree.fromValue = @(M_PI / 3 * 4);
    posttionAnimaThree.toValue   = @(M_PI / 3 * 6);
    posttionAnimaThree.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnimaThree.duration = _windSpeed;
    posttionAnimaThree.repeatCount = HUGE_VALF;
    posttionAnimaThree.fillMode = kCAFillModeForwards;
    posttionAnimaThree.removedOnCompletion = NO;
    [shanThree.layer addAnimation:posttionAnimaThree forKey:@"shanThree"];
    
    UILabel *windSpeedLabel = [[UILabel alloc] init];
    [shanView addSubview:windSpeedLabel];
    [windSpeedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(shanView);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(shanView.width / 2 - 5);
    }];
    windSpeedLabel.text = [NSString stringWithFormat:@"%.2fmps",_windSpeed];
    windSpeedLabel.font = [UIFont systemFontOfSize:13];
    windSpeedLabel.textAlignment = NSTextAlignmentCenter;
    //windSpeedLabel.backgroundColor = [UIColor goldColor];
}
























@end
