//
//  AppDelegate.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置启动页
    [self buildUpAppStartViewState];
    //设置网络状态
    [self buildUpNetworkState];
    
    return YES;
}


#pragma mark ------------//设置\\------------

/**
 设置启动状态
 */
- (void)buildUpAppStartViewState {
    
    //设置状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置启动页
    //NSString *gifImageURL = @"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
    NSString *imageURL = @"http://img4.duitang.com/uploads/item/201410/24/20141024135636_t2854.thumb.700_0.jpeg";
    
    [MY_LaunchAdViewController showWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT - 150) imageUrl:imageURL advertisingUrl:@"http://www.jianshu.com/p/7205047eadf7" timeSecond:4 hideSkip:YES imageLoadGood:^(UIImage *image, NSString *imageUrl) {
        //广告加载结束
        DTLog(@"广告加载结束");
        
    } clickImage:^(UIViewController *advertusingVC) {
        //点击广告 在webView中打开
        DTLog(@"不要点我");
        MY_AdWebViewController *adWebVC = [[MY_AdWebViewController alloc] init];
        adWebVC.urlStr = @"http://www.jianshu.com/users/8bd3c01cf113/timeline";
        adWebVC.title = @"广告";
        adWebVC.AppDelegateSele = -1;
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:adWebVC];
        [advertusingVC presentViewController:nvc animated:YES completion:nil];
        
    } theAdEnds:^{
        //广告展示完成回调 设置window根视图
        //是否第一次打开app
        MY_BaseTabBarController *myTabBar = [[MY_BaseTabBarController alloc] init];
        [ShareApplicationDelegate window].rootViewController = myTabBar;
    }];
    
}

#pragma mark ------------//网络设置\\------------
- (void)buildUpNetworkState {
    
    [MYNetworkingObject startMonitoringNetworkStatus:^(MYNetworkStatus status) {
        if (status == MYNetworkStatusNotReachable) {
            SHOW_ALERT(@"网络连接断开,请检查网络!");
        }
    }];
    [MYNetworkingObject updateBaseUrl:baseUrl];
    [MYNetworkingObject enableInterfaceDebug:YES];
    [MYNetworkingObject setTimeOut:15];
    // 配置请求和响应类型，由于部分伙伴们的服务器不接收JSON传过去，现在默认值改成了plainText
    [MYNetworkingObject configRequestType:MYRequestTypeJSON
                             responseType:MYResponseTypeJSON
                      shouldAutoEncodeUrl:YES
                  callBackOnCancelRequest:NO];
    [MYNetworkingObject cacheGetRequest:YES shouldCachePost:YES];
    //设置缓存路径
    [MYNetworkingObject updateBaseCacheDocuments:@"MYKaiYanAPPCaches"];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
