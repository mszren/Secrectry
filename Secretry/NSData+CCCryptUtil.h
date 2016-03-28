//
//  NSData+CCCryptUtil.h
//  Secretry
//
//  Created by 我 on 16/3/10.
//  Copyright © 2016年 shenbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(CCCryptUtil)

- (NSData *)AES256EncryptWithKey:(NSString*)key;

- (NSData *)AES256DncryptWithKey:(NSString*)key;

@end
