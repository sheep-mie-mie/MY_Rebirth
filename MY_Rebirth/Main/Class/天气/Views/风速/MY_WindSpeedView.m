//
//  MY_WindSpeedView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/1.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WindSpeedView.h"
#import "MY_ThreeLineView.h"
#import "MY_WindSpeedCountLabel.h"
#import "MY_TitleMoveLabel.h"
#import "MY_CGRectStoreValueModel.h"

@interface MY_WindSpeedView ()

@property (nonatomic, strong) MY_ThreeLineView         *threeLineView;
@property (nonatomic, strong) UIView                   *line;
@property (nonatomic, strong) MY_CGRectStoreValueModel *lineStoreValue;
@property (nonatomic, strong) UIView                   *circleView;
@property (nonatomic, strong) MY_TitleMoveLabel        *titleMovelabel;
@property (nonatomic, strong) MY_WindSpeedCountLabel   *windCountLabel;
@property (nonatomic, strong) MY_CGRectStoreValueModel *windCountLabelStoreValue;

@end


@implementation MY_WindSpeedView

- (void)my_windSpeedViewBuildView {
#warning color-dismiss
    self.backgroundColor = [UIColor oldLace];
    CGFloat windOffsetX = 40;
    CGFloat windOffsetY = 40;
    CGRect windFrame = CGRectMake(windOffsetX, windOffsetY, 60, 60);
    
    if (iPhone4_4s || iPhone5_5s) {
        windOffsetX = 40;
        windOffsetY = 50;
        windFrame = CGRectMake(windOffsetX, windOffsetY, 60, 60);
    } else if (iPhone6_6s) {
        windOffsetX = 40;
        windOffsetY = 50;
        windFrame = CGRectMake(windOffsetX, windOffsetY, 65, 65);
    } else if (iPhone6_6sPlus) {
        windOffsetX = 40;
        windOffsetY = 55;
        windFrame = CGRectMake(windOffsetX, windOffsetY, 70, 70);
    } else {
        windOffsetX = 40;
        windOffsetY = 40;
        windFrame = CGRectMake(windOffsetX, windOffsetY, 60, 60);
    }
    //创造出扇叶
    self.threeLineView = [[MY_ThreeLineView alloc] initWithFrame:windFrame];
    [self addSubview:self.threeLineView];
    //移动的头部
    self.titleMovelabel = [MY_TitleMoveLabel withText:@"Wind Speed"];
    [self addSubview:self.titleMovelabel];
    //创建出风速变化的标签
    if (iPhone4_4s || iPhone5_5s) {
        self.windCountLabel = [[MY_WindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 120, 93, 15)];
    } else if (iPhone6_6s) {
        self.windCountLabel = [[MY_WindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 143, 93, 15)];
    } else if (iPhone6_6sPlus) {
        self.windCountLabel = [[MY_WindSpeedCountLabel alloc] initWithFrame:CGRectMake(45, 155, 93, 15)];
    } else {
        self.windCountLabel = [[MY_WindSpeedCountLabel alloc] initWithFrame:CGRectMake(15, 90, 93, 15)];
    }
    [self addSubview:self.windCountLabel];
    //
    self.windCountLabelStoreValue  = [MY_CGRectStoreValueModel new];
    self.windCountLabelStoreValue.midRect = self.windCountLabel.frame;
    self.windCountLabel.x += 10;
    self.windCountLabelStoreValue.startRect = self.windCountLabel.frame;
    self.windCountLabel.x -= 10;
    self.windCountLabel.y -= 10;
    self.windCountLabelStoreValue.endRect = self.windCountLabel.frame;
    self.windCountLabel.frame = self.windCountLabelStoreValue.startRect;
    self.windCountLabel.alpha = 0.f;
    //创建支柱
    if (iPhone4_4s || iPhone5_5s) {
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 60.f)];
    } else if (iPhone6_6s) {
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 70.f)];
    } else if (iPhone6_6sPlus) {
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 75.f)];
    } else {
        self.line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2.f, 60.f)];
    }
    [self addSubview:self.line];
    self.line.centerX = self.threeLineView.middleX;
    self.line.y  = windFrame.size.height / 2.f;
    self.line.x += windOffsetX;
    self.line.y += windOffsetY;
    self.line.backgroundColor = [UIColor blackColor];
    
    CGFloat gapFromCenter = 3.f;
    self.lineStoreValue = [MY_CGRectStoreValueModel new];
    CGRect startRect = CGRectMake(self.line.x,
                                  self.line.y + self.line.height + gapFromCenter * 2* 2,
                                  self.line.width,
                                  0);
    CGRect midRect = CGRectMake(self.line.x,
                                self.line.y + gapFromCenter,
                                self.line.width,
                                self.line.height);
    CGRect endRect = CGRectMake(self.line.x,
                                self.line.y,
                                self.line.width,
                                0);
    self.lineStoreValue.startRect = startRect;
    self.lineStoreValue.midRect = midRect;
    self.lineStoreValue.endRect = endRect;
    self.line.frame = startRect;
    //创建出圆圈
    self.circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
    self.circleView.center = self.threeLineView.middlePoint;
    self.circleView.layer.cornerRadius = self.circleView.height / 2.f;
    self.circleView.x += windOffsetX;
    self.circleView.y += windOffsetY;
    self.circleView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.circleView];
    self.circleView.alpha = 0.f;
}

- (void)my_windSpeedViewShow {
    
    CGFloat duration = 1.5;
    //扇叶动画
    [self.threeLineView.layer removeAllAnimations];
    //设置转速
    self.threeLineView.circleByOneSecond = self.circleByOneSecond;
    [GCDQueue executeInMainQueue:^{
        [self.threeLineView my_threeLineViewRotateImageViewWithCircleByOneSecond];
    } afterDelaySecs:0.01];
    [self.threeLineView my_threeLineViewShowWithDuration:duration animated:YES];
    //标签数字动画
    self.windCountLabel.toValue = self.windSpeed;
    [self.windCountLabel my_windSpeedCountLabelShowDuration:duration];
    //标题
    [self.titleMovelabel my_titleModeShow];
    //支柱动画+圆动画+文本动画+标签数字动画
    [UIView animateWithDuration:duration animations:^{
        self.line.alpha = 1.f;
        self.line.frame = self.lineStoreValue.midRect;
        self.circleView.alpha = 1.f;
        self.windCountLabel.frame = self.windCountLabelStoreValue.midRect;
        self.windCountLabel.alpha = 1.f;
    }];
}

- (void)my_windSpeedViewHide {
    
    CGFloat duration = 0.75;
    //扇叶动画
    [self.threeLineView my_threeLineViewHideWithDuration:duration animated:YES];
    //标签数字动画
    [self.windCountLabel my_windSpeedCountLabelHideDuration:duration];
    //标题
    [self.titleMovelabel my_titleModelHide];
    //支柱动画+圆动画
    [UIView animateWithDuration:duration animations:^{
        self.line.alpha = 0.f;
        self.line.frame = self.lineStoreValue.endRect;
        self.circleView.alpha = 0.f;
        self.windCountLabel.frame = self.windCountLabelStoreValue.endRect;
        self.windCountLabel.alpha = 0.f;
    } completion:^(BOOL finished) {
        self.line.frame = self.lineStoreValue.startRect;
        self.windCountLabel.frame = self.windCountLabelStoreValue.startRect;
    }];
}




@end
