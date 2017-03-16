//
//  MY_MainViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/15.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_MainViewController.h"
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDK/ShareSDK.h>

@interface MY_MainViewController ()

@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation MY_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildUpMineView];
    
}


/**
 设置页面
 */
- (void)buildUpMineView {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    __block MY_MainViewController *weakSelf = self;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(MAINSCREEN_HEIGHT / 4);
    }];
    imageView.image = [UIImage imageNamed:@"backImage"];
    
    _loginBtn = [[UIButton alloc] init];
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageView.mas_centerX);
        make.centerY.mas_equalTo(imageView.mas_centerY);
        make.width.height.mas_equalTo(100);
    }];
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.layer.cornerRadius  = 8;
    _loginBtn.backgroundColor     = [UIColor redColor];
    [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *shareBtn = [[UIButton alloc] init];
    [self.view addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(weakSelf.view);
        make.bottom.mas_equalTo(weakSelf.view).offset(-49);
        make.height.mas_equalTo(35);
    }];
    shareBtn.backgroundColor = [UIColor goldColor];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)shareBtnAction {
    //创建分享参数
    NSArray *imageArray = @[[UIImage imageNamed:@"shareImg"]];
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        [shareParams SSDKEnableUseClientShare];
        //分享
        [ShareSDK share:SSDKPlatformSubTypeQQFriend parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                        message:nil
                                                                       delegate:nil
                                                              cancelButtonTitle:@"确定"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    break;
                }
                case SSDKResponseStateFail:
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                        message:[NSString stringWithFormat:@"%@", error]
                                                                       delegate:nil
                                                              cancelButtonTitle:@"确定"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    break;
                }
            }
        }];
        
        //分享
//        [ShareSDK showShareActionSheet:nil
//                                 items:nil
//                           shareParams:shareParams
//                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//                       
//                       switch (state) {
//                           case SSDKResponseStateSuccess:
//                           {
//                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
//                               [alertView show];
//                           }
//                               break;
//                           case SSDKResponseStateFail:
//                           {
//                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败" message:nil delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
//                               [alertView show];
//                               
//                           }
//                           default:
//                               break;
//                       }
//                   }];
    }
}



- (void)loginBtnAction {
    //QQ登录
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               
               if (state == SSDKResponseStateSuccess) {
                   NSLog(@"uid=%@",user.rawData);
                   NSLog(@"%@",user.credential);
                   NSLog(@"token=%@",user.credential.token);
                   NSLog(@"nickname=%@",user.nickname);
                   
                   [_loginBtn setBackgroundImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.icon]]] forState:UIControlStateNormal];
                   
               } else {
                   NSLog(@"%@",error);
               }
           }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
