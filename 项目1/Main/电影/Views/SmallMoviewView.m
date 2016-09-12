//
//  SmallMoviewView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/14.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "SmallMoviewView.h"
#import "SmallMoviewCell.h"
#import "SmallLayout.h"

static NSString *kSmallMoviewViewCellID = @"kSmallMoviewViewCellID";

@implementation SmallMoviewView
{
    BOOL animationFlag;
    
}


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.itemWidth =  70;
        
        [self registerNib:[UINib nibWithNibName:@"SmallMoviewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kSmallMoviewViewCellID];
        
        animationFlag = YES;
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    SmallMoviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSmallMoviewViewCellID forIndexPath:indexPath];
    
    cell.modal = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    
    
    
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0) {
    
    MovieLayout *layout = [[SmallLayout alloc] init];
    
    NSLog(@"]]]]%f", layout.minimumLineSpacing);
    
    CGFloat offsetX = targetContentOffset->x;
    NSLog(@"＝＝＝＝＝%f %f", offsetX, self.itemWidth +     layout.minimumLineSpacing);
    
    
    
    //单元格的宽度加上行间距的宽度当成页码的宽度
    NSInteger pageWidth = self.itemWidth + layout.minimumLineSpacing;
    
    //页码的计算
    NSInteger pageNum = (offsetX + pageWidth/2)/pageWidth;
    NSLog(@"pageNum = %ld", pageNum);
    NSLog(@"velocity = %@", NSStringFromCGPoint(velocity));
    
    //v.x>0就是右移，否则左移
    pageNum = velocity.x == 0 ? pageNum :((velocity.x>0 && velocity.x<=1.0) ? pageNum+1 : (velocity.x>1.0f ? pageNum+2 : pageNum-1));
    pageNum = MIN(MAX(pageNum, 0), self.dataArr.count-1);
    
    NSLog(@"----%f", velocity.x);
    
    NSLog(@"pageNum = %ld", pageNum);
    
    targetContentOffset->x = (layout.minimumLineSpacing + self.itemWidth)*pageNum;
    
    self.currentIndex = pageNum;
    
    animationFlag = YES;
    
    
}

@end
