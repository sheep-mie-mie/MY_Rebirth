//
//  MY_VideoViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_VideoViewController.h"
#import "MY_VideoTableViewCell.h"
#import "MY_VideoPlayerView.h"

@interface MY_VideoViewController ()
/**
 tableView
 */
@property (strong, nonatomic) IBOutlet UITableView *videoTableView;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *videoDataArray;
/**
 头视图
 */
@property (nonatomic, strong) UIView *videoHeardView;
/**
 尾视图
 */
@property (nonatomic, strong) UIView *videoFooterView;
/**
 展示界面
 */
@property (nonatomic, strong) MY_VideoPlayerView *videoPlayerView;

@end

@implementation MY_VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUpVideoViewState];
}

/**
 进行页面布局
 */
- (void)buildUpVideoViewState {
    
    [_videoTableView registerNib:[UINib nibWithNibName:@"MY_VideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_VideoTableViewCell"];
    _videoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.videoTableView.tableHeaderView = self.videoHeardView;
    self.videoTableView.tableFooterView = self.videoFooterView;
    
    [self loadVideoViewData];
    
}

#pragma mark ------------//加载数据\\------------
- (void)loadVideoViewData {
    [MYNetworkingObject updateBaseUrl:operEyesUrl];
    [MYNetWorkAPI loadOpenEyesInformationDataWithSuccess:^(MY_OpenEyesVoideModel *result) {
        if ([result.dailyList count]) {
            [self.videoDataArray addObjectsFromArray:result.dailyList];
            [self.videoTableView reloadData];
        } else {
            
        }
    } failure:^(NSError *error) {
        
        DTLog(@"数据加载失败");
        
    } showView:nil];
}


#pragma mark ------------//tableView\\------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.videoDataArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MY_OpenEyesVoideDailyListModel *dailyModel = self.videoDataArray[section];
    return dailyModel.total;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MY_VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MY_VideoTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(MY_VideoTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    MY_OpenEyesVoideDailyListModel *dailyModel = self.videoDataArray[indexPath.section];
    MY_OpenEyesVoideVideoListModel *voideModel = dailyModel.videoList[indexPath.row];
    cell.videoModel = voideModel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *titleHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 30)];
    titleHeaderLabel.text = @"Firday 02.17";
    titleHeaderLabel.textAlignment = NSTextAlignmentCenter;
    titleHeaderLabel.backgroundColor = [UIColor grayColor];
    return titleHeaderLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取当前点击的cell
    MY_VideoTableViewCell *cell = [self.videoTableView cellForRowAtIndexPath:indexPath];
    //计算cell的坐标
    CGRect rect = [cell convertRect:cell.bounds toView:nil];
    DTLog(@"cell的高度----%f",rect.origin.y);
    MY_OpenEyesVoideDailyListModel *dailyModel = self.videoDataArray[indexPath.section];
    _videoPlayerView = [[MY_VideoPlayerView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT) setOffY:rect.origin.y videoPlayerModel:dailyModel.videoList videoImage:cell.videoImageView.image indexPath:indexPath.row];
    
    [[self.videoTableView superview] addSubview:_videoPlayerView];
    
    //添加手势
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipGestureAction:)];
    [swipGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    [_videoPlayerView addGestureRecognizer:swipGesture];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_videoPlayerView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark ------------//下滑手势响应事件\\------------
- (void)swipGestureAction:(UISwipeGestureRecognizer *)swipGesture {
    
    _videoPlayerView.alpha = 0;
    
    [_videoPlayerView removeFromSuperview];
}




#pragma mark ------------//懒加载\\------------
- (UITableView *)videoTableView {
    if (_videoTableView == nil) {
        _videoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
        [_videoTableView registerNib:[UINib nibWithNibName:@"MY_VideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_VideoTableViewCell"];
        _videoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _videoTableView;
}

- (UIView *)videoHeardView {
    if (_videoHeardView == nil) {
        _videoHeardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT / 7 * 2-20)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_videoHeardView.bounds];
        imageView.center = _videoHeardView.center;
        imageView.image = [UIImage imageNamed:@"videoHeader_Image"];
        [_videoHeardView addSubview:imageView];
    }
    return _videoHeardView;
}

- (UIView *)videoFooterView {
    if (_videoFooterView == nil) {
        _videoFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 60)];
        _videoFooterView.backgroundColor = [UIColor grayColor];
        UILabel *endLabel = [[UILabel alloc] initWithFrame:_videoFooterView.bounds];
        [_videoFooterView addSubview:endLabel];
        [endLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.bottom.mas_equalTo(_videoFooterView);
            make.height.mas_equalTo(20);
        }];
        endLabel.backgroundColor = [UIColor goldColor];
        endLabel.text = @"-The End-";
        endLabel.textAlignment = NSTextAlignmentCenter;
        endLabel.font = [UIFont systemFontOfSize:14];
    }
    return _videoFooterView;
}

- (NSMutableArray *)videoDataArray {
    if (_videoDataArray == nil) {
        _videoDataArray = [[NSMutableArray alloc] init];
    }
    return _videoDataArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
