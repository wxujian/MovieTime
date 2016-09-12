//
//  PhotoCollectionView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoFlowLayout.h"

@implementation PhotoCollectionView



- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"kPhotoCellID"];
        
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr {
    
    _dataArr = dataArr;
    //NSLog(@"-----%@", _dataArr);
}

#pragma mark - UIcollectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _dataArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kPhotoCellID" forIndexPath:indexPath];
    
    cell.imgUrl = _dataArr[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell *)cell;
    //视图消失的时候不再放大
    photoCell.photoScrollView.zoomScale = 1.0f;
}

@end
