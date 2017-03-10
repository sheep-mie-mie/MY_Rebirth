//
//  MY_LocationManager.h
//  MY_Rebirth
//
//  Created by ifly on 2017/3/10.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class MY_LocationManager;

@protocol MY_LocationManagerDelegate <NSObject>

@optional
/**
 更新定位
 */
- (void)locationManager:(MY_LocationManager *)manager didUpCllocation:(CLLocation *)location;
/**
 定位失败
 */
- (void)locationManager:(MY_LocationManager *)manager didFailed:(NSError *)error;
/**
 关闭定位
 */
- (void)locationManagerServerClosed:(MY_LocationManager *)manager;

@end



@interface MY_LocationManager : NSObject

/**
 单利
 
 @return 当前对象
 */
+ (MY_LocationManager *)myLocationManager;


/**
 协议
 */
@property (nonatomic, assign) id<MY_LocationManagerDelegate> delegate;

/**
 定位状态
 */
@property (nonatomic, readonly) CLAuthorizationStatus authorizationStatus;


@end
