//
//  MY_WeekWeatherViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/13.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeekWeatherViewController.h"

@interface MY_WeekWeatherViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>

/**
 一周天气
 */
@property (nonatomic, strong) UITableView *weekWeatherTableView;

@end

@implementation MY_WeekWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.weekWeatherTableView];
}


/**
 加载天气数据
 */
- (void)loadWeekWeatherInfo {
    
    
    
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //位移超过60后执行动画效果
    if (scrollView.contentOffset.y <= - 60 ) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



#pragma mark ------------//懒加载\\------------
- (UITableView *)weekWeatherTableView {
    if (_weekWeatherTableView == nil) {
        _weekWeatherTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _weekWeatherTableView.delegate = self;
        //_weekWeatherTableView.dataSource = self;
    }
    return _weekWeatherTableView;
}












@end
