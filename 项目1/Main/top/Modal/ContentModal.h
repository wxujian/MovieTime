//
//  ContentModal.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModal : NSObject

@property (nonatomic, copy)NSString *userImageUrl;
@property (nonatomic, copy)NSString *nickName;
@property (nonatomic, strong)NSNumber *rating;
@property (nonatomic, copy)NSString *content;

@end
