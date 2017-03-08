//
//  MYNetworkingManager.m
//  iFlyKD_iFly
//
//  Created by ifly on 2017/1/18.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MYNetworkingManager.h"
#import "MBProgressHUD.h"
#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface NSString (md5)
+ (NSString *)myNetworking_md5:(NSString *)string;
@end

@implementation NSString (md5)
+ (NSString *)myNetworking_md5:(NSString *)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *muStr = [NSMutableString string];
    for (i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [muStr appendFormat:@"%02x",(int)(digest[i])];
    }
    return [muStr copy];
}
@end

#pragma mark----------------// 网络请求管理者 \\----------------
@interface MYNetworkingManager ()

@end

@implementation MYNetworkingManager

#pragma mark----//GET请求三种回调\\----

/**
 GET请求的公共方法 以下三种方法都调用这个方法 根据传入的不同参数觉得回调的方式

 @param url          url
 @param parameters   入参
 @param target       对象
 @param action       事件
 @param delegate     代理
 @param success      成功
 @param failure      失败
 @param progress     进度
 @param refreshCache 是否刷新缓存。由于请求成功也可能没有数据，对于业务失败，只能通过人为手动判断
 @param showView     加载框
 */
+ (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parameters
                   target:(id)target
                   action:(SEL)action
                 delegate:(id)delegate
                  success:(MYResponseSuccess)success
                  failure:(MYResponseFail)failure
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView {
    
    NSMutableDictionary *muDict = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [MYNetworkingObject initWithType:MYNetworkTypeGET url:url parameters:muDict refreshCache:refreshCache delegate:delegate target:target action:action hashValue:0 showView:showView progress:progress success:success failure:failure];
}


/**
 GET请求通过Block 回调结果

 @param url          url
 @param parameters   入参
 @param success      成功
 @param failure      失败
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)getRequestWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                  success:(MYResponseSuccess)success
                  failure:(MYResponseFail)failure
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView {
    
    [self getRequestWithUrl:url parameters:parameters target:nil action:nil delegate:nil success:success failure:failure progress:progress refreshCache:refreshCache showView:showView];
}

/**
 GET请求通过代理回调

 @param url          url
 @param parameters   入参
 @param delegate     代理
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parameters
                 delegate:(id<MYNetworkDelegate>)delegate
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView {
    
    [self getRequestWithUrl:url parameters:parameters target:nil action:nil delegate:delegate success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];
}


/**
 GET请求 通过target回调

 @param url          url
 @param parameters   入参
 @param target       对象
 @param action       事件
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parameters
                   target:(id)target action:(SEL)action
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView {
    
    [self getRequestWithUrl:url parameters:parameters target:target action:action delegate:nil success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];
}


#pragma mark----//POST请求三种回调\\----

/**
 发送一个 POST请求的公共方法 传入不同的回调参数决定回调的方式

 @param url          url
 @param parameters   入参
 @param target       对象
 @param action       事件
 @param delegate     协议
 @param success      成功
 @param failure      失败
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)postRequestWithUrl:(NSString*)url
                parameters:(NSDictionary*)parameters
                    target:(id)target
                    action:(SEL)action
                  delegate:(id<MYNetworkDelegate>)delegate
                   success:(MYResponseSuccess)success
                   failure:(MYResponseFail)failure
                  progress:(MYPostProgress)progress
              refreshCache:(BOOL)refreshCache
                  showView:(UIView *)showView{
    
    NSMutableDictionary *muDict = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [MYNetworkingObject initWithType:MYNetworkTypePOST url:url parameters:muDict refreshCache:refreshCache delegate:delegate target:target action:action hashValue:1 showView:showView progress:progress success:success failure:failure];
}


/**
 通过block 回调结果

 @param url          url
 @param parameters   入参
 @param success      成功
 @param failure      失败
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)postRequestWithURL:(NSString *)url parameters:(NSDictionary *)parameters success:(MYResponseSuccess)success failure:(MYResponseFail)failure progress:(MYGetProgress)progress refreshCache:(BOOL)refreshCache showView:(UIView *)showView {
    [self postRequestWithUrl:url parameters:parameters target:nil action:nil delegate:nil success:success failure:failure progress:progress refreshCache:refreshCache showView:showView];
}


//+ (void)postRequestWithUrl:(NSString*)url
//                parameters:(NSDictionary*)parameters
//                   success:(MYResponseSuccess)success
//                   failure:(MYResponseFail)failure
//                  progress:(MYPostProgress)progress
//              refreshCache:(BOOL)refreshCache
//                  showView:(UIView *)showView {
//    
//    [self postRequestWithUrl:url parameters:parameters target:nil action:nil delegate:nil success:success failure:failure progress:progress refreshCache:refreshCache showView:showView];
//}


/**
 post请求 通过代理回调

 @param url          url
 @param parameters   入参
 @param delegate     代理
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)postRequestWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                  delegate:(id<MYNetworkDelegate>)delegate
                  progress:(MYGetProgress)progress
              refreshCache:(BOOL)refreshCache
                  showView:(UIView *)showView {
        [self postRequestWithUrl:url parameters:parameters target:nil action:nil delegate:delegate success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];
}
//+ (void)postReqeustWithUrl:(NSString*)url
//                parameters:(NSDictionary*)parameters
//                  delegate:(id<MYNetworkDelegate>)delegate
//                  progress:(MYPostProgress)progress
//              refreshCache:(BOOL)refreshCache
//                  showView:(UIView *)showView {
//    
//    [self postRequestWithUrl:url parameters:parameters target:nil action:nil delegate:delegate success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];
//}


/**
 post请求 通过target回调结果

 @param url          url
 @param parameters   入参
 @param target       对象
 @param action       时间
 @param progress     进度
 @param refreshCache 是否刷新缓存
 @param showView     加载框
 */
+ (void)postRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters target:(id)target action:(SEL)action progress:(MYGetProgress)progress refreshCache:(BOOL)refreshCache showView:(UIView *)showView {
    [self postRequestWithUrl:url parameters:parameters target:target action:action delegate:nil success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];

}
//+ (void)postReqeustWithUrl:(NSString*)url
//                parameters:(NSDictionary*)parameters
//                    target:(id)target
//                    action:(SEL)action
//                  progress:(MYPostProgress)progress
//              refreshCache:(BOOL)refreshCache
//                  showView:(UIView *)showView {
//    
//    [self postRequestWithUrl:url parameters:parameters target:target action:action delegate:nil success:nil failure:nil progress:progress refreshCache:refreshCache showView:showView];
//}

@end

#pragma mark----------------// 网络请求管理者 \\----------------
@interface MYNetworkingObject ()<MBProgressHUDDelegate>

/**
 当前网络是否可以使用
 */
@property (nonatomic, assign) BOOL networkError;

/**
 加载框展示 只支持MBProgressHUD
 */
@property (nonatomic, strong) MBProgressHUD *hud;

@end

#pragma mark----//静态变量\\----
//baseUrl
static NSString *my_privateNetworkBaseUrl = nil;
//默认缓存路劲
static NSString *my_baseCacheDocuments = @"MYHNetworkCaches";
//是否更换baseUrl
static BOOL my_isBaseUrlChanged = YES;
//默认请求超时时间60s
static NSTimeInterval my_timeout = 60.0f;
//检查网络是否异常
static BOOL my_shouldObtainLocalWhenUnconnecten = NO;
//是否从缓存中Get
static BOOL my_cacheGet = YES;
//是否从缓存中Post
static BOOL my_cachePost = NO;
//当前出入什么网络
static MYNetworkStatus my_networkStatus = MYNetworkStatusReachableViaWiFi;
//默认缓存大小
static NSUInteger my_maxCacheSize = 0;
//是否打印获取的数据
static BOOL my_isEnableInterfaceDebug = NO;
//响应数据默认类型
static MYResponseType my_responseType = MYResponseTypeJSON;
//请求数据的默认类型
static MYRequestType my_requestType = MYRequestTypePlainText;
//是否允许自动编码Url
static BOOL my_shouldAutoEncode = NO;
//当前取消请求是 是否回调
static BOOL my_shouldCallBackOnCancelRequest = YES;
//请求头字典
static NSDictionary *my_httpHeaders = nil;
//所以的请求数组
static NSMutableArray *my_requestTasks;
//
static AFHTTPSessionManager *my_sharedManager = nil;
//获取默认缓存位置
static inline NSString *cachePath() {
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",my_baseCacheDocuments]];
}



@implementation MYNetworkingObject

/**
 单利
 */
+ (MYNetworkingObject *)sharedInstance {
    
    static MYNetworkingObject *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        handler = [[MYNetworkingObject alloc] init];
    });
    return handler;
}

