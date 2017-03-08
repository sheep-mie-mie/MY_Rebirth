//
//  MY_BaseNavigationController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_BaseNavigationController.h"

@interface MY_BaseNavigationController ()

@end

@implementation MY_BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUpNavigationBarState];
}

- (void)buildUpNavigationBarState {
    
    [self.navigationBar setBackgroundImage:[UIColor imageWithColor:MainSelectColor] forBarMetrics:UIBarMetricsDefault];
    
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        self.navigationBar.layer.masksToBounds = NO;
    }
    
#warning --------------设置判断系统版本 稍后完成--------------
    
    
}



+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *fontSizeDic = [NSMutableDictionary dictionary];
    fontSizeDic[NSFontAttributeName] = [UIFont my_FontWithName:@"Zapfino" size:21];
    fontSizeDic[NSForegroundColorAttributeName] = [UIColor seaShell];
    [navBar setTitleTextAttributes:fontSizeDic];
    
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    //普通
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1];
    [appearance setTitleTextAttributes:dict forState:UIControlStateNormal];
    //高亮
    NSMutableDictionary *hightDict = [NSMutableDictionary dictionary];
    hightDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:hightDict forState:UIControlStateHighlighted];
    //不能点
    NSMutableDictionary *disableDict = [NSMutableDictionary dictionary];
    disableDict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableDict forState:UIControlStateDisabled];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
