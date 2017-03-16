//
//  MY_GlobalManager.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark ------------//网络运行环境\\------------
//static NSString * const baseUrl = @"http://baobab.wandoujia.com/api/v1/feed?num=10&date=%@&vc=67&u=011f2924aa2cf27aa5dc8066c041fe08116a9a0c&v=1.8.0&f=iphone";
//开眼
static NSString * const operEyesUrl    = @"http://baobab.wandoujia.com/";
//天气
static NSString * const weatherInfoUrl = @"http://api.openweathermap.org/";
//分享
static NSString * const shareAppKey    = @"1c212be888809";



#pragma mark ------------//第三方Appkey\\------------


#pragma mark ------------//系统通用属性\\------------
//广告页持续时间
static NSString * const adLastTime = @"5";








@interface MY_GlobalManager : NSObject


/**1
 获取当前的视图的控制器

 @return currentViewController
 */
+ (UIViewController *)currentViewController;





























@end
