//
//  MY_LaunchAdViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_LaunchAdViewController.h"
#import "MY_LaunchAdView.h"

@interface MY_LaunchAdViewController ()

@property (nonatomic, strong) MY_LaunchAdView *myLaunchAd;

@end

@implementation MY_LaunchAdViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.myLaunchAd.timer && self.myLaunchAd.timeInteger > 0 && self.myLaunchAd.isClick) {
        dispatch_resume(self.myLaunchAd.timer);
    }
    self.myLaunchAd.isClick = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.myLaunchAd.timer && self.myLaunchAd.timeInteger > 0 && self.myLaunchAd.isClick) {
        dispatch_suspend(self.myLaunchAd.timer);
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

+ (void)showWithFrame:(CGRect)imageFrame
             imageUrl:(NSString *)imageUrl
       advertisingUrl:(NSString *)advertisingUrl
           timeSecond:(NSInteger)timeSecond
             hideSkip:(BOOL)hideSkip
        imageLoadGood:(ImageLoadingGood)imageLoadGood
           clickImage:(ClickImage)clickImage
            theAdEnds:(TheAdEnds)theAdEnds {
    
    MY_LaunchAdViewController *myLaunchVC = [[MY_LaunchAdViewController alloc] init];
    myLaunchVC.myLaunchAd = [MY_LaunchAdView initImageWithFrame:imageFrame imageUrl:imageUrl timeSecond:timeSecond hideSkip:hideSkip launchAdCallback:^(UIImage *imgae, NSString *imageUrl) {
        if (imageLoadGood) {
            imageLoadGood(imgae, imageUrl);
        }
    } imageClick:^{
        if (clickImage) {
            clickImage(myLaunchVC);
        }
    } endPlays:^{
        if (theAdEnds) {
            theAdEnds();
        }
    }];
    [myLaunchVC.view addSubview:myLaunchVC.myLaunchAd];
    [ShareApplicationDelegate window].rootViewController = myLaunchVC;
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
