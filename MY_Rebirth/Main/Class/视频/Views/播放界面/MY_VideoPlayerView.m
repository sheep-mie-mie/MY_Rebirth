//
//  MY_VideoPlayerView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoPlayerView.h"
#import "MY_VideoImageView.h"
#import "MY_VideoDescribeView.h"
#import "MY_VideoDetailViewController.h"

@interface MY_VideoPlayerView ()<UIScrollViewDelegate>

/**
 播放视图
 */
@property (nonatomic, strong) MY_VideoStartView *startView;

/**
 对应父视图的坐标
 */
@property (nonatomic, assign) CGFloat setOffY;

/**
 cell图片
 */
@property (nonatomic, strong) UIImage *videoImage;

/**
 cell
 */
@property (nonatomic, strong) MY_VideoTableViewCell *myViewCell;

/**
 imageView
 */
@property (nonatomic, strong) UIImageView *videoImageView;

/**
 背景scrollView
 */
@property (nonatomic, strong) UIScrollView *backScrollView;

/**
 数据源
 */
@property (nonatomic, strong) NSArray *videoPlayerModel;

/**
 第几个
 */
@property (nonatomic, assign) NSInteger indexPath;

/**
 简介View
 */
@property (nonatomic, strong) MY_VideoDescribeView *videoDescribeView;

/**
 当前视图偏移量
 */
@property (nonatomic, assign) CGPoint currentPoint;


@end


@implementation MY_VideoPlayerView


- (instancetype)initWithFrame:(CGRect)frame
                      setOffY:(CGFloat)setOffY
             videoPlayerModel:(NSArray *)videoPlayerModel
                   videoImage:(UIImage *)videoImage
                    indexPath:(NSInteger)indexPath {
    
    if (self = [super initWithFrame:frame]) {
        
        self.setOffY = setOffY-40;
        self.videoImage = videoImage;
        self.videoPlayerModel = videoPlayerModel;
        self.indexPath = indexPath;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        //self.contentMode = UIViewContentModeTop;
        self.clipsToBounds = YES;
        [self addSubview:self.backScrollView];
        [self addSubview:self.videoDescribeView];
        [self buildVideoPlayerViewWithModelArray:videoPlayerModel IndexPath:indexPath];
    }
    return self;
}

/**
 设置播放界面
 @param modelArray 数据源
 */
- (void)buildVideoPlayerViewWithModelArray:(NSArray *)modelArray IndexPath:(NSInteger)indexPath {
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 0.56*MAINSCREEN_HEIGHT)];
    UIButton *playerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    playerBtn.center = centerView.center;
    [playerBtn setBackgroundImage:[UIImage imageNamed:@"player_Image"] forState:UIControlStateNormal];
    [playerBtn addTarget:self action:@selector(playerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    playerBtn.hidden = YES;
    [self addSubview:playerBtn];
    
    _currentPoint = _backScrollView.contentOffset;
    _videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.setOffY, MAINSCREEN_WIDTH, 250)];
    _videoImageView.userInteractionEnabled = YES;
    [self addSubview:_videoImageView];
    _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
    _videoImageView.image = self.videoImage;
    
    [UIView animateWithDuration:0.5 animations:^{
        _videoImageView.transform = CGAffineTransformMakeTranslation(0, -self.setOffY);
        _videoImageView.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, 0.56*MAINSCREEN_HEIGHT);
        _videoDescribeView.frame = CGRectMake(0, 0.56*MAINSCREEN_HEIGHT, MAINSCREEN_WIDTH, 0.44*MAINSCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        _videoImageView.alpha = 0;
        _videoImageView.hidden = YES;
        _backScrollView.alpha = 1;
        playerBtn.hidden = NO;
    }];
    
}

/**
 视频播放按钮
 */
- (void)playerBtnAction {
    
    MY_OpenEyesVoideVideoListModel *model = self.videoPlayerModel[_indexPath];
    MY_VideoDetailViewController *detailView = [[MY_VideoDetailViewController alloc] initWithPlayerInfo:model WithPlayerView:self];
    [[MY_GlobalManager currentViewController] presentViewController:detailView animated:YES completion:^{
        [self removeFromSuperview];
    }];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (MY_VideoImageView *imageView in self.backScrollView.subviews) {
        if ([imageView respondsToSelector:@selector(imageOffset)] ) {
            [imageView imageOffset];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    
}

#pragma mark ------------//scrollView delegate\\------------
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    int index = floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
    MY_OpenEyesVoideVideoListModel *model = self.videoPlayerModel[index];
    
    [_videoDescribeView buildDescribeViewWithDataModel:model];
}


#pragma mark ------------//懒加载\\------------
- (UIScrollView *)backScrollView {
    if (_backScrollView == nil) {
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT)];
        _backScrollView.contentSize = CGSizeMake([self.videoPlayerModel count] * MAINSCREEN_WIDTH, 0);
        _backScrollView.contentOffset = CGPointMake(self.indexPath * MAINSCREEN_WIDTH, 0);
        _backScrollView.bounces = NO;
        _backScrollView.pagingEnabled = YES;
        _backScrollView.delegate = self;
        _backScrollView.alpha = 0;
        _backScrollView.scrollEnabled = NO;//禁止滑动
        for (int i = 0; i<[self.videoPlayerModel count]; i++) {
            MY_OpenEyesVoideVideoListModel *model = self.videoPlayerModel[i];
            MY_VideoImageView *imageView = [[MY_VideoImageView alloc] initWithFrame:CGRectMake(i * MAINSCREEN_WIDTH, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT) InformationModel:model];
            [_backScrollView addSubview:imageView];
        }
    }
    return _backScrollView;
}

- (NSArray *)videoPlayerModel {
    if (_videoPlayerModel == nil) {
        _videoPlayerModel = [[NSArray alloc] init];
    }
    return _videoPlayerModel;
}

- (MY_VideoDescribeView *)videoDescribeView {
    if (_videoDescribeView == nil) {
        MY_OpenEyesVoideVideoListModel *model = self.videoPlayerModel[self.indexPath];
        _videoDescribeView = [[MY_VideoDescribeView alloc] initWithFrame:CGRectMake(0, self.setOffY, MAINSCREEN_WIDTH, 0.44*MAINSCREEN_HEIGHT) VideoListmodel:model];
        //_videoDescribeView.alpha = 0;
        _videoDescribeView.userInteractionEnabled = YES;
    }
    return _videoDescribeView;
}





@end
