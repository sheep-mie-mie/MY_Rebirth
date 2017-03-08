//
//  MY_VideoImageView.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoImageView.h"
#import "UIImageView+WebCache.h"
@implementation MY_VideoImageView


- (instancetype)initWithFrame:(CGRect)frame
             InformationModel:(MY_OpenEyesVoideVideoListModel *)informationModel {
    
    if (self = [super initWithFrame:frame]) {
        
        self.clipsToBounds = YES;
        _videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 0.56 *MAINSCREEN_HEIGHT)];
        _videoImage.contentMode = UIViewContentModeScaleAspectFill;
        [_videoImage sd_setImageWithURL:[NSURL URLWithString:informationModel.coverForDetail] placeholderImage:nil];
        [self addSubview:_videoImage];
    }
    return self;
}

- (void)imageOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:nil];
    CGFloat centerX = CGRectGetMidX(centerToWindow);
    CGPoint windowCenter = self.window.center;
    CGFloat cellOffsetX = centerX - windowCenter.x;
    CGFloat offsetDig =  cellOffsetX / self.window.frame.size.height *2;
    CGAffineTransform transX = CGAffineTransformMakeTranslation(- offsetDig * MAINSCREEN_WIDTH * 0.7, 0);
    self.videoImage.transform = transX;
}





















@end
