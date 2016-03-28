//
//  GTMBase64.h
//  Secretry
//
//  Created by 我 on 16/3/10.
//  Copyright © 2016年 shenbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject

+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

@end
