//
//  NSData+LGMD5.m
//  MD5
//
//  Created by liaojihong on 2018/4/11.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "NSData+LGMD5.h"

#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_LENGTH 16

@implementation NSData (LGMD5)

+ (NSString *)fileMD5:(NSData *)fileData
{
    unsigned char result[CC_MD5_LENGTH];
    CC_MD5(fileData.bytes, (CC_LONG)fileData.length, result);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_LENGTH * 2];
    for( int i = 0; i < CC_MD5_LENGTH; i++ )
    {
        [output appendFormat:@"%02x", result[i]];
    }
    return output;
}

@end
