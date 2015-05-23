//
//  Print.m
//  HelloWorld
//
//  Created by huweitao on 14-9-29.
//  Copyright (c) 2014年 huweitao. All rights reserved.
//

#import "Print.h"

@implementation Print

+(NSString *)printSth:(Class)sth
{
    return [@"print " stringByAppendingString:[sth getSomething]];
}

+(NSString *)getSomething
{
    return @"Nothing!";
}

@end
