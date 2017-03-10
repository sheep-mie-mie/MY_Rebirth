//
//  MYNetWorkAPI.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MYNetWorkAPI.h"

@implementation MYNetWorkAPI

/**1
 获取开眼App数据
 @param success 成功
 @param failure 失败
 */
+ (void)loadOpenEyesInformationDataWithSuccess:(void(^)(MY_OpenEyesVoideModel *result))success
                                       failure:(void(^)(NSError *error))failure
                                      showView:(UIView *)showView {
    //num=10&date=%@&vc=67&u=011f2924aa2cf27aa5dc8066c041fe08116a9a0c&v=1.8.0&f=iphone
    NSDictionary *parameters = @{@"num":@"3",
                                 @"date":@"20170228",
                                 @"vc":@"67",
                                 @"u":@"011f2924aa2cf27aa5dc8066c041fe08116a9a0c",
                                 @"v":@"1.8.0",
                                 @"f":@"iphone"};

   
    [MYNetworkingManager postRequestWithURL:@"api/v1/feed?" parameters:parameters success:^(id returnData) {
        MY_OpenEyesVoideModel *info = [MY_OpenEyesVoideModel mj_objectWithKeyValues:returnData];
        success(info);
    } failure:^(NSError *error) {
        failure(error);
    } progress:nil refreshCache:NO showView:showView];
    
//    [MYNetworkingManager getRequestWithURL:@"api/v1/feed?" parameters:parameters success:^(id returnData) {
//        MY_OpenEyesVoideModel *info = [MY_OpenEyesVoideModel mj_objectWithKeyValues:returnData];
//        success(info);
//    } failure:^(NSError *error) {
//        failure(error);
//    } progress:nil refreshCache:YES showView:showView];

}

/**2
 获取天气信息
 */
+ (void)loadWeatherInfoWithLoactionLatitude:(CGFloat)latitude
                                  longitude:(CGFloat)longitude
                                    success:(void (^)(MY_DetailWeatherModel *))success
                                    failure:(void (^)(NSError *))failure
                                   showView:(UIView *)showView {
    
    NSDictionary *parameters = @{@"lat":@(latitude),
                                 @"lon":@(longitude),
                                 @"APPID":@"8c0e04b52e6da9e67c51a102d6269a60"};
    
    [MYNetworkingManager getRequestWithURL:@"data/2.5/weather"
                                parameters:parameters
                                   success:^(id returnData) {
                                       MY_DetailWeatherModel *info = [MY_DetailWeatherModel mj_objectWithKeyValues:returnData];
                                       success(info);
                                   } failure:^(NSError *error) {
                                       failure(error);
                                   } progress:nil refreshCache:NO showView:nil];
}


/**3
 获取周天气
 */
+ (void)loadWeekWeatherInfoWithCityId:(NSInteger)cityId
                              success:(void(^)(MY_WeekWeatherModel *result))success
                              faulure:(void(^)(NSError *error))failure
                             showView:(UIView *)showView {
    
    NSDictionary *parameters = @{@"id":@(cityId),
                                 @"cnt":@"14",
                                 @"APPID":@"8c0e04b52e6da9e67c51a102d6269a60"};
    [MYNetworkingManager getRequestWithURL:@"/data/2.5/forecast/daily"
                                parameters:parameters
                                   success:^(id returnData) {
                                       MY_WeekWeatherModel *info = [MY_WeekWeatherModel mj_objectWithKeyValues:returnData];
                                       success(info);
                                   } failure:^(NSError *error) {
                                       failure(error);
                                   } progress:nil refreshCache:NO showView:nil];
}























@end