- (instancetype)init {
    if (self = [super init]) {
        self.networkError = NO;
        cachePath();
    }
    return self;
}


/**
 用于指定网络请求接口的基础url，如：
 http://henishuo.com或者http://101.200.209.244
 通常在AppDelegate中启动时就设置一次就可以了。如果接口有来源
 于多个服务器，可以调用更新
 @param baseUrl 网络接口的基础url
 */
+ (void)updateBaseUrl:(NSString *)baseUrl {
    if (![baseUrl isEqualToString:my_privateNetworkBaseUrl] && baseUrl && baseUrl.length) {
        //baseUrl已经更换过了
        my_isBaseUrlChanged = YES;
    } else {
        //baseUrl没有更换
        my_isBaseUrlChanged = NO;
    }
    my_privateNetworkBaseUrl = baseUrl;
}


/**
 返回baseUrl
 */
+ (NSString *)baseUrl {
    
    return my_privateNetworkBaseUrl;
}

/**
 项目中默认的网络缓存路径,也可以当做项目中的缓存路线,根据需求自行设置
 默认路径是(GDHNetworkCaches)
 格式是:@"Documents/GDHNetworkCaches",只需要字符串即可。

 @param baseCache 默认路径是MYNetworkCaches
 */
+ (void)updateBaseCacheDocuments:(NSString *)baseCache {
    if (baseCache != nil && baseCache.length > 0) {
        my_baseCacheDocuments = baseCache;
        if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath() isDirectory:nil]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:cachePath() withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
}

/**
 项目中默认的网络缓存路径,也可以当做项目中的缓存路线,根据需求自行设置
 @return 格式是:@"Documents/MYNetworkCaches"
 */
+ (NSString *)baseCache {
    return [NSString stringWithFormat:@"Documents/%@",my_baseCacheDocuments];
}

/**
 设置请求超时时间 默认为60秒
 @param timeOut 超时时间
 */
