//
//  MY_VideoDetailViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface MY_VideoDetailViewController ()<ZFPlayerDelegate>

/**
 播放器父视图
 */
@property (nonatomic, strong) UIView *playerFatherView;
/**
 播放视图
 */
@property (nonatomic, strong) ZFPlayerView *playerView;
/**
 离开页面时候是否在播放
 */
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) ZFPlayerModel *playerModel;
@property (nonatomic, strong) UIView *bottonView;

/**
 播放源
 */
@property (nonatomic, strong) MY_OpenEyesVoideVideoListModel *playerInfo;

@property (nonatomic, strong) MY_VideoPlayerView *videoPlayerView;
@end

@implementation MY_VideoDetailViewController

- (instancetype)initWithPlayerInfo:(MY_OpenEyesVoideVideoListModel *)playerInfo
                    WithPlayerView:(MY_VideoPlayerView *)videoPlayerView {
    if (self = [super init]) {
        
        _playerInfo = playerInfo;
        _videoPlayerView = videoPlayerView;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    //pop回来是否自动播放
    if (self.navigationController.viewControllers.count == 2 && self.playerView && self.isPlaying) {
        self.isPlaying = NO;
        [self.playerView play];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    //push出下一级界面的时候暂停
    if (self
        .navigationController.viewControllers.count == 3 && self.playerView && !self.playerView.isPauseByUser) {
        self.isPlaying = YES;
        [self.playerView pause];
    }
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playerFatherView = [[UIView alloc] init];
    [self.view addSubview:self.playerFatherView];
    [self.playerFatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.leading.trailing.mas_equalTo(0);
        //宽高比16:9
        make.height.mas_equalTo(self.playerFatherView.mas_width).multipliedBy(9.0f/16.0f);
    }];
    //自动播放 默认不自动播放
    [self.playerView autoPlayTheVideo];
}

/**
 返回值必须为NO
 */
- (BOOL)shouldAutorotate {
    return NO;
}


#pragma mark ------------//ZFPlayerDelegate\\------------
- (void)zf_playerBackAction {
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow addSubview:_videoPlayerView];
}

- (void)zf_playerDownload:(NSString *)url {
    
    
}


#pragma mark ------------//Getter\\------------
- (ZFPlayerModel *)playerModel {
    if (_playerModel == nil) {
        _playerModel = [[ZFPlayerModel alloc] init];
        _playerModel.title = _playerInfo.title;
        _playerModel.videoURL = [NSURL URLWithString:_playerInfo.playUrl];
        _playerModel.placeholderImage = [UIImage imageNamed:@"loading_bgView1"];
        _playerModel.fatherView = self.playerFatherView;
    }
    return _playerModel;
}

- (ZFPlayerView *)playerView {
    if (_playerView == nil) {
        _playerView = [[ZFPlayerView alloc] init];
        
        [_playerView playerControlView:nil playerModel:self.playerModel];
        //设置代理
        _playerView.delegate = self;
        
        _playerView.hasDownload = YES;
        //打开预览图
        self.playerView.hasPreviewView = YES;
    }
    return _playerView;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ------------//懒加载\\------------







@end
