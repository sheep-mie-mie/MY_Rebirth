//
//  MY_VideoDescribeView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoDescribeView.h"

@interface MY_VideoDescribeView ()

/**
 背景视图
 */
@property (nonatomic, strong) UIImageView *videoBackImage;
/**
 标题
 */
@property (nonatomic, strong) UILabel *videoTitleLabel;
/**
 时间/类型
 */
@property (nonatomic, strong) UILabel *videoTimeLabel;
/**
 描述
 */
@property (nonatomic, strong) UILabel *videoDescribeLabel;
/**
 间隔线
 */
@property (nonatomic, strong) UIView *videoLineView;

@end


@implementation MY_VideoDescribeView

- (instancetype)initWithFrame:(CGRect)frame
               VideoListmodel:(MY_OpenEyesVoideVideoListModel *)VideoListmodel {
    
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor grayColor];
        _videoBackImage = [[UIImageView alloc] initWithFrame:self.bounds];
        _videoBackImage.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_videoBackImage];
        //标题
        _videoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, MAINSCREEN_WIDTH, 30)];
        _videoTitleLabel.font = [UIFont boldSystemFontOfSize:18];
        _videoTitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_videoTitleLabel];
        //种类-时间
        _videoTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, MAINSCREEN_WIDTH-30, 30)];
        [self addSubview:_videoTimeLabel];
        _videoTimeLabel.font = [UIFont systemFontOfSize:14];
        _videoTimeLabel.textColor = [UIColor whiteColor];
        //间隔线
        _videoLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 100, MAINSCREEN_WIDTH-15, 1)];
        [self addSubview:_videoLineView];
        [_videoLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_videoTimeLabel.mas_bottom).mas_offset(15);
            make.width.mas_equalTo(self);
            make.height.mas_equalTo(1);
        }];
        _videoLineView.backgroundColor = [UIColor lightGrayColor];
        //描述
        _videoDescribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, MAINSCREEN_WIDTH-30, 90)];
        [self addSubview:_videoDescribeLabel];
        _videoDescribeLabel.font = [UIFont systemFontOfSize:14];
        _videoDescribeLabel.numberOfLines = 0;
        _videoDescribeLabel.textColor = [UIColor whiteColor];
        [self buildDescribeViewWithDataModel:VideoListmodel];
    }
    return self;
}


- (void)buildDescribeViewWithDataModel:(MY_OpenEyesVoideVideoListModel *)dataModel {
    
    _videoTitleLabel.text = dataModel.title;
    NSString *timeString = [NSString stringWithFormat:@"%02ld'%02ld''",dataModel.duration/60,dataModel.duration% 60];//显示的是音乐的总时间
    _videoTimeLabel.text = [NSString stringWithFormat:@"#%@ / %@",dataModel.category, timeString];
    _videoDescribeLabel.text = dataModel.voideDescription;
    
    __weak typeof(self) weakSelf = self;
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:dataModel.coverBlurred] options:(SDWebImageRetryFailed) progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
            contentsAnimation.duration = 1.0f;
            contentsAnimation.fromValue = self.videoBackImage.image ;
            contentsAnimation.toValue = image;
            contentsAnimation.removedOnCompletion = YES;
            contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [weakSelf.videoBackImage.layer addAnimation:contentsAnimation forKey:nil];
            weakSelf.videoBackImage.image = image;
        }
    }];
}




@end

