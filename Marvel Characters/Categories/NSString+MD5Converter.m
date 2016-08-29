//
//  NSString+MD5Converter.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "NSString+MD5Converter.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5Converter)

-(NSString *)md5{
    
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD2_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD2_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }
    return output;
}

@end
