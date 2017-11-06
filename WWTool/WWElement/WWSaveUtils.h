//
//  WWSaveUtils.h
//  WWTool
//
//  Created by 王伟 on 2017/11/6.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWSaveUtils : NSObject

#pragma  mark - NSUserDefaults存取操作

/*
 针对的类型
 NSData
 NSString
 NSNumber
 NSDate
 NSArray
 NSDictionary
 
 A default object must be a property list—that is, an instance of (or for collections, a combination of instances of) NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary.
 The UserDefaults class is thread-safe.
 https://developer.apple.com/documentation/foundation/userdefaults
 */

+(void)saveBool:(BOOL)value forKey:(NSString *)key;
+(void)saveFloat:(NSInteger)value forKey:(NSString *)key;
+(void)saveDouble:(NSInteger)value forKey:(NSString *)key;
+(void)saveInt:(NSInteger)value forKey:(NSString *)key;
+(void)saveData:(NSData *)data forKey:(NSString *)key;
+(void)saveDate:(NSDate *)date forKey:(NSString *)key;
+(void)saveString:(NSString *)str forKey:(NSString *)key;
+(void)saveDic:(NSDictionary *)dic forKey:(NSString *)key;
+(void)saveArr:(NSArray *)arr forKey:(NSString *)key;
+(void)saveURL:(NSURL *)value forKey:(NSString *)key;

+(BOOL)getBoolWithKey:(NSString *)key;
+(double)getDoubleWithKey:(NSString *)key;
+(float)getFloatWithKey:(NSString *)key;
+(NSInteger )getIntWithKey:(NSString *)key;
+(NSDate *)getDateWithKey:(NSString *)key;
+(NSData *)getDataWithKey:(NSString *)key;
+(NSString *)getStringWithKey:(NSString *)key;
+(NSDictionary *)getDicWithKey:(NSString *)key;
+(NSArray *)getArrWithKey:(NSString *)key;
+ (NSURL *)getURLWithKey:(NSString *)key;

+(void)saveValue:(id)value forKey:(NSString *)key;
+(id)getValueWithKey:(NSString *)key;

+(void)removeValueWithKey:(NSString *)key;


@end
