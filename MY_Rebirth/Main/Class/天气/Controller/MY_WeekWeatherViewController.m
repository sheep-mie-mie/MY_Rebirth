//
//  MY_WeekWeatherViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/3/13.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_WeekWeatherViewController.h"
#import "MY_WeekWeatherCell.h"

@interface MY_WeekWeatherViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate>

/**
 一周天气
 */
@property (nonatomic, strong) UITableView *weekWeatherTableView;

@end

@implementation MY_WeekWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.weekWeatherTableView];
    UIImageView *imageVIiew = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageVIiew.image = [UIImage imageNamed:@"backImage"];
    imageVIiew.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageVIiew];
    
    UILabel *loadTextLabel = [[UILabel alloc] init];
    [self.view addSubview:loadTextLabel];
    [loadTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.mas_equalTo(imageVIiew);
        make.height.mas_equalTo(60);
    }];
    loadTextLabel.text = @"更多功能 敬请期待";
    loadTextLabel.font = [UIFont fontWithName:LATO_LIGHT size:40];
    loadTextLabel.textAlignment = NSTextAlignmentCenter;
    loadTextLabel.textColor = [UIColor goldColor];
}


/**
 加载天气数据
 */
- (void)loadWeekWeatherInfo {
    
    
    
}




#pragma mark ------------//delegate\\------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.weekWeatherModel.list count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MY_WeekWeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MY_WeekWeatherCell" forIndexPath:indexPath];
    cell.model = self.weekWeatherModel.list[indexPath.row];
    
    return cell;
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
        _weekWeatherTableView.dataSource = self;
        [_weekWeatherTableView registerNib:[UINib nibWithNibName:@"MY_WeekWeatherCell" bundle:nil] forCellReuseIdentifier:@"MY_WeekWeatherCell"];
    }
    return _weekWeatherTableView;
}



- (void)setWeekWeatherModel:(MY_WeekWeatherModel *)weekWeatherModel {
    _weekWeatherModel = weekWeatherModel;
}








@end
