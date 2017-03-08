//
//  MY_BaseTabBarController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_BaseTabBarController.h"
#import "MY_BaseNavigationController.h"
#import "MY_BaseViewController.h"

@interface MY_BaseTabBarController ()

@end

@implementation MY_BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customizTabBarAppearance:self];
    [self buildUpViewControllersAndTitles];
}


#pragma mark ------------//设置tabBar属性\\------------

/**
 设置视图控制器 TabBar属性
 */
- (void)buildUpViewControllersAndTitles {
    
    //tabBar属性
    NSMutableArray *tabBarItems = [NSMutableArray new];
    NSArray *imageName = @[@"video_",@"weather_",@"mine_"];
    NSArray *titleName = @[@"热门",@"天气",@"你的"];
    
    for (int i = 0; i<imageName.count; i++) {
        
        NSString *normalImageName = [NSString stringWithFormat:@"%@Image",imageName[i]];
        NSString *selectImageName = [NSString stringWithFormat:@"%@SelectImage",imageName[i]];
        
        NSDictionary *item = @{CYLTabBarItemTitle:titleName[i],
                                CYLTabBarItemImage:normalImageName,
                                CYLTabBarItemSelectedImage:selectImageName
                                };
        [tabBarItems addObject:item];
    }
    self.tabBarItemsAttributes = tabBarItems;
    
    //视图控制器
    NSMutableArray *viewControllers = [NSMutableArray array];
    NSArray *storyName = @[@"MY_Video",@"MY_Weather",@"MY_Main"];
    NSArray *storyIDName = @[@"MY_VideoViewController",@"MY_WeatherViewController",@"MY_MainViewController"];
    
    for (int i = 0; i<storyName.count; i++) {
        
        MY_BaseViewController *baseVC = [UISTORYBOARD(storyName[i]) instantiateViewControllerWithIdentifier:storyIDName[i]];
        MY_BaseNavigationController *baseNav = [[MY_BaseNavigationController alloc] initWithRootViewController:baseVC];
        [viewControllers addObject:baseNav];
    }
    self.viewControllers = viewControllers;
    
}



/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    self.tabBarHeight = 44.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = MainNormalColor;
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = MainSelectColor;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    //[self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    //[self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
    [self.tabBar setBackgroundColor:TabBarBackColor];
    [self.tabBar setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

//设置支持横竖屏
- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}


- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

