//
//  MY_LaunchAdViewController.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageLoadingGood)(UIImage *image, NSString *imageUrl);

typedef void(^ClickImage)(UIViewController *advertusingVC);

typedef void(^TheAdEnds)();

@interface MY_LaunchAdViewController : UIViewController

@property (nonatomic, copy) ImageLoadingGood imageLoadingGood;

@property (nonatomic, copy) ClickImage clickImage;

@property (nonatomic, copy) TheAdEnds theAdEnds;

/**
 创建启动页广告
 @param imageFrame 广告位置
 @param imageUrl 广告图片
 @param advertisingUrl 广告的url
 @param timeSecond 广告时长
 @param hideSkip 是否隐藏 跳过按钮
 @param imageLoadGood 加载完成 回调
 @param clickImage 点击广告 回调
 @param theAdEnds 广告播放完成
 */
+ (void)showWithFrame:(CGRect)imageFrame
             imageUrl:(NSString *)imageUrl
       advertisingUrl:(NSString *)advertisingUrl
           timeSecond:(NSInteger)timeSecond
             hideSkip:(BOOL)hideSkip
        imageLoadGood:(ImageLoadingGood)imageLoadGood
           clickImage:(ClickImage)clickImage
            theAdEnds:(TheAdEnds)theAdEnds;

















@end
