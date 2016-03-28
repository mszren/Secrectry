//
//  ViewController.m
//  Secretry
//
//  Created by 我 on 16/3/10.
//  Copyright © 2016年 shenbinbin. All rights reserved.
//

#import "ViewController.h"
#import "NSData+CCCryptUtil.h"
#import "Base64.h"
#import "Descrypt.h"
#import "MD5.h"
#import "RSAEncryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *dataSource = [@"迷失" dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"AES加密 :%@",[dataSource AES256EncryptWithKey:@"123"]);
    NSString *str = [[NSString alloc]initWithData:[[dataSource AES256EncryptWithKey:@"123"] AES256DncryptWithKey:@"123"] encoding:NSUTF8StringEncoding];
    NSLog(@"AES解密 ：%@",str);
    
    NSLog(@"DES加密 :%@",[Descrypt DESEncrypt:dataSource WithKey:@"234"]);
    NSString *str2 = [[NSString alloc]initWithData:[Descrypt DESDecrypt:[Descrypt DESEncrypt:dataSource WithKey:@"234"] WithKey:@"234"] encoding:NSUTF8StringEncoding];
    NSLog(@"DES解密 ：%@",str2);
    
    NSString *baseEncodeString = [Base64 encodeBase64String:@"迷失"];
    NSString *baseDecodeString = [Base64 decodeBase64String:baseEncodeString];
    NSLog(@"Base64加密 :%@",baseEncodeString);
    NSLog(@"Base64解密 :%@",baseDecodeString);
    
    NSLog(@"MD5加密 :%@",[MD5 MD5_scrypt:@"迷失"]);
    
    /**
     *  Base64-Des-Aes
     */
    NSData *commonBase64En = [[Base64 encodeBase64String:@"迷失"] dataUsingEncoding:NSUTF8StringEncoding];
    NSData *commonDesEn = [Descrypt DESEncrypt:commonBase64En WithKey:@"234"];
    NSData *commonAesEn = [commonDesEn AES256EncryptWithKey:@"123"];
    NSLog(@"混合加密 :%@",commonAesEn);
    
    /**
     *  Aes-Des-Base64
     *
     *  @return
     */
    NSData *commonAesDn = [commonAesEn AES256DncryptWithKey:@"123"];
    NSData *commonDesDn = [Descrypt DESDecrypt:commonAesDn WithKey:@"234"];
    NSString *commonBase64Dn = [Base64 decodeBase64Data:commonDesDn];
    NSLog(@"混合解密 :%@",commonBase64Dn);
    
    /**
     *  RSA加密
     *
     *  @return
     */
    RSAEncryptor *rsa = [[RSAEncryptor alloc] init];
    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    [rsa loadPublicKeyFromFile:publicKeyPath];
    NSString *encryptedString = [rsa rsaEncryptString:@"迷失"];
    NSLog(@"RSA加密: %@", encryptedString);
    
    [rsa loadPrivateKeyFromFile:[[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"] password:@"123456"];
    NSString *decryptedString = [rsa rsaDecryptString:encryptedString];
    NSLog(@"RSA解密: %@", decryptedString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
