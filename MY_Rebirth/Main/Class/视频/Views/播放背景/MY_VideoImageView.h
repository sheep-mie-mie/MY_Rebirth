//
//  MY_VideoImageView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_OpenEyesVoideModel.h"

@interface MY_VideoImageView : UIView



/**
 背景图片
 */
@property (nonatomic, strong) UIImageView *videoImage;

/**
 重写init方法
 @param frame 大小
 @param informationModel 数据源
 @return self对象
 */
- (instancetype)initWithFrame:(CGRect)frame
             InformationModel:(MY_OpenEyesVoideVideoListModel *)informationModel;





- (void)imageOffset;





@end
