//
//  MY_AnimatedLineView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_AnimatedLineView.h"

@interface MY_AnimatedLineView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) CGRect startRect;
@property (nonatomic, assign) CGRect midRect;
@property (nonatomic, assign) CGRect endRect;

@end


@implementation MY_AnimatedLineView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initRects];
        self.imageView = [[UIImageView alloc] initWithFrame:self.startRect];
        self.imageView.alpha = 0.f;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)initRects {
    
    CGRect rect = self.bounds;
    self.startRect = CGRectMake(0, -10, rect.size.width, rect.size.height / 2.f);
    self.midRect = CGRectMake(0, 0, rect.size.width, rect.size.height / 2.f);
    self.endRect = CGRectMake(0, -5, rect.size.width, rect.size.height);
}

/**
 重置UIImageView的参数
 */
- (void)resetImageView {
    
    self.imageView.alpha = 0.f;
    self.imageView.frame = self.startRect;
}

/**
 显示出来

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_animatedLineViewShowWithDuration:(CGFloat)duration animated:(BOOL)animated {
    
    [self resetImageView];
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.imageView.frame = self.midRect;
            self.imageView.alpha = 1.f;
        }];
    } else {
        self.imageView.frame = self.midRect;
        self.imageView.alpha = 1.f;
    }
}

/**
 隐藏

 @param duration 动画持续时间
 @param animated 是否执行动画
 */
- (void)my_animatedLineViewHideWithDuration:(CGFloat)duration animated:(BOOL)animated {
    
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.imageView.frame = self.endRect;
            self.imageView.alpha = 0.f;
        }];
    } else {
        self.imageView.frame = self.endRect;
        self.imageView.alpha = 0.f;
    }
}

/**
 重写setter getter方法
 */
@synthesize my_animatedLineimage = _my_animatedLineimage;
- (UIImage *)my_animatedLineimage {
    
    return _my_animatedLineimage;
}
- (void)setMy_animatedLineimage:(UIImage *)my_animatedLineimage {
    _my_animatedLineimage = my_animatedLineimage;
    self.imageView.image  = my_animatedLineimage;
}








@end
