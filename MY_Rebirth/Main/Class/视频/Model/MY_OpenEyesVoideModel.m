//
//  MY_OpenEyesVoideModel.m
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "MY_OpenEyesVoideModel.h"
//第一层
@implementation MY_OpenEyesVoideModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"dailyList":@"MY_OpenEyesVoideDailyListModel"};
}
@end
//第二层
@implementation MY_OpenEyesVoideDailyListModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"videoList":@"MY_OpenEyesVoideVideoListModel"};
}
@end
//第三层
@implementation MY_OpenEyesVoideVideoListModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"playInfo":@"MY_OpenEyesVoidePlayInfoModel",
             @"tags":@"MY_OpenEyesVoideTagsModel"};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"voideId":@"id",
             @"voideDescription":@"description"};
}
@end
//第三(1)层
@implementation MY_OpenEyesVoideProviderModel

@end
//第三(2)层
@implementation MY_OpenEyesVoidePlayInfoModel

@end
//第三(2).1层
@implementation MY_OpenEyesVoidePlayInfoUrlListModel

@end
//第三(3)层
@implementation MY_OpenEyesVoideConsumptionModel

@end
//第三(4)层
@implementation MY_OpenEyesVoideTagsModel

@end







