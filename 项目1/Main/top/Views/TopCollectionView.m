//
//  TopCollectionView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopCollectionView.h"
#import "TopCell.h"
#import "TopDetailViewController.h"

@implementation TopCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerNib:[UINib nibWithNibName:@"TopCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"kTopCellID"];
        
    }
    return self;
}

#pragma mark - UICollectionView datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kTopCellID" forIndexPath:indexPath];
    
    cell.modal = _dataArr[indexPath.row];
    
    return cell;
    
}

#pragma mark - UICollectionView delegate


- (void)setDataArr:(NSArray *)dataArr {
    
    _dataArr = dataArr;
}

@end
