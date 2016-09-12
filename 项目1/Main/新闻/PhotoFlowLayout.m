//
//  PhotoFlowLayout.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PhotoFlowLayout.h"

@implementation PhotoFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
        
        self.itemSize = CGSizeMake(kScreenWidth+kPhotoImageWidthWithImage, kScreenHeight);
    }
    return self;
}

@end
