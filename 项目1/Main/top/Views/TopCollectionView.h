//
//  TopCollectionView.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopCollectionView : UICollectionView<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong)NSArray *dataArr;

@end
