//
//  HomeCellModal.h
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeCellModal : NSObject

@property (nonatomic, strong)NSDictionary *ratingDic;   //评分
@property (nonatomic, copy)NSString *title;             //标题
@property (nonatomic, copy)NSString *original_title;    //原标题
@property (nonatomic, copy)NSString *year;              //时间
@property (nonatomic, strong)NSDictionary *images;      //图片

@end
