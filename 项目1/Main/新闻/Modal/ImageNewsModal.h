//
//  ImageNewsModal.h
//  项目1
//
//  Created by yuanxuedao on 16/3/11.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageNewsModal : NSObject
/*
 "id": 2244932,
 "image": "http://img31.mtime.cn/pi/2013/02/27/100328.50950850_1280X720.jpg",
 "type": 6
 */

@property (nonatomic, strong)NSNumber *imageID;
@property (nonatomic, copy)NSString *image;
@property (nonatomic, strong)NSNumber *type;

@end