+ (void)setTimeOut:(NSTimeInterval)timeOut {
    my_timeout = timeOut;
}


/**
 当检查到网络异常时，是否从从本地提取数据。默认为NO。一旦设置为YES,当设置刷新缓存时，
 若网络异常也会从缓存中读取数据。同样，如果设置超时不回调，同样也会在网络异常时回调，除非
 本地没有数据
 @param shouldObtain YES/NO
 */
+ (void)obtainDataFromLocalWhenNetworkUnconnected:(BOOL)shouldObtain {
    my_shouldObtainLocalWhenUnconnecten = shouldObtain;
    if (my_shouldObtainLocalWhenUnconnecten && (my_cacheGet || my_cachePost)) {
        [self startMonitoringNetworkStatus:nil];
    }
}



/**
 监听网络状态变化
 @param statusBlock 返回网络状态类型枚举
 */
+ (void)startMonitoringNetworkStatus:(MYNetworkStatusBlock)statusBlock {
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath() isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath() withIntermediateDirectories:YES attributes:nil error:nil];
    }
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            //网络无连接
            my_networkStatus = MYNetworkStatusNotReachable;
            [MYNetworkingObject sharedInstance].networkError = YES;
            if (statusBlock) {
                statusBlock(my_networkStatus);
            }
        } else if (status == AFNetworkReachabilityStatusUnknown) {
            //未知网络
            my_networkStatus = MYNetworkStatusUnknown;
            [MYNetworkingObject sharedInstance].networkError = NO;
            if (statusBlock) {
                statusBlock(my_networkStatus);
            }
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            //2.3.4G网络
            my_networkStatus = MYNetworkStatusReachableViaWWAN;
            [MYNetworkingObject sharedInstance].networkError = NO;
            if (statusBlock) {
                statusBlock(my_networkStatus);
            }
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            //WiFi网络
            my_networkStatus = MYNetworkStatusReachableViaWiFi;
            [MYNetworkingObject sharedInstance].networkError = NO;
            if (statusBlock) {
                statusBlock(my_networkStatus);
            }
        }
    }];
}

/**
 默认只缓存GET请求的数据，对于POST请求是不缓存的。如果要缓存POST获取的数据，需要手动调用设置
 对JSON类型数据有效，对于PLIST、XML不确定！
 @param isCacheGet 默认是YES
 @param shouldCachePost 默认是NO
 */
+ (void)cacheGetRequest:(BOOL)isCacheGet shouldCachePost:(BOOL)shouldCachePost {
    my_cacheGet = isCacheGet;
    my_cachePost = shouldCachePost;
}


/**
 获取缓存总大小
 @return 缓存大小
 */
+ (unsigned long long)totalCacheSize {
    NSString *directoryPath = cachePath();
    BOOL isDir = NO;
    unsigned long long total = 0;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDir]) {
        if (isDir) {
            NSError *error = nil;
            NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:&error];
            if (error == nil) {
                for (NSString *subpath in array) {
                    NSString *path = [directoryPath stringByAppendingPathComponent:subpath];
                    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
                    if (!error) {
                        total += [dict[NSFileSize]unsignedIntegerValue];
                    }
                }
            }
        }
    }
    return total;
}


/**
 默认不会自动清除缓存，如果需要，可以设置自动清除缓存，并且需要指定上限。当指定上限>0M时，
 若缓存达到了上限值，则每次启动应用则尝试自动去清理缓存。
 @param mSize 缓存上限大小，单位为M（兆），默认为0，表示不清理
 */
+ (void)autoToClearCacheWithLimitedToSize:(NSUInteger)mSize {
    my_maxCacheSize = mSize;
}

/**
 清除缓存
 */
- (BOOL)clearCaches {
    NSString *directoryPath = cachePath();
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:&error];
        if (error) {
            DTLog(@"MYNetworking clear caches error: %@", error);
            return NO;
        } else {
            DTLog(@"MYNetworking clear caches ok");
            return YES;
        }
    } else {
        return NO;
    }
}

/**
 开启或关闭接口打印信息
 @param isDebug 开发期打开 默认是NO
 */
+ (void)enableInterfaceDebug:(BOOL)isDebug {
    my_isEnableInterfaceDebug = isDebug;
}
+ (BOOL)isDebug {
    return my_isEnableInterfaceDebug;
}


/**
 配置请求格式 默认是JSON 如果要求传XML或者PLIST 请在全局配置一下
 @param requestType 请求格式 默认是JSON
 @param responseType 响应格式 默认是JSON
 @param shouldAutoEncode YES/NO 默认是NO 是否自动encode url
 @param shouldCallBackOnCancelRequest 当取消请求时 是否回调 默认为YES
 */
+ (void)configRequestType:(MYRequestType)requestType
             responseType:(MYResponseType)responseType
      shouldAutoEncodeUrl:(BOOL)shouldAutoEncode
  callBackOnCancelRequest:(BOOL)shouldCallBackOnCancelRequest {
    
    my_requestType = requestType;
    my_responseType = responseType;
    my_shouldAutoEncode = shouldAutoEncode;
    my_shouldCallBackOnCancelRequest = shouldCallBackOnCancelRequest;
}
+ (BOOL)shouldEncode {
    return my_shouldAutoEncode;
}

