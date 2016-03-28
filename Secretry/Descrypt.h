//
//  Descrypt.h
//  Secretry
//
//  Created by 我 on 16/3/11.
//  Copyright © 2016年 shenbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Descrypt : NSObject

+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;
@end
