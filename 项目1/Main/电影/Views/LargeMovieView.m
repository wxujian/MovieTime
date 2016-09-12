//
//  LargeMovieView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "LargeMovieView.h"
#import "LargeMovieCell.h"

static NSString *kLargeMovieViewCellID = @"kLargeMovieViewCellID";

@implementation LargeMovieView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.itemWidth = kScreenWidth * 0.75;
        
        [self registerNib:[UINib nibWithNibName:@"LargeMovieCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kLargeMovieViewCellID];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    LargeMovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLargeMovieViewCellID forIndexPath:indexPath];
    
    cell.modal = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.itemWidth, self.height - 50);
}


@end