/**
 配置公共请求头 只调用一次 通常放在应用启动的时候配置
 @param httpHeaders 只需要将与服务器商定的固定参数设置即可
 */
+ (void)configCommonHttoHeaders:(NSDictionary *)httpHeaders {
    my_httpHeaders = httpHeaders;
}

/**
 获取所有的请求
 */
+ (NSMutableArray *)allTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (my_requestTasks == nil) {
            my_requestTasks = [[NSMutableArray alloc] init];
        }
    });
    return my_requestTasks;
}

/**
 取消所有的请求
 */
+ (void)cancelAllRequest {
    @synchronized (self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(MYURLSessionTask  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[MYURLSessionTask class]]) {
                [obj cancel];
            }
        }];
        [[self allTasks] removeAllObjects];
    }
}

/**
 取消某个请求。如果是要取消某个请求，最好是引用接口所返回来的HYBURLSessionTask对象，
 然后调用对象的cancel方法。如果不想引用对象，这里额外提供了一种方法来实现取消某个请求
 @param url URL，可以是绝对URL，也可以是path（也就是不包括baseurl）
 */
+ (void)cancelRequestWithUrl:(NSString *)url {
    if (url == nil) {
        return;
    }
    @synchronized (self) {
        [[self allTasks] enumerateObjectsUsingBlock:^(MYURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[MYURLSessionTask class]] && [task.currentRequest.URL.absoluteString hasSuffix:url]) {
                [task cancel];
                [[self allTasks] removeObject:task];
                return ;
            }
        }];
    }
}


#pragma mark----------------// 创建一个网络请求 \\----------------

