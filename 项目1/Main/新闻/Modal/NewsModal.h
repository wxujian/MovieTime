//
//  NewsModal.h
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModal : NSObject

/*
 {
 "newsid" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }
 */

@property(nonatomic, assign)NSNumber *type;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *summary;
@property(nonatomic, copy)NSString *imageUrl;

@end
