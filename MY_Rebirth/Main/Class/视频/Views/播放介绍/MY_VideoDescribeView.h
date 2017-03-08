//
//  MY_VideoDescribeView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_VideoDescribeView : UIView





/**
 重写init方法
 @param frame frame
 @param VideoListmodel 数据源
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame
               VideoListmodel:(MY_OpenEyesVoideVideoListModel *)VideoListmodel;


/**
 界面赋值
 @param dataModel self
 */
- (void)buildDescribeViewWithDataModel:(MY_OpenEyesVoideVideoListModel *)dataModel;










@end
