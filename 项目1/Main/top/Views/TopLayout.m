//
//  TopLayout.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopLayout.h"

@implementation TopLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.minimumLineSpacing = kTopSpace;
        self.minimumInteritemSpacing = kTopSpace;
        self.sectionInset = UIEdgeInsetsMake(kTopSpace, kTopSpace, kTopSpace, kTopSpace);
        self.itemSize = CGSizeMake((kScreenWidth - 4*kTopSpace)/3.0, 168);
    }
    return self;
}

@end
