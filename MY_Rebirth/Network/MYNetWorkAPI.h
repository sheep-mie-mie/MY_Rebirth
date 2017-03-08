//
//  MYNetWorkAPI.h
//  MY_Rebirth
//
//  Created by ifly on 2017/2/17.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MY_OpenEyesVoideModel.h"

@interface MYNetWorkAPI : NSObject


/**1
 获取开眼App数据

 @param success 成功
 @param failure 失败
 */
+ (void)loadOpenEyesInformationDataWithSuccess:(void(^)(MY_OpenEyesVoideModel *result))success
                                       failure:(void(^)(NSError *error))failure
                                      showView:(UIView *)showView;



























@end
