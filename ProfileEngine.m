//
//  ProfileEngine.m
//  JYTry
//
//  Created by huweitao on 14-9-30.
//  Copyright (c) 2014年 huweitao. All rights reserved.
//

#import "ProfileEngine.h"

@implementation ProfileEngine

-(id) initWithDefaultSettings
{
    NSMutableDictionary *headerDict = [NSMutableDictionary dictionaryWithCapacity:6];

        headerDict[@"Authorization"] = [@"Token " stringByAppendingString:@"\"IhpwrkNRyv1CCwpRC/t+fYg0hJP4t3e+Jz/x63nFat0Tkh6IW0EWPNC3GEQxHL1P4V3ILSumVSD/qtkg6FMpRpSRF3qgxZoFWo6mW5mO+grayg8XQcXo3yjDyhblKrSLcX1qFe3/4S35wMDOQlFhU69dMlyouLZHWHkkVWW1+4s=\""];

    headerDict[@"Platform"] = [NSString stringWithFormat:@"%d",4];
    headerDict[@"PlatformName"] = @"ApplePhone";
    headerDict[@"DeviceID"] = @"fde0386572ebea5d083c08bf01d05b520b1139c0";
    //版本号
    headerDict[@"Version"] = @"1.0";
    headerDict[@"VersionName"] = @"ystudy1.0";
    //机器号
    headerDict[@"FINGERPRINT"] = @"Simulator/iOS 7.1";
    headerDict[@"x-client-identifier"] = @"iOS";
    //headerDict[@"Accept-Encoding"] = @"gzip, deflate";
    
    if(self = [super initWithHostName:@"api.jyeoo.com" customHeaderFields:headerDict]) {
        //[self useCache];
        DLog(@"USerInfo:%@",headerDict);
    }
    return self;
}


// 得到用户信息

-(MKNetworkOperation*) getUserInfo:(NSString *)phoneNum completionHandler:(StringBlock)completion errorHandler:(MKNKErrorBlock)errorBlock
{
    NSString *path = @"Profile/Info";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:nil
                                          httpMethod:@"POST"];
    DLog(@"Request Info: %@",[op description]);
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         //NSString *valueString = [completedOperation responseString];
         NSError *err = nil;
         DLog(@"JSONString %@",[completedOperation responseString]);
         NSDictionary *dict = [completedOperation responseJSON];
         if (err) NSLog(@"Get UserInfo Error:%@ code:%ld",[err description],(long)err.code);
         DLog(@"UserInfo:\n%@",dict);
         
     }errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

@end