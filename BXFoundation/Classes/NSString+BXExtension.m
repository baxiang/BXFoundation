//
//  NSString+BXExtension.m
//  Pods
//
//  Created by baxiang on 2017/6/12.
//
//

#import "NSString+BXExtension.h"
#import "NSData+BXExtension.h"
@implementation NSString (BXExtension)
#pragma mark - Encrypt
+ (NSString *)stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedString];
}
- (NSString *)base64DecodedString
{
    return [NSString stringWithBase64EncodedString:self];
}
- (NSData *)base64DecodedData
{
    return [NSData dataWithBase64EncodedString:self];
}

-(NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted base64EncodedString];
    
    return encryptedString;
}

- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData dataWithBase64EncodedString:self] decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted base64EncodedString];
    
    return encryptedString;
}

- (NSString*)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData dataWithBase64EncodedString:self] decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *) dictionaryValue{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}

@end
