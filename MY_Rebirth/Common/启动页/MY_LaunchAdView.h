//
//  MY_LaunchAdView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark ------------//block\\------------
/**1.
 点击广告Black
 */
typedef void(^LaunchAdClick)();

/**2.
 广告加载完毕
 @param imgae 加载图片
 @param imageUrl 图片网址
 */
typedef void(^LaunchAdCallback)(UIImage *imgae, NSString *imageUrl);

/**3.
 加载完毕
 */
typedef void(^EndPlays)();

@interface MY_LaunchAdView : UIView

/**1.
 是否点击
 */
@property (nonatomic, assign) BOOL isClick;

/**2.
 定时器
 */
@property (nonatomic, copy) dispatch_source_t timer;

/**3.
 定时器
 */
@property (nonatomic, copy) dispatch_source_t noDataTimer;

/**4.
 广告显示时间
 */
@property (nonatomic, assign) NSInteger timeInteger;

/**5.
 广告视图
 */
@property (nonatomic, strong) UIImageView *adImageView;
/**6.
 广告显示尺寸
 */
@property (nonatomic, assign) CGRect adImageFrame;

/**7.
 点击广告图片block
 */
@property (nonatomic, copy) LaunchAdClick imageClick;

/**8.
 是否显示跳过
 */
@property (nonatomic, assign) BOOL hideSkip;

/**9.
 广告加载完毕
 */
@property (nonatomic, copy) LaunchAdCallback launckAdCallback;

/**10.
 播放完毕
 */
@property (nonatomic, copy) EndPlays endPlays;

/**11.
 重写初始化广告页
 @param frame 广告图大小
 @param imageUrl 广告图片
 @param timeSecond 广告时长
 @param hideSkip 是否显示跳过
 @param launchAdCallback 广告加载完回调
 @param imageClick 点击广告图回调
 @param endPlays 广告播放完回调
 @return 广告视图
 */
+ (instancetype)initImageWithFrame:(CGRect)frame
                          imageUrl:(NSString *)imageUrl
                        timeSecond:(NSInteger)timeSecond
                          hideSkip:(BOOL)hideSkip
                  launchAdCallback:(LaunchAdCallback)launchAdCallback
                        imageClick:(LaunchAdClick)imageClick
                          endPlays:(EndPlays)endPlays;











@end
