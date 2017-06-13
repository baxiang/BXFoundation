//
//  NSString+BXExtension.h
//  Pods
//
//  Created by baxiang on 2017/6/12.
//
//

#import <Foundation/Foundation.h>

@interface NSString (BXExtension)
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *) dictionaryValue;

#pragma mark - Encrypt
+ (NSString *)stringWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;
- (NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
@end
