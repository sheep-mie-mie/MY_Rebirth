//
//  MY_VideoStartView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoStartView.h"
#import "MY_VideoImageView.h"

@interface MY_VideoStartView ()

@property (nonatomic, assign, readwrite) NSInteger currentIndex;

@end

@implementation MY_VideoStartView

- (instancetype)initWithFrame:(CGRect)frame
             informationArray:(NSArray *)informationArray
                     indePath:(NSInteger)indexPath {
    
    if (self = [super initWithFrame:frame]) {
        
        self.contentSize = CGSizeMake([informationArray count] * MAINSCREEN_WIDTH, 0);
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.contentOffset = CGPointMake(MAINSCREEN_WIDTH * indexPath, 0);
        
        [self buildVideoStartViewWithInformationArray:informationArray];
    }
    return self;
}

/**
 设置播放视图界面
 @param informationArray 数据源
 */
- (void)buildVideoStartViewWithInformationArray:(NSArray *)informationArray {
    
    for (int i = 0; i<[informationArray count]; i++) {
        
//        MY_VideoImageView *videoImageView = [[MY_VideoImageView alloc] initWithFrame:CGRectMake(i*MAINSCREEN_WIDTH, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT) InformationArray:informationArray];
//        MY_OpenEyesVoideVideoListModel *model = informationArray[i];
//        [videoImageView.videoImage sd_setImageWithURL:[NSURL URLWithString:model.coverForDetail] placeholderImage:nil];
//        [self addSubview:videoImageView];
    }
}











@end
