//
//  MovieCollectionView.h
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieLayout.h"

#define kObservePropertyStr @"currentIndex"

@interface MovieCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *dataArr; //数据源

@property (nonatomic, assign)CGFloat itemWidth; //cell的宽度

@property (nonatomic, assign)NSInteger currentIndex;//


@end
