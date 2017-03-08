//
//  MYNetworkingManager.h
//  iFlyKD_iFly
//
//  Created by ifly on 2017/1/18.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 网络请求基类
 */
@class MYNetworkingObject;
@protocol MYNetworkingObject
@end

#pragma mark - ========== Block / Delegate / 枚举 ============
#pragma mark - ==== 宏定义 =======
// 项目打包上线都不会打印日志，因此可放心。
#ifdef DEBUG
#define DTLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DTLog(s, ... )
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];



#pragma mark----------------// 枚举 bolck \\----------------
#pragma mark----//枚举\\----
/**
 请求类型
 */
typedef NS_ENUM(NSInteger, MYNetworkType) {
    //GET请求
    MYNetworkTypeGET = 1,
    //POST请求
    MYNetworkTypePOST
};

/**
 响应数据类型枚举
 */
typedef NS_ENUM(NSInteger, MYResponseType) {
    //默认JSON类型
    MYResponseTypeJSON = 1,
    //XML类型
    MYResponseTypeXML,
    // 特殊情况下，一转换服务器就无法识别的，默认会尝试转换成JSON，若失败则需要自己去转换
    MYResponseTypeData,
};

/**
 请求数据类型枚举
 */
typedef NS_ENUM(NSInteger, MYRequestType) {
    //默认JSON类型
    MYRequestTypeJSON = 1,
    //普通text/html类型
    MYRequestTypePlainText,
};

/**
 网络状态枚举
 */
typedef NS_ENUM(NSInteger, MYNetworkStatus) {
    //未知网络
    MYNetworkStatusUnknown          = -1,
    //网络无法连接
    MYNetworkStatusNotReachable,
    //2.3.4G网络
    MYNetworkStatusReachableViaWWAN,
    //WiFi网络
    MYNetworkStatusReachableViaWiFi,
};

#pragma mark----//block\\----

/**
 检测网络状态的block
 @param status 网络状态
 */
typedef void(^MYNetworkStatusBlock)(MYNetworkStatus status);

/**
 下载进度
 @param bytesRead 已下载的大小
 @param totalBytesRead 文件总大小
 @param totalBytesExpectedToRead 剩余多少下载
 */
typedef void(^MYDownloadProgress)(int64_t bytesRead,
int64_t totalBytesRead,
int64_t totalBytesExpectedToRead);

typedef MYDownloadProgress MYGetProgress;
typedef MYDownloadProgress MYPostProgress;

/**
 上传进度
 @param bytesWritten 已上传大小
 @param totalBytesWritten 总上传大小
 */
typedef void(^MYUploadProgress)(int64_t bytesWritten, int64_t totalBytesWritten);


@class NSURLSessionTask;
/**
 *请勿直接使用NSURLSessionDataTask,以减少对第三方的依赖
 *所有接口返回的类型都是基类NSURLSessionTask，若要接收返回值
 *且处理，请转换成对应的子类类型
 */
typedef NSURLSessionTask MYURLSessionTask;
typedef void(^MYResponseSuccess)(id returnData);
typedef void(^MYResponseFail)(NSError *error);


#pragma mark----------------// 代理 \\----------------
/**
 请求封装的代理协议
 */
@protocol MYNetworkDelegate <NSObject>

@optional

/**
 请求完成
 @param returnData 返回数据
 */
- (void)requestDidFinishLoading:(id)returnData;

/**
 请求失败
 @param error 错误
 */
- (void)requestDidFailWithError:(NSError *)error;

/**
 网络请求即将被移除
 @param itme 网络请求项
 */
- (void)networkWillDealloc:(MYURLSessionTask *)itme;

@end


#pragma mark----------------// 网络请求管理者 \\----------------
#pragma mark----//网络请求管理者\\----
@interface MYNetworkingManager : NSObject

#pragma mark----//Get请求\\----
/**
 GET请求 通过Block回调
 @param url 网址
 @param parameters 入参
 @param success 成功
 @param failure 失败
 @param progress 进度
 @param refreshCache 是否刷新缓存。由于请求成功也可能没有数据，对于业务失败，只能通过人为手动判断
 @param showView showView为nil时 则不显示 不为nil时则显示加载框
 */
+ (void)getRequestWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                  success:(MYResponseSuccess)success
                  failure:(MYResponseFail)failure
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView;


/**
 GET请求 通过delegate回调
 @param url 网址
 @param parameters 入参
 @param delegate delegate
 @param progress 进度
 @param refreshCache 是否刷新缓存
 @param showView 加载框
 */
