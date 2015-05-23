//
//  ProfileEngine.h
//  JYTry
//
//  Created by huweitao on 14-9-30.
//  Copyright (c) 2014年 huweitao. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface ProfileEngine : MKNetworkEngine

typedef void (^StringBlock)(NSString *str);

-(id) initWithDefaultSettings;

// 得到用户信息
-(MKNetworkOperation*) getUserInfo:(NSString *)phoneNum completionHandler:(StringBlock)completion errorHandler:(MKNKErrorBlock)errorBlock;

@end
