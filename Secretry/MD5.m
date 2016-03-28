//
//  MD5.m
//  Secretry
//
//  Created by 我 on 16/3/11.
//  Copyright © 2016年 shenbinbin. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5

+ (NSString *)MD5_scrypt:(NSString *)md5hex{
    
    const char *str = [md5hex UTF8String];
    unsigned char res[16];
    CC_MD5(str, (int)strlen(str), res);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",         res[0],res[1],res[2],res[3],
        res[4],res[5],res[6],res[7],
        res[8],res[9],res[10],res[11],
        res[12],res[13],res[14],res[15]];
}
@end
