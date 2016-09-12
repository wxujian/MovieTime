//
//  BaseModal.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "BaseModal.h"

@implementation BaseModal

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
     
        [self buildRelationShip:dic];
    }
    return self;
}

- (SEL)changeKeyToSetKey:(NSString *)key {
    
    NSString *firstLetter = [[key substringToIndex:1] uppercaseString];
    NSString *otherStr = [key substringFromIndex:1];
    NSString *setterStr = nil;
    
    if ([key isEqualToString:@"id"]) {
        setterStr = [NSString stringWithFormat:@"set%@%@%@", NSStringFromClass([self class]), firstLetter, otherStr];
        
    }else {
        
        setterStr = [NSString stringWithFormat:@"set%@%@", firstLetter, otherStr];
    }
    
    SEL method = NSSelectorFromString(setterStr);
    NSLog(@"==============%@", setterStr);
    return method;
}

- (void)buildRelationShip:(NSDictionary *)dic {
    
    NSArray *allKeys = [dic allKeys];
    
    for (NSString *key in allKeys) {
        
        SEL method = [self changeKeyToSetKey:key];
        id value = [dic objectForKey:key];
        if ([self respondsToSelector:method]) {
            
            [self performSelector:method withObject:value];
        }
    }
    
}

@end