+ (MYURLSessionTask *)initWithType:(MYNetworkType)networkType
                               url:(NSString *)url
                        parameters:(NSDictionary *)parameters
                      refreshCache:(BOOL)refreshCache
                          delegate:(id)delegate
                            target:(id)target
                            action:(SEL)action
                         hashValue:(NSUInteger)hashValue
                          showView:(UIView *)showView
                          progress:(MYDownloadProgress)progress
                           success:(MYResponseSuccess)success
                           failure:(MYResponseFail)failure {
    
    MYNetworkingObject *object = [MYNetworkingObject sharedInstance];
    object.delegate = delegate;
    object.target = target;
    object.select = action;
    
    if (showView != nil) {
        [MBProgressHUD showHUDAddedTo:showView animated:YES];
    }
    if ([self shouldEncode]) {
        url = [self encodeUrl:url];
    }
    AFHTTPSessionManager *manager = [self manager];
    NSString *absolute = [self absoluteUrlWithPath:url];
    if ([self baseUrl] == nil) {
        if ([NSURL URLWithString:url] == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            SHOW_ALERT(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            } 
            failure(nil);
            return nil;
        }
    } else {
        NSURL *absoluteUrl = [NSURL URLWithString:absolute];
        if (absoluteUrl == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            SHOW_ALERT(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
            return nil;
        }
    }
    MYURLSessionTask *session = nil;
    if (networkType == MYNetworkTypeGET) {
        //GET请求
        if (my_networkStatus == MYNetworkStatusNotReachable || my_networkStatus == MYNetworkStatusUnknown) {
            if (refreshCache) {//网络无法正常请求数据
                id response = [MYNetworkingObject cacheResponseWithUrl:absolute parameters:parameters];
                if (response) {//缓存数据中存在
                    if (success) {//block返回数据
                        [self successResponse:response callBack:success];
                    }
                    if (delegate) {//代理
                        if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                            [object.delegate requestDidFinishLoading:[self tryToParseData:response]];
                        }
                    }
                    //方法
                    [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:response] withObject:nil];
                    if ([self isDebug]) {
                        [self longWithSuccessResponse:response url:absolute parameters:parameters];
                    }
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                    return nil;
                } else {
                    if (showView != nil) {
                        [MBProgressHUD hideHUDForView:showView animated:YES];
                    }
                    SHOW_ALERT(@"网络连接断开,请检查网络!");
                    failure(nil);
                    return nil;
                }
            } else {
                if (showView != nil) {
                    [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                }
                SHOW_ALERT(@"网络连接断开,请检查网络!");
                failure(nil);
                return nil;
            }
        } else {
            session = [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                if (progress) {
                    progress(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount,downloadProgress.totalUnitCount - downloadProgress.completedUnitCount);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {//block
                    [self successResponse:responseObject callBack:success];
                }
                if (delegate) {//delegate
                    if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                        [object.delegate requestDidFinishLoading:[self tryToParseData:responseObject]];
                    }
                }
                //方法
                [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:responseObject] withObject:nil];
                if (my_cacheGet) {
                    [self cacheResponseObject:responseObject request:absolute parameters:parameters];
                }
                [[self allTasks] removeObject:task];
                if ([self isDebug]) {
                    [self longWithSuccessResponse:responseObject url:absolute parameters:parameters];
                }
                if (showView != nil) {
                    [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [[self allTasks] removeObject:task];
                if ([error code] < 0 && refreshCache) {//获取缓存
                    id response = [MYNetworkingObject cacheResponseWithUrl:absolute parameters:parameters];
                    if (response) {
                        if (success) {//block返回数据
                            [self successResponse:response callBack:success];
                        }
                        if (delegate) {//代理
                            if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                                [object.delegate requestDidFinishLoading:[self tryToParseData:response]];
                            }
                        }
                        //方法
                        [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:response] withObject:nil];
                        if ([self isDebug]) {
                            [self longWithSuccessResponse:response url:absolute parameters:parameters];
                        }
                        if (showView != nil) {
                            [MBProgressHUD hideHUDForView:showView animated:YES];
                        }
                    } else {
                        //block
                        [self handleCallbackWithError:error fail:failure];
                        
                        //代理
                        if ([object.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
                            [object.delegate requestDidFailWithError:error];
                        }
                        //方法
                        [object performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                        if ([self isDebug]) {
                            [self longWithFailError:error url:absolute parameters:parameters];
                        }
                        if (showView != nil) {
                            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                        }
                        failure(nil);
                    }
                } else {
                    //block
                    [self handleCallbackWithError:error fail:failure];
                    //代理
                    if ([object.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
                        [object.delegate requestDidFailWithError:error];
                    }
                    //方法
                    [object performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                    if ([self isDebug]) {
                        [self longWithFailError:error url:absolute parameters:parameters];
                    }
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                }
            }];
        }
    } else if (networkType == MYNetworkTypePOST) {//POST请求
        if (my_networkStatus == MYNetworkStatusNotReachable || my_networkStatus == MYNetworkStatusUnknown) {//获取数据 没有网络
            if (refreshCache) {//获取缓存数据
                id response = [MYNetworkingObject cacheResponseWithUrl:absolute parameters:parameters];
                if (response) {
                    if (success) {//block返回数据
                        [self successResponse:response callBack:success];
                    }
                    
                    if (delegate) {//代理
                        if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                            [object.delegate requestDidFinishLoading:[self tryToParseData:response]];
                        }
                    }
                    //方法
                    [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:response] withObject:nil];
                    if ([self isDebug]) {
                        [self longWithSuccessResponse:response url:absolute parameters:parameters];
                    }
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                    return nil;
                } else {
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                    SHOW_ALERT(@"网络连接断开,请检查网络!");
                    failure(nil);
                    return nil;
                }
            } else {//不获取
                if (showView != nil) {
                    [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                }
                SHOW_ALERT(@"网络连接断开,请检查网络!");
                failure(nil);
                return nil;
            }
        } else {//有网
            session = [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                if (progress) {
                    progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount,downloadProgress.totalUnitCount-downloadProgress.completedUnitCount);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {//block返回数据
                    [self successResponse:responseObject callBack:success];
                }
                if (delegate) {//代理
                    if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                        [object.delegate requestDidFinishLoading:[self tryToParseData:responseObject]];
                    }
                }
                //方法
                [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:responseObject] withObject:nil];
                if ([self isDebug]) {
                    [self longWithSuccessResponse:responseObject url:absolute parameters:parameters];
                }
                if (my_cachePost) {
                    [self cacheResponseObject:responseObject request:absolute parameters:parameters];
                }
                [[self allTasks] removeObject:task];
                if ([self isDebug]) {
                    [self longWithSuccessResponse:responseObject url:absolute parameters:parameters];
                }
                if (showView != nil) {
                    [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [[self allTasks] removeObject:task];
                if ([error code] < 0 && refreshCache) {//获取缓存
                    id response = [MYNetworkingObject cacheResponseWithUrl:absolute parameters:parameters];
                    if (response) {
                        if (success) {//block返回数据
                            [self successResponse:response callBack:success];
                        }
                        if (delegate) {//代理
                            if ([object.delegate respondsToSelector:@selector(requestDidFinishLoading:)]) {
                                [object.delegate requestDidFinishLoading:[self tryToParseData:response]];
                            }
                        }
                        //方法
                        [object performSelector:@selector(finishedRequest: didFaild:) withObject:[self tryToParseData:response] withObject:nil];
                        if ([self isDebug]) {
                            [self longWithSuccessResponse:response url:absolute parameters:parameters];
                        }
                        if (showView != nil) {
                            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                        }
                    } else {
                        [self handleCallbackWithError:error fail:failure];
                        //代理
                        if ([object.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
                            [object.delegate requestDidFailWithError:error];
                        }
                        //方法
                        [object performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                        if ([self isDebug]) {
                            [self longWithFailError:error url:absolute parameters:parameters];
                        }
                    }
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                } else {
                    [self handleCallbackWithError:error fail:failure];
                    //代理
                    if ([object.delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
                        [object.delegate requestDidFailWithError:error];
                    }
                    //方法
                    [object performSelector:@selector(finishedRequest: didFaild:) withObject:nil withObject:error];
                    if ([self isDebug]) {
                        [self longWithFailError:error url:absolute parameters:parameters];
                    }
                    if (showView != nil) {
                        [MBProgressHUD hideAllHUDsForView:showView animated:YES];
                    }
                }
            }];
        }
    }
    if (session) {
        [[self allTasks] addObject:session];
    }
    return session;
}


#pragma mark ----------------// Private \\----------------

+ (AFHTTPSessionManager *)manager {
    @synchronized (self) {
        // 只要不切换baseurl，就一直使用同一个session manager
        if (my_sharedManager == nil || my_isBaseUrlChanged) {
            //开启加载
            [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
            AFHTTPSessionManager *manager = nil;
            if ([self baseUrl] != nil) {
                manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[self baseUrl]]];
            } else {
                manager = [AFHTTPSessionManager manager];
            }
            
            switch (my_requestType) {
                case MYRequestTypeJSON: {
                    manager.requestSerializer = [AFJSONRequestSerializer serializer];
                    break;
                }
                case MYRequestTypePlainText: {
                    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
                    break;
                }
                default:
                    break;
            }
            
            switch (my_responseType) {
                case MYResponseTypeJSON: {
                    manager.responseSerializer = [AFJSONResponseSerializer serializer];
                    break;
                }
                case MYResponseTypeXML: {
                    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
                    break;
                }
                case MYResponseTypeData: {
                    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                    break;
                }
                default:
                    break;
            }
            manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
            for (NSString *key in my_httpHeaders.allKeys) {
                if (my_httpHeaders[key] != nil) {
                    [manager.requestSerializer setValue:my_httpHeaders[key] forHTTPHeaderField:key];
                }
            }
            
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*"]];
            
            manager.requestSerializer.timeoutInterval =my_timeout;
            //设置允许同事最大并发数 过大容易发生问题
            manager.operationQueue.maxConcurrentOperationCount = 3;
            my_sharedManager = manager;
        }
    }
    return my_sharedManager;
}

+ (NSString *)absoluteUrlWithPath:(NSString *)path {
    if (path == nil || path.length == 0) {
        return @"";
    }
    if ([self baseUrl] == nil || [[self baseUrl] length] == 0) {
        return path;
    }
    NSString *absoluteUrl = path;
    if (![path hasPrefix:@"http://"] && ![path hasPrefix:@"https://"]) {// hasPrefix 判断开头是否包含 hasSuffix判断结尾是否包含
        if ([[self baseUrl] hasSuffix:@"/"]) {
            if ([path hasPrefix:@"/"]) {
                NSMutableString *mutablePath = [NSMutableString stringWithString:path];
                [mutablePath deleteCharactersInRange:NSMakeRange(0, 1)];
                absoluteUrl = [NSString stringWithFormat:@"%@%@",[self baseUrl],mutablePath];
            } else {
                absoluteUrl = [NSString stringWithFormat:@"%@%@",[self baseUrl],path];
            }
        } else {
            if ([path hasPrefix:@"/"]) {
                absoluteUrl = [NSString stringWithFormat:@"%@%@",[self baseUrl],path];
            } else {
                absoluteUrl = [NSString stringWithFormat:@"%@/%@",[self baseUrl],path];
            }
        }
    }
    return absoluteUrl;
}

+ (NSString *)encodeUrl:(NSString *)url {
    return [self my_UrlEncode:url];
}

+ (NSString *)my_UrlEncode:(NSString *)url {

    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (id)cacheResponseWithUrl:(NSString *)url parameters:(id)params {
    id cacheData = nil;
    if (url) {
        NSString *directoryPath = cachePath();
        NSString *absoluteUrl = [self generateGetAbsoluteUrl:url parameters:params];
        NSString *key = [NSString myNetworking_md5:absoluteUrl];
        NSString *path = [directoryPath stringByAppendingPathComponent:key];
        
        NSData *data = [[NSFileManager defaultManager] contentsAtPath:path];
        if (data) {
            cacheData = data;
            DTLog(@"Read data from cache for url: %@\n", url);

        }
    }
    return cacheData;
}

+ (void)successResponse:(id)responseData callBack:(MYResponseSuccess)success {
    if (success) {
        success([self tryToParseData:responseData]);
    }
}

+ (id)tryToParseData:(id)responseData {
    if ([responseData isKindOfClass:[NSData class]]) {
        //尝试解析成JSON
        if (responseData == nil) {
            return responseData;
        } else {
            NSError *error = nil;
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
            if (error != nil) {
                return responseData;
            } else {
                return response;
            }
        }
    } else {
        return responseData;
    }
}



#pragma mark----//解析数据\\----

+ (void)longWithSuccessResponse:(id)response url:(NSString *)url parameters:(NSDictionary *)parameters {
    DTLog(@"\n");
    DTLog(@"\nRequest success, URL: %@\n params:%@\n response:%@\n\n",[self generateGetAbsoluteUrl:url parameters:parameters],parameters,[self tryToParseData:response]);
}


//仅对一级字典结构起作用
+ (NSString *)generateGetAbsoluteUrl:(NSString *)url parameters:(id)parameters {
    
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]] || ((NSDictionary *)parameters).count == 0) {
        return url;
    }
    NSString *queries = @"";
    for (NSString *key in parameters) {
        id value = [parameters objectForKey:key];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            continue;
        } else if ([value isKindOfClass:[NSArray class]]) {
            continue;
        } else if ([value isKindOfClass:[NSSet class]]) {
            continue;
        } else {
            queries = [NSString stringWithFormat:@"%@%@=%@&",(queries.length == 0 ? @"&" : queries),key,value];
        }
    }
    if (queries.length > 1) {
        queries = [queries substringToIndex:queries.length - 1];
    }
    if (([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"]) && queries.length > 1) {
        if ([url rangeOfString:@"?"].location != NSNotFound
            || [url rangeOfString:@"#"].location != NSNotFound) {
            url = [NSString stringWithFormat:@"%@%@", url, queries];
        } else {
            queries = [queries substringFromIndex:1];
            url = [NSString stringWithFormat:@"%@?%@", url, queries];
        }
    }
    return url.length == 0 ? queries : url;
}

+ (void)cacheResponseObject:(id)responseObject request:(NSString *)request parameters:params {
    if (request && responseObject && ![responseObject isKindOfClass:[NSNull class]]) {
        NSString *directoryPath = cachePath();
        
        NSError *error = nil;
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&error];
            if (error) {
                DTLog(@"create cache dir error: %@\n", error);
                return;
            }
        }
        
        NSString *absoluteURL = [self generateGetAbsoluteUrl:request parameters:params];
        NSString *key = [NSString myNetworking_md5:absoluteURL];
        NSString *path = [directoryPath stringByAppendingPathComponent:key];
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        NSData *data = nil;
        if ([dict isKindOfClass:[NSData class]]) {
            data = responseObject;
        } else {
            data = [NSJSONSerialization dataWithJSONObject:dict
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
        }
        
        if (data && error == nil) {
            BOOL isOk = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
            if (isOk) {
                DTLog(@"cache file ok for request: %@\n", absoluteURL);
            } else {
                DTLog(@"cache file error for request: %@\n", absoluteURL);
            }
        }
    }
}

