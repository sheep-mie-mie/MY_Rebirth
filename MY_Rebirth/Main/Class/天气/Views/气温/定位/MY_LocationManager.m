//
//  MY_LocationManager.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/10.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_LocationManager.h"

@interface MY_LocationManager ()<CLLocationManagerDelegate>

/**
 定位
 */
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation MY_LocationManager


+ (MY_LocationManager *)myLocationManager {
    static MY_LocationManager *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[MY_LocationManager alloc] init];
    });
    return handler;
}

- (instancetype)init {
    if (self = [super init]) {
        //定位
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

#pragma mark ------------//location delegate\\------------
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //停止定位
    [manager stopUpdatingLocation];
    if (_delegate && [_delegate respondsToSelector:@selector(locationManager:didUpCllocation:)]) {
        CLLocation *location = [locations lastObject];
        [_delegate locationManager:self didUpCllocation:location];
    }
}
//定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    DTLog(@"定位失败");
    if ([CLLocationManager locationServicesEnabled] == NO) {
        DTLog(@"定位功能关闭");
        if (_delegate && [_delegate respondsToSelector:@selector(locationManagerServerClosed:)]) {
            [_delegate locationManagerServerClosed:self];
        }
    } else {
        DTLog(@"定位功能开启");
        if (_delegate && [_delegate respondsToSelector:@selector(locationManager:didFailed:)]) {
            [_delegate locationManager:self didFailed:error];
        }
    }
}


@synthesize authorizationStatus = _authorizationStatus;
- (CLAuthorizationStatus)authorizationStatus {
    return [CLLocationManager authorizationStatus];
}


- (CLLocationManager *)locationManager {
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    return _locationManager;
}







@end