+ (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parameters
                 delegate:(id<MYNetworkDelegate>)delegate
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView;

/**
 GET请求 通过target回调方法
 @param url 网址
 @param parameters 入参
 @param target target
 @param action action
 @param progress 进度
 @param refreshCache 是否刷新缓存
 @param showView 加载框
 */
+ (void)getRequestWithUrl:(NSString *)url
               parameters:(NSDictionary *)parameters
                   target:(id)target
                   action:(SEL)action
                 progress:(MYGetProgress)progress
             refreshCache:(BOOL)refreshCache
                 showView:(UIView *)showView;

#pragma mark----//Post请求\\----

/**
 POST请求 通过Block回调
 @param url 网址
 @param parameters 入参
 @param success 成功
 @param failure 失败
 @param progress 进度
 @param refreshCache 是否刷新缓存。由于请求成功也可能没有数据，对于业务失败，只能通过人为手动判断
 @param showView showView为nil时 则不显示 不为nil时则显示加载框
 */
+ (void)postRequestWithURL:(NSString *)url
                parameters:(NSDictionary *)parameters
                   success:(MYResponseSuccess)success
                   failure:(MYResponseFail)failure
                  progress:(MYGetProgress)progress
              refreshCache:(BOOL)refreshCache
                  showView:(UIView *)showView;


/**
 POST请求 通过delegate回调
 @param url 网址
 @param parameters 入参
 @param delegate delegate
 @param progress 进度
 @param refreshCache 是否刷新缓存
 @param showView 加载框
 */
+ (void)postRequestWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                  delegate:(id<MYNetworkDelegate>)delegate
                  progress:(MYGetProgress)progress
              refreshCache:(BOOL)refreshCache
                  showView:(UIView *)showView;

/**
 POST请求 通过target回调方法
 @param url 网址
 @param parameters 入参
 @param target target
 @param action action
 @param progress 进度
 @param refreshCache 是否刷新缓存
 @param showView 加载框
 */
+ (void)postRequestWithUrl:(NSString *)url
                parameters:(NSDictionary *)parameters
                    target:(id)target
                    action:(SEL)action
                  progress:(MYGetProgress)progress
              refreshCache:(BOOL)refreshCache
                  showView:(UIView *)showView;

@end


#pragma mark----------------// 网络请求基类 \\----------------
#pragma mark----//网络请求基类\\----
@interface MYNetworkingObject : NSObject

/**
 单利
 @return MYNetworkingObject对象单利
 */
+ (MYNetworkingObject *)sharedInstance;

/**
 网络请求delegate
 */
@property (nonatomic, assign) id <MYNetworkDelegate>delegate;

/**
 target
 */
@property (nonatomic, assign) id target;

/**
 action
 */
@property (nonatomic, assign) SEL select;


#pragma mark----------------// 创建一个网络请求 \\----------------

/**
 创建一个网络请求 开始请求网络
 @param networkType  网络请求方式
 @param url          url
 @param parameters   入参
 @param refreshCache 是否获取缓存 无网络或者获取数据失败则获取本地缓存数据
 @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 @param target       对象
 @param action       事件
 @param hashValue    网络请求的委托delegate的唯一标示
 @param showView     showView为nil时 则不显示 showView不为nil时则显示加载框
 @param progress     请求成功后的progress进度
 @param success      成功
 @param failure      失败
 @return             数据
 */
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
                           failure:(MYResponseFail)failure;


/**
 上传图片 若不指定baseUrl 可上传完整的url
 @param image      图片
 @param url        网址
 @param fileName   给图片起一个名字，默认为当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 @param name       与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 @param mineType   默认为image/jpeg
 @param parameters 入参
 @param showView   加载框
 @param progress   进度
 @param success    成功
 @param failure    失败
 @return 返回数据
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
                              failure:(MYResponseFail)failure;


/**
 上传文件
 @param url           网址
 @param uploadingFile 上传文件/路劲
 @param showView      加载框
 @param progress      进度
 @param success       成功
 @param failure       失败
 @return 返回数据
 */
+ (MYURLSessionTask *)uploadFileWithUrl:(NSString *)url
                          uploadingFile:(NSString *)uploadingFile
                               showView:(UIView *)showView
                               progress:(MYUploadProgress)progress
                                success:(MYResponseSuccess)success
                                failure:(MYResponseFail)failure;

/**
 下载文件
 @param url         网址
 @param saveToPath  下载到哪个路劲
 @param showView    加载框
 @param progress    进度
 @param success     成功
 @param failure     失败
 @return 返回数据
 */
+ (MYURLSessionTask *)downloadWithUrl:(NSString *)url
                           saveToPath:(NSString *)saveToPath
                             showView:(UIView *)showView
                             progress:(MYDownloadProgress)progress
                              success:(MYResponseSuccess)success
                              failure:(MYResponseFail)failure;


/**
 监听网络变化
 @param statusBlock 返回网络状态类型枚举
 */
+ (void)startMonitoringNetworkStatus:(MYNetworkStatusBlock)statusBlock;


/**
 用于指定网络请求接口的基础url，如：
 http://henishuo.com或者http://101.200.209.244
 通常在AppDelegate中启动时就设置一次就可以了。如果接口有来源
 于多个服务器，可以调用更新
 @param baseUrl 网络接口的基础url
 */
+ (void)updateBaseUrl:(NSString *)baseUrl;
+ (NSString *)baseUrl;


/**
 项目中默认的网络缓存路径,也可以当做项目中的缓存路线,根据需求自行设置
 默认路径是(GDHNetworkCaches)
 格式是:@"Documents/GDHNetworkCaches",只需要字符串即可。
 @param baseCache 默认路径是(MYNetworkCaches)
 */
+ (void)updateBaseCacheDocuments:(NSString *)baseCache;


/**
 项目中默认的网络缓存路径,也可以当做项目中的缓存路线,根据需求自行设置
 @return 格式是:@"Documents/GDHNetworkCaches"
 */
+ (NSString *)baseCache;


/**
 设置请求超时时间，默认为60秒
 @param timeOut 超时时间
 */
+ (void)setTimeOut:(NSTimeInterval)timeOut;


/**
 当检查到网络异常时，是否从从本地提取数据。默认为NO。一旦设置为YES,当设置刷新缓存时，
 若网络异常也会从缓存中读取数据。同样，如果设置超时不回调，同样也会在网络异常时回调，除非
 本地没有数据！
 @param shouldObtain YES/NO
 */
+ (void)obtainDataFromLocalWhenNetworkUnconnected:(BOOL)shouldObtain;


/**
 默认只缓存GET请求的数据，对于POST请求是不缓存的。如果要缓存POST获取的数据，需要手动调用设置
 对JSON类型数据有效，对于PLIST、XML不确定！
 @param isCacheGet      默认YES
 @param shouldCachePost 默认NO
 */
+ (void)cacheGetRequest:(BOOL)isCacheGet shouldCachePost:(BOOL)shouldCachePost;


/**
 获取缓存大小/bytes

 @return 缓存大小
 */
+ (unsigned long long)totalCacheSize;


/**
 默认不会自动清除缓存，如果需要，可以设置自动清除缓存，并且需要指定上限。当指定上限>0M时，
 若缓存达到了上限值，则每次启动应用则尝试自动去清理缓存。
 @param mSize 缓存上限大小 单位(兆) 默认为0 表示不清理
 */
+ (void)autoToClearCacheWithLimitedToSize:(NSUInteger)mSize;


/**
 清除缓存
 @return YES/NO
 */
- (BOOL)clearCaches;


/**
 开启或关闭接口打印信息
 @param isDebug 开发期最好打开 默认关闭
 */
+ (void)enableInterfaceDebug:(BOOL)isDebug;


/**
 配置请求格式，默认为JSON。如果要求传XML或者PLIST，请在全局配置一下
 @param requestType 请求格式 默认是JSON
 @param responseType 响应格式 默认是JSON
 @param shouldAutoEncode YES or NO,默认为NO，是否自动encode url
 @param shouldCallBackOnCancelRequest 当取消请求时，是否要回调，默认为YES
 */
+ (void)configRequestType:(MYRequestType)requestType
             responseType:(MYResponseType)responseType
      shouldAutoEncodeUrl:(BOOL)shouldAutoEncode
  callBackOnCancelRequest:(BOOL)shouldCallBackOnCancelRequest;


/**
 配置公共的请求头，只调用一次即可，通常放在应用启动的时候配置就可以了
 @param httpHeaders 只需要将与服务器商定的固定参数设置即可
 */
+ (void)configCommonHttoHeaders:(NSDictionary *)httpHeaders;


/**
 取消所有请求
 */
+ (void)cancelAllRequest;


/**
 取消某个请求。如果是要取消某个请求，最好是引用接口所返回来的HYBURLSessionTask对象，
 然后调用对象的cancel方法。如果不想引用对象，这里额外提供了一种方法来实现取消某个请求
 @param url URL，可以是绝对URL，也可以是path（也就是不包括baseurl）
 */
+ (void)cancelRequestWithUrl:(NSString *)url;



@end