+ (void)handleCallbackWithError:(NSError *)error fail:(MYResponseFail)fail {
    if ([error code] == NSURLErrorCancelled) {
        if (my_shouldCallBackOnCancelRequest) {
            if (fail) {
                fail(error);
            }
        }
    } else {
        if (fail) {
            fail(error);
        }
    }
}

+ (void)longWithFailError:(NSError *)error url:(NSString *)url parameters:(id)parameters {
    NSString *format = @"params: ";
    if (parameters == nil || ![parameters isKindOfClass:[NSDictionary class]]) {
        format = @"";
        parameters = @"";
    }
    DTLog(@"\n");
    if ([error code] == NSURLErrorCancelled) {
        DTLog(@"\nRequest was canceled mannully, URL: %@ %@%@\n\n",[self generateGetAbsoluteUrl:url parameters:parameters],format,parameters);
    } else {
        DTLog(@"\nRequest error, URL: %@ %@%@\n errorInfos:%@\n\n",[self generateGetAbsoluteUrl:url parameters:parameters],format,parameters,[error localizedDescription]);
    }
}


/**
 图片上传接口，若不指定baseurl，可传完整的url

 @param image 图片
 @param url url
 @param fileName 给图片起一个名字，默认为当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 @param name 与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 @param mineType 默认为image/jpeg
 @param parameters 入参
 @param showView 加载框
 @param progress 进度条
 @param success 成功
 @param failure 失败
 @return 对象
 */
