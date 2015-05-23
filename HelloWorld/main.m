//
//  main.m
//  HelloWorld
//
//  Created by huweitao on 14-7-11.
//  Copyright (c) 2014年 huweitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Print.h"
#import "PrintOrange.h"
#import "ProfileEngine.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        NSLog(@"On Mac!");
        NSString *originStr=@"88888888-8888-8888-8888-888888888888#@@#3126543#@@#860173013362094#@@#15274884637";
        NSData* originData = [originStr dataUsingEncoding:NSASCIIStringEncoding];
        NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        NSLog(@"encodeResult:%@",encodeResult);
        
        
        NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:encodeResult options:0];
        NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
        NSLog(@"decodeString:%@",decodeStr);
    }
    NSLog(@"%@",[Print printSth:[PrintOrange class]]);
    
    return 0;
}

