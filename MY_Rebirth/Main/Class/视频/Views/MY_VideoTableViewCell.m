//
//  MY_VideoTableViewCell.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoTableViewCell.h"

@interface MY_VideoTableViewCell ()

/**
 模糊视图
 */
@property (weak, nonatomic) IBOutlet UIView *videoVagueView;

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLabel;

/**
 种类 时间
 */
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;


@end

@implementation MY_VideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //模糊视图
    self.videoVagueView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.33f];
    
    
}

- (void)setVideoModel:(MY_OpenEyesVoideVideoListModel *)videoModel {
    _videoModel = videoModel;
    //背景视图
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:videoModel.coverForDetail] completed:nil];
    //标题
    self.videoTitleLabel.text = videoModel.title;
    self.videoTitleLabel.textColor = [UIColor whiteColor];
    self.videoTitleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    //种类 时间
    NSString *videoTime = [NSString stringWithFormat:@"%02ld'%02ld''",videoModel.duration/60,videoModel.duration%60];
    self.videoTimeLabel.text = [NSString stringWithFormat:@"%@ / %@",videoModel.category,videoTime];
    self.videoTimeLabel.textColor = [UIColor whiteColor];
    self.videoTimeLabel.font = [UIFont systemFontOfSize:14];
}











- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
