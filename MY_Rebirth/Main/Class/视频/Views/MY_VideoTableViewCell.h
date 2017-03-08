//
//  MY_VideoTableViewCell.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_VideoTableViewCell : UITableViewCell

/**
 背景视图
 */
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;

@property (nonatomic, strong) MY_OpenEyesVoideVideoListModel *videoModel;


@end
