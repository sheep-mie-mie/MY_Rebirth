//
//  MY_MaxTempView.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/9.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_MaxTempView : UIView



/**
 重写init方法

 @param frame 大小
 @param heightTem 最高温度
 @param lowTem 最低温度
 @return self对象
 */
- (instancetype)initWithFrame:(CGRect)frame
                    HeightTem:(NSString *)heightTem
                       lowTem:(NSString *)lowTem;





@end
