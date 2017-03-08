//
//  MY_AdWebViewController.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/16.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_AdWebViewController.h"
#import <WebKit/WKWebView.h>

@interface MY_AdWebViewController ()

@end

@implementation MY_AdWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self myAdWebView];
}

- (void)myAdWebView {
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT)];
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    if (self.AppDelegateSele == -1) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)urlStr {
    if (_urlStr == nil) {
        _urlStr = [NSString string];
    }
    return _urlStr;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