+ (MYURLSessionTask *)uploadWithImage:(UIImage *)image
                                  url:(NSString *)url
                             fileName:(NSString *)fileName
                                 name:(NSString *)name
                             mineType:(NSString *)mineType
                           parameters:(NSDictionary *)parameters
                             showView:(UIView *)showView
                             progress:(MYUploadProgress)progress
                              success:(MYResponseSuccess)success
                              failure:(MYResponseFail)failure {
    
    if (my_networkStatus == MYNetworkStatusNotReachable || my_networkStatus == MYNetworkStatusUnknown) {
        SHOW_ALERT(@"网络连接断开,请检查网络!");
        return nil;
    }
    if (showView) {
        [MYNetworkingObject sharedInstance].hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
        [MYNetworkingObject sharedInstance].hud.mode = MBProgressHUDModeDeterminate;
    }
    if ([self baseUrl] == nil) {
        if ([NSURL URLWithString:url] == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
            return nil;
        }
    } else {
        if ([NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[self baseUrl],url]] == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
            return nil;
        }
    }
    if ([self shouldEncode]) {
        url = [self encodeUrl:url];
    }
    
    NSString *absolute = [self absoluteUrlWithPath:url];
    AFHTTPSessionManager *manager = [self manager];
    MYURLSessionTask *session = [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        NSString *imageFileName = fileName;
        if (fileName == nil || ![fileName isKindOfClass:[NSString class]] || fileName.length == 0) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            imageFileName = [NSString stringWithFormat:@"%@.jpg",str];
        }
        //上传图片 以文件流的格式
        [formData appendPartWithFileData:imageData name:name fileName:imageFileName mimeType:mineType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        }
        [MYNetworkingObject sharedInstance].hud.progress = (CGFloat)(uploadProgress.completedUnitCount) / (CGFloat)uploadProgress.totalUnitCount;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[self allTasks] removeObject:task];
        [self successResponse:responseObject callBack:success];
        if ([self isDebug]) {
            [self longWithSuccessResponse:responseObject url:absolute parameters:parameters];
        }
        if (showView != nil) {
            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[self allTasks] removeObject:task];
        [self handleCallbackWithError:error fail:failure];
        if ([self isDebug]) {
            [self longWithFailError:error url:absolute parameters:nil];
        }
        if (showView != nil) {
            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
        }
        failure(nil);
    }];
    [session resume];
    if (session) {
        [[self allTasks] addObject:session];
    }
    return session;
}

/**
 上传文件操作

 @param url 网址
 @param uploadingFile 待上传文件路径
 @param showView 加载框
 @param progress 进度条
 @param success 成功
 @param failure 失败
 @return 返回
 */
