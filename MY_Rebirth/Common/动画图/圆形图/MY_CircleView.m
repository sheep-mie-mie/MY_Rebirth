//
//  MY_CircleView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/28.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_CircleView.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)


@interface MY_CircleView ()

/**
 圆形layer
 */
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end


@implementation MY_CircleView


/**
 创建出默认配置的View
 @param frame 设置view大小
 @return 实例对象
 */
+ (instancetype)my_circkeViewCreateDefaultViewWithFrame:(CGRect)frame {
    MY_CircleView *circleView = [[MY_CircleView alloc] initWithFrame:frame];
    circleView.lineWidth  = 2.f;
    circleView.lineColor  = [UIColor blackColor];
    circleView.clockWise  = YES;
    circleView.startAngle = 180;
    
    return circleView;
}


/**
 初始化frame
 @param frame frame
 @return 实例对象
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //创建layer
        [self createCircleLayer];
    }
    return self;
}

/**
 创建layer
 */
- (void)createCircleLayer {
    
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame = self.frame;
    [self.layer addSublayer:self.circleLayer];
}

/**
 创建视图
 */
- (void)my_circkeViewBuildView {
    //初始化信息
    CGFloat  lineWidth = (self.lineWidth <= 0 ? 1 : self.lineWidth);
    UIColor *lineColor = (self.lineColor == nil ? [UIColor blackColor] : self.lineColor);
    CGSize   size      = self.bounds.size;
    //设置半径 (刚好贴到frame上面)
    CGFloat  radius    = size.width / 2.f - lineWidth / 2.f;
    //旋转方向
    BOOL clockWise = self.clockWise;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    if (clockWise == YES) {
        startAngle = -RADIAN(180 - self.startAngle);
        endAngle   =  RADIAN(180 + self.startAngle);
    } else {
        startAngle =  RADIAN(180 - self.startAngle);
        endAngle   = -RADIAN(180 + self.startAngle);
    }
    //创建出贝塞尔曲线
    UIBezierPath *circlePath \
    = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height / 2.f, size.width / 2.f)
                                                              radius:radius
                                                          startAngle:startAngle
                                                            endAngle:endAngle
                                                           clockwise:clockWise];
    //获取path
    self.circleLayer.path = circlePath.CGPath;
    //设置颜色
    self.circleLayer.strokeColor = lineColor.CGColor;
    self.circleLayer.fillColor   = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth   = lineWidth;
    self.circleLayer.strokeEnd   = 0.f;
}

/**
 做stroke动画
 @param value 取值 [0,1]
 @param animated 是否执行动画
 @param duration 持续时间
 */
//结束
- (void)my_circkeViewStrokeEnd:(CGFloat)value
                      animated:(BOOL)animated
                      duration:(CGFloat)duration {
    //过滤掉不合理的值
    if (value <= 0) {
        value = 0;
    } else if (value >= 1) {
        value = 1.f;
    }
    if (animated) {
        //关键帧动画
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath  = @"strokeEnd";
        keyAnimation.duration = duration;
        keyAnimation.values   = \
        [YXEasing calculateFrameFromValue:self.circleLayer.strokeEnd
                                  toValue:value
                                     func:CubicEaseInOut
                               frameCount:duration * 30];
        //执行动画
        self.circleLayer.strokeEnd = value;
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
        
    } else {
        //关闭动画
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeEnd = value;
        [CATransaction setDisableActions:NO];
    }
}

//开始
- (void)my_circkeViewStrokeStart:(CGFloat)value
                        animated:(BOOL)animated
                        duration:(CGFloat)duration {
    //过滤点不合理的值
    if (value <= 0) {
        value = 0;
    } else if (value >= 1) {
        value = 1.f;
    }
    
    if (animated) {
        //关键帧动画
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath  = @"strokenStart";
        keyAnimation.duration = duration;
        keyAnimation.values   = \
        [YXEasing calculateFrameFromValue:self.circleLayer.strokeStart
                                  toValue:value
                                     func:CubicEaseInOut
                               frameCount:duration * 30];
        //执行动画
        self.circleLayer.strokeStart = value;
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
        
    } else {
        //关闭动画
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeStart = value;
        [CATransaction setDisableActions:NO];
    }
}


























@end
