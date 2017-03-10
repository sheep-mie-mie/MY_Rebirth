//
//  MYNetWorkAPI.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MY_OpenEyesVoideModel.h"
#import "MY_DetailWeatherModel.h"
#import "MY_WeekWeatherModel.h"

@interface MYNetWorkAPI : NSObject


/**1
 获取开眼App数据

 @param success 成功
 @param failure 失败
 */
+ (void)loadOpenEyesInformationDataWithSuccess:(void(^)(MY_OpenEyesVoideModel *result))success
                                       failure:(void(^)(NSError *error))failure
                                      showView:(UIView *)showView;


/**2
 获取天气信息
 
 @param latitude  坐标
 @param longitude 坐标
 @param success   成功
 @param failure   失败
 @param showView  加载
 */
+ (void)loadWeatherInfoWithLoactionLatitude:(CGFloat)latitude
                                  longitude:(CGFloat)longitude
                                    success:(void(^)(MY_DetailWeatherModel *result))success
                                    failure:(void(^)(NSError *error))failure
                                   showView:(UIView *)showView;


/**3
 获取周天气
 
 @param cityId   城市id
 @param success  成功
 @param failure  失败
 @param showView 加载
 */
+ (void)loadWeekWeatherInfoWithCityId:(NSInteger)cityId
                              success:(void(^)(MY_WeekWeatherModel *result))success
                              faulure:(void(^)(NSError *error))failure
                             showView:(UIView *)showView;






















@end
