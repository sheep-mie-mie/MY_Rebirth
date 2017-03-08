//
//  MY_VideoPlayerView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_VideoTableViewCell.h"

#import "MY_VideoStartView.h"

@interface MY_VideoPlayerView : UIView

/**
 重写init方法
 @param frame view的frame
 @param setOffY 对应父视图的坐标
 @param videoPlayerModel model数组
 @param videoImage cell图片
 @param indexPath 位置
 @return self对象
 */
- (instancetype)initWithFrame:(CGRect)frame
                      setOffY:(CGFloat)setOffY
             videoPlayerModel:(NSArray *)videoPlayerModel
                   videoImage:(UIImage *)videoImage
                    indexPath:(NSInteger)indexPath;

/**
 展示动画
 */
- (void)videoPlayerViewAnimationShow;

/**
 展示动画
 */
- (void)animationShow;

/**
 动画回调
 @param complete 回调
 */
- (void)animationDismissUsingCompeteBlock:(void(^)(void))complete;






@end



