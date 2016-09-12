//
//  PhotoCollectionViewCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self createScrollView];
        
    }
    return self;
}


- (void)createScrollView {
    
    _photoScrollView = [[PhotoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    
    [self.contentView addSubview:_photoScrollView];
}

- (void)setImgUrl:(NSString *)imgUrl {
    
    _imgUrl = imgUrl;
    
    _photoScrollView.imgUrl = _imgUrl;
}

@end
