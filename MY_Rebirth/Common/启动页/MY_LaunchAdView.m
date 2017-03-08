//
//  MY_LaunchAdView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_LaunchAdView.h"


@interface MY_LaunchAdView ()

/**1
 广告页背景图
 */
@property (nonatomic, strong) UIImageView *launchImageView;

/**2
 跳过按钮
 */
@property (nonatomic, strong) UIButton *skipBtn;

@end


@implementation MY_LaunchAdView

- (instancetype)initWithFrame:(CGRect)frame timeInterger:(NSInteger)timeInterger {
    
    if (self = [super initWithFrame:frame]) {
        
        self.adImageFrame = frame;
        self.timeInteger = timeInterger;
        self.frame = [UIScreen mainScreen].bounds;
        [self addSubview:self.launchImageView];
        [self addSubview:self.adImageView];
        [self startNoDataDispatch_timer];
    }
    return self;
}

/**
 设置定时器
 */
- (void)startNoDataDispatch_timer {
    
    NSTimeInterval period = 1.0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _noDataTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_noDataTimer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    __block NSInteger duratuon = 3;
    dispatch_source_set_event_handler(_noDataTimer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (duratuon == 0) {
                dispatch_source_cancel(_noDataTimer);
                [self removeView];
            }
            duratuon--;
        });
    });
    dispatch_resume(_noDataTimer);
}

/**
 移除视图
 */
- (void)removeView {
    if (self.endPlays) {
        self.endPlays();
    }
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.transform = CGAffineTransformMakeScale(1.5, 1.5);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark ------------//获取启动图\\------------

/**
 获取启动图
 */
- (UIImage *)getLaunchImage {
    UIImage *imageP = [self launchImageWithType:@"Portrait"];
    if (imageP) {
        return imageP;
    }
    UIImage *imageL = [self launchImageWithType:@"Landscape"];
    if (imageL) {
        return imageL;
    }
    DTLog(@"获取LaunchImage失败!请检查是否添加启动图,或者规格是否有误.");
    
    return nil;
}

/**
 获取启动图
 @param type 类型
 @return 图片
 */
- (UIImage *)launchImageWithType:(NSString *)type {
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if ([viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            if ([dict[@"UILaunchImageOrientation"] isEqualToString:@"Landscape"]) {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if (CGSizeEqualToSize(imageSize, viewSize)) {
                launchImageName = dict[@"UILaunchImageName"];
                UIImage *image = [UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
}

#pragma mark ------------//广告页重写初始化\\------------
+ (instancetype)initImageWithFrame:(CGRect)frame
                          imageUrl:(NSString *)imageUrl
                        timeSecond:(NSInteger)timeSecond
                          hideSkip:(BOOL)hideSkip
                  launchAdCallback:(LaunchAdCallback)launchAdCallback
                        imageClick:(LaunchAdClick)imageClick
                          endPlays:(EndPlays)endPlays {
    
    MY_LaunchAdView *myLaunchAdView = [[MY_LaunchAdView alloc] initWithFrame:frame timeInterger:timeSecond];
    myLaunchAdView.hideSkip = hideSkip;
    [myLaunchAdView.adImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (imageUrl) {
            if (launchAdCallback) {
                launchAdCallback(image, [NSString stringWithFormat:@"%@",imageURL]);
            }
            [myLaunchAdView addSubview:myLaunchAdView.skipBtn];
            [myLaunchAdView dispatch_timer];
        }
    }];
    myLaunchAdView.imageClick = ^(){
        if (imageClick) {
            imageClick();
        }
    };
    myLaunchAdView.endPlays = ^(){
        if (endPlays) {
            endPlays();
        }
    };
    return myLaunchAdView;
}


/**
 定时器
 */
- (void)dispatch_timer {
    if (_noDataTimer) {
        dispatch_source_cancel(_noDataTimer);
    }
    NSTimeInterval period = 1.0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    __block NSInteger duration = [adLastTime integerValue];
    if (self.timeInteger) {
        duration = self.timeInteger;
    }
    dispatch_source_set_event_handler(_timer, ^{
       dispatch_async(dispatch_get_main_queue(), ^{
           [_skipBtn setTitle:[NSString stringWithFormat:@"%ld 跳过",duration] forState:UIControlStateNormal];
           if (duration == 0) {
               dispatch_source_cancel(_timer);
               [self removeView];
           }
           duration--;
       });
    });
    dispatch_resume(_timer);
}

- (void)setHideSkip:(BOOL)hideSkip {
    _hideSkip = hideSkip;
    if (!_hideSkip) {
        [self.skipBtn removeFromSuperview];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark ------------//响应事件\\------------

- (void)skipAction {
    self.isClick = NO;
    if (_timer) {
        dispatch_source_cancel(_timer);
    }
    [self removeView];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (self.imageClick) {
        self.isClick = YES;
        self.imageClick();
    }
}


#pragma mark ------------//懒加载\\------------
- (UIImageView *)launchImageView {
    if (_launchImageView == nil) {
        _launchImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _launchImageView.image = [self getLaunchImage];
    }
    return _launchImageView;
}

- (UIImageView *)adImageView {
    if (_adImageView == nil) {
        _adImageView = [[UIImageView alloc] initWithFrame:self.adImageFrame];
        _adImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_adImageView addGestureRecognizer:tap];
    }
    return _adImageView;
}

- (UIButton *)skipBtn {
    if (_skipBtn == nil) {
        _skipBtn = [[UIButton alloc] initWithFrame:CGRectMake(MAINSCREEN_WIDTH - 70, 30, 60, 30)];
        [_skipBtn setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        _skipBtn.layer.cornerRadius = 15;
        _skipBtn.layer.masksToBounds = YES;
        NSInteger duration = [adLastTime integerValue];
        if (self.timeInteger) {
            duration = self.timeInteger;
        }
        [_skipBtn setTitle:[NSString stringWithFormat:@"%ld 跳过",duration] forState:UIControlStateNormal];
        _skipBtn.titleLabel.font = [UIFont systemFontOfSize:13.5];
        [_skipBtn addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipBtn;
}






@end
