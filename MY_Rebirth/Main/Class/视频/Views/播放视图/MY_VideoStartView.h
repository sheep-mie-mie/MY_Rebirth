//
//  MY_VideoStartView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/20.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MY_VideoStartView;
@protocol MY_VideoStartViewDelegate <UIScrollViewDelegate>

- (void)headerScroll:(MY_VideoStartView *)scrollView didSelectItemAtIndex:(NSInteger)index;

- (void)headerScroll:(MY_VideoStartView *)scrollView didClose:(BOOL)close;

@end



@interface MY_VideoStartView : UIScrollView

/**
 选中index
 */
@property (nonatomic, assign, readonly) NSInteger currentIndex;

/**
 set方法
 @param currentIndex 选中的index
 */
- (void)setCurrentIndex:(NSInteger)currentIndex;

/**
 重写init
 @param frame frame
 @param informationArray 数据源
 @param indexPath 哪个
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame informationArray:(NSArray *)informationArray indePath:(NSInteger)indexPath;


@end