+ (MYURLSessionTask *)uploadFileWithUrl:(NSString *)url
                          uploadingFile:(NSString *)uploadingFile
                               showView:(UIView *)showView
                               progress:(MYUploadProgress)progress
                                success:(MYResponseSuccess)success
                                failure:(MYResponseFail)failure {
    if (my_networkStatus == MYNetworkStatusNotReachable || my_networkStatus == MYNetworkStatusUnknown) {
        SHOW_ALERT(@"网络连接断开,请检查网络!");
        return nil;
    }
    if (showView) {
        [MYNetworkingObject sharedInstance].hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
        [MYNetworkingObject sharedInstance].hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    if ([NSURL URLWithString:uploadingFile] == nil) {
        DTLog(@"uploadingFile无效，无法生成URL。请检查待上传文件是否存在");
        if (showView != nil) {
            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
        }
        failure(nil);
        return nil;
    }
    NSURL *uploadUrl = nil;
    if ([self baseUrl] == nil) {
        uploadUrl = [NSURL URLWithString:url];
    } else {
        uploadUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[self baseUrl],url]];
    }
    if (uploadUrl == nil) {
        DTLog(@"URLString无效，无法生成URL。可能是URL中有中文或特殊字符，请尝试Encode URL");
        if (showView != nil) {
            [MBProgressHUD hideAllHUDsForView:showView animated:YES];
        }
        failure(nil);
        return nil;
    }
    AFHTTPSessionManager *manager = [self manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:uploadUrl];
    MYURLSessionTask *session = nil;
    
    [manager uploadTaskWithRequest:request fromFile:[NSURL URLWithString:uploadingFile] progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        }
        [MYNetworkingObject sharedInstance].hud.progress = (CGFloat)(uploadProgress.completedUnitCount) / (CGFloat)uploadProgress.totalUnitCount;
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [[self allTasks] removeObject:session];
        [self successResponse:responseObject callBack:success];
        if (error) {
            [self handleCallbackWithError:error fail:failure];
            if ([self isDebug]) {
                [self longWithFailError:error url:response.URL.absoluteString parameters:nil];
            }
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
        } else {
            if ([self isDebug]) {
                [self longWithSuccessResponse:responseObject url:response.URL.absoluteString parameters:nil];
            }
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
        }
    }];
    if (session) {
        [[self allTasks] addObject:session];
    }
    return session;
}


/**
 下载文件

 @param url 网址
 @param saveToPath 下载到哪个文件路径
 @param showView 加载框
 @param progress 进度条
 @param success 成功
 @param failure 失败
 @return 返回
 */
+ (MYURLSessionTask *)downloadWithUrl:(NSString *)url
                           saveToPath:(NSString *)saveToPath
                             showView:(UIView *)showView
                             progress:(MYDownloadProgress)progress
                              success:(MYResponseSuccess)success
                              failure:(MYResponseFail)failure {
    
    if (my_networkStatus == MYNetworkStatusNotReachable || my_networkStatus == MYNetworkStatusUnknown) {
        SHOW_ALERT(@"网络连接断开,请检查网络!");
        failure(nil);
        return nil;
    }
    if (showView) {
        [MYNetworkingObject sharedInstance].hud = [MBProgressHUD showHUDAddedTo:showView animated:YES];
        [MYNetworkingObject sharedInstance].hud.mode = MBProgressHUDModeDeterminate;
    }
    if ([self baseUrl] == nil) {
        if ([NSURL URLWithString:url] == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
            return nil;
        }
    } else {
        if ([NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[self baseUrl],url]] == nil) {
            DTLog(@"URLString无效，无法生成URL。可能是URL中有中文，请尝试Encode URL");
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
            return nil;
        }
    }
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFHTTPSessionManager *manager = [self manager];
    MYURLSessionTask *session = nil;
    session = [manager downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount, downloadProgress.totalUnitCount - downloadProgress.completedUnitCount);
        }
        [MYNetworkingObject sharedInstance].hud.progress = (CGFloat)(downloadProgress.completedUnitCount) / (CGFloat)downloadProgress.totalUnitCount;
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:saveToPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [[self allTasks] removeObject:session];
        if (error == nil) {
            if ([self isDebug]) {
                DTLog(@"Download success for url %@",[self absoluteUrlWithPath:url]);
            }
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            if (success) {
                success(filePath.absoluteString);
            }
        } else {
            [self handleCallbackWithError:error fail:failure];
            if ([self isDebug]) {
                DTLog(@"Download fail for url %@, reason : %@",[self absoluteUrlWithPath:url],
                      [error description]);
            }
            if (showView != nil) {
                [MBProgressHUD hideAllHUDsForView:showView animated:YES];
            }
            failure(nil);
        }
    }];
    [session resume];
    if (session) {
        [[self allTasks] addObject:session];
    }
    return session;
}


- (void)finishedRequest:(id)data didFaild:(NSError*)error
{
    if ([self.target respondsToSelector:self.select]) {
        [self.target performSelector:@selector(finishedRequest:didFaild:) withObject:data withObject:error];
    }
}

- (MBProgressHUD *)hud {
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] init];
        //隐藏时从父控件中移除
        _hud.removeFromSuperViewOnHide = YES;
        //YES代表需要蒙版效果
        _hud.dimBackground = YES;
    }
    return _hud;
}


@end

