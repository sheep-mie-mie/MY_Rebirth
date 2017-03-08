//
//  MY_VideoDetailViewController.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_BaseViewController.h"
#import "MY_VideoPlayerView.h"

@interface MY_VideoDetailViewController : MY_BaseViewController


/**
 重写init方法
 @param playerInfo 播放源
 @return self
 */
- (instancetype)initWithPlayerInfo:(MY_OpenEyesVoideVideoListModel *)playerInfo
                    WithPlayerView:(MY_VideoPlayerView *)videoPlayerView;

@end
