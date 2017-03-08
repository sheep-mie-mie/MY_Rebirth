//
//  MY_OpenEyesVoideModel.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

//第二层
@class MY_OpenEyesVoideDailyListModel;
@protocol MY_OpenEyesVoideDailyListModel
@end

//第三层
@class MY_OpenEyesVoideVideoListModel;
@protocol MY_OpenEyesVoideVideoListModel
@end

//第三(1)层
@class MY_OpenEyesVoideProviderModel;
@protocol MY_OpenEyesVoideProviderModel
@end

//第三(2)层
@class MY_OpenEyesVoidePlayInfoModel;
@protocol MY_OpenEyesVoidePlayInfoModel
@end

//第三(2).1层
@class MY_OpenEyesVoidePlayInfoUrlListModel;
@protocol MY_OpenEyesVoidePlayInfoUrlListModel
@end

//第三(3)层
@class MY_OpenEyesVoideConsumptionModel;
@protocol MY_OpenEyesVoideConsumptionModel
@end

//第三(4)层
@class MY_OpenEyesVoideTagsModel;
@protocol MY_OpenEyesVoideTagsModel
@end


//第一层
@interface MY_OpenEyesVoideModel : NSObject
@property (nonatomic, strong) NSArray *dailyList;
@property (nonatomic, copy)   NSString *nextPageUrl;
@property (nonatomic, assign) NSInteger nextPublishTime;
@property (nonatomic, copy)   NSString *newestIssueType;
@end


//第二层
@interface MY_OpenEyesVoideDailyListModel : NSObject
@property (nonatomic, assign) NSInteger date;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, strong) NSArray *videoList;
@end


//第三层
@interface MY_OpenEyesVoideVideoListModel : NSObject
@property (nonatomic, copy)   NSString *dataType;
@property (nonatomic, assign) NSInteger voideId;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *voideDescription;
@property (nonatomic, strong) MY_OpenEyesVoideProviderModel *provider;
@property (nonatomic, copy)   NSString *category;
@property (nonatomic, copy)   NSString *author;
@property (nonatomic, copy)   NSString *playUrl;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, assign) NSInteger releaseTime;
@property (nonatomic, strong) NSArray *playInfo;
@property (nonatomic, strong) MY_OpenEyesVoideConsumptionModel *consumption;
@property (nonatomic, copy)   NSString *campaign;
@property (nonatomic, copy)   NSString *waterMarks;
@property (nonatomic, copy)   NSString *adTrack;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, copy)   NSString *shareAdTrack;
@property (nonatomic, copy)   NSString *favoriteAdTrack;
@property (nonatomic, copy)   NSString *webAdTrack;
@property (nonatomic, assign) NSInteger date;
@property (nonatomic, copy)   NSString *promotion;
@property (nonatomic, copy)   NSString *label;
@property (nonatomic, copy)   NSString *collected;
@property (nonatomic, copy)   NSString *played;
@property (nonatomic, copy)   NSString *coverForFeed;
@property (nonatomic, copy)   NSString *coverForDetail;
@property (nonatomic, copy)   NSString *coverBlurred;
@property (nonatomic, copy)   NSString *coverForSharing;
@property (nonatomic, copy)   NSString *webUrlForWeibo;
@property (nonatomic, copy)   NSString *rawWebUrl;
@end


//第三(1)层
@interface MY_OpenEyesVoideProviderModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *icon;
@end


//第三(2)层
@interface MY_OpenEyesVoidePlayInfoModel : NSObject
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, strong) MY_OpenEyesVoidePlayInfoUrlListModel *urlList;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *url;
@end

//第三(2).1层
@interface MY_OpenEyesVoidePlayInfoUrlListModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@end

//第三(3)层
@interface MY_OpenEyesVoideConsumptionModel : NSObject
@property (nonatomic, assign) NSInteger collectionCount;
@property (nonatomic, assign) NSInteger shareCount;
@property (nonatomic, assign) NSInteger replyCount;
@end

//第三(4)层
@interface MY_OpenEyesVoideTagsModel : NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *actionUrl;
@property (nonatomic, copy)   NSString *adTrack;
@end






