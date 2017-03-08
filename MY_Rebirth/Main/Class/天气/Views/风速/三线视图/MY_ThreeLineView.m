//
//  MY_ThreeLineView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_ThreeLineView.h"
#import "MY_AnimatedLineView.h"

#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

@interface MY_ThreeLineView ()

@property (nonatomic, strong) MY_AnimatedLineView *oneLine;
@property (nonatomic, strong) MY_AnimatedLineView *twoLine;
@property (nonatomic, strong) MY_AnimatedLineView *threeLine;

@end


@implementation MY_ThreeLineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initLineViews];
        //通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventDidBecomeActive:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventDidBecomeActive:) name:UIApplicationWillResignActiveNotification object:nil];
    }
    return self;
}

- (void)initLineViews {
    
    UIImage *image = [UIImage imageNamed:@"WindSpeed"];
    CGFloat width  = self.height / image.size.height * image.size.width / 2.f;
    //初始化第一个叶子
    self.oneLine = [[MY_AnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.oneLine.my_animatedLineimage = image;
    self.oneLine.center = self.middlePoint;
    [self addSubview:self.oneLine];
    //初始化第二个叶子
    self.twoLine = [[MY_AnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.twoLine.my_animatedLineimage  = image;
    self.twoLine.center = self.middlePoint;
    [self addSubview:self.twoLine];
    self.twoLine.transform = CGAffineTransformRotate(self.twoLine.transform, RADIAN(120));
    // 初始化第三个叶子
    self.threeLine        = [[MY_AnimatedLineView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
    self.threeLine.my_animatedLineimage  = image;
    self.threeLine.center = self.middlePoint;
    [self addSubview:self.threeLine];
    self.threeLine.transform = CGAffineTransformRotate(self.threeLine.transform, RADIAN(240));
}

/**
 显示
 */
- (void)my_threeLineViewShowWithDuration:(CGFloat)duration animated:(BOOL)animated {
    
    [self.oneLine my_animatedLineViewShowWithDuration:duration animated:animated];
    [self.twoLine my_animatedLineViewShowWithDuration:duration animated:animated];
    [self.threeLine my_animatedLineViewShowWithDuration:duration animated:animated];
}

/**
 隐藏
 */
- (void)my_threeLineViewHideWithDuration:(CGFloat)duration animated:(BOOL)animated {
    
    [self.oneLine my_animatedLineViewHideWithDuration:duration animated:animated];
    [self.twoLine my_animatedLineViewHideWithDuration:duration animated:animated];
    [self.threeLine my_animatedLineViewHideWithDuration:duration animated:animated];
}

/**
 一秒钟旋转几圈
 */
- (void)my_threeLineViewRotateImageViewWithCircleByOneSecond {
    
    CGFloat circleByOneSecond = (self.circleByOneSecond <= 0 ? 0.001 : self.circleByOneSecond);
    //动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @(0);
    rotationAnimation.toValue   = @(M_PI * 100000);
    rotationAnimation.duration  = (1 / circleByOneSecond);
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.layer addAnimation:rotationAnimation forKey:nil];
}

/**
 销毁通知
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)eventDidBecomeActive:(id)obj {
    //获取通知对象
    NSNotification *fication = obj;
    if ([fication.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        [UIView animateWithDuration:0.5f animations:^{
            self.alpha = 1.f;
        }];
        [self my_threeLineViewRotateImageViewWithCircleByOneSecond];
    } else if ([fication.name isEqualToString:UIApplicationDidEnterBackgroundNotification]) {
        [UIView animateWithDuration:0.5f animations:^{
            self.alpha = 0.f;
        }];
    } else if ([fication.name isEqualToString:UIApplicationWillResignActiveNotification]) {
        [UIView animateWithDuration:0.5f animations:^{
            self.alpha = 0.f;
        }];
    }
}



@end
