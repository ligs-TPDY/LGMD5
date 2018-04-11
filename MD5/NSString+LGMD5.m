//
//  NSString+LGMD5.m
//  MD5
//
//  Created by liaojihong on 2018/4/11.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "NSString+LGMD5.h"

#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_LENGTH 16

@implementation NSString (LGMD5)

+ (NSString *)stringMD5:(NSString *)string
{
    const char* original_str = [string UTF8String];
    unsigned char result[CC_MD5_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_LENGTH * 2];
    for( int i = 0; i < CC_MD5_LENGTH; i++ )
    {
        [output appendFormat:@"%02x", result[i]];
    }
    return output;
}

@end
