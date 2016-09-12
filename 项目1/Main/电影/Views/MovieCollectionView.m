//
//  MovieCollectionView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "MovieCollectionView.h"
#import "LargeMovieCell.h"
#import "LargeMovieView.h"
#import "LargeLayout.h"

@implementation MovieCollectionView
{
    BOOL animationFlag;
    LargeMovieCell *cell;
}
- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        animationFlag = YES;
        
        self.delegate = self;
        self.dataSource = self;
        
        
        //设置减速速率
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    return  self;
}

#pragma mark -  UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(_itemWidth, self.height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, (kScreenWidth-_itemWidth)/2.0f, 0, (kScreenWidth-_itemWidth)/2.0f);
}

//点击单元格翻转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (_currentIndex != indexPath.row){

    //点击cell响应
 
        //如果点击的不是居中的cell，那么就滚动到中间
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //给当前页码赋值，让观察者能够响应
        self.currentIndex = indexPath.row;
        
    }else{
        //如果点击的是居中的，就翻转
        NSLog(@"翻转");
        
        cell = (LargeMovieCell*)[collectionView cellForItemAtIndexPath:indexPath];
        
        animationFlag = !animationFlag;

        UIViewAnimationTransition animationTransition = animationFlag ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight;
        
        
//        [cell exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        
//        UIView *view = animationFlag ? cell.DetailView : cell.imgView;
//        NSLog(@"++++%@", view);
//        [cell sendSubviewToBack:view];
        
        if ([collectionView isKindOfClass:[LargeMovieView class]]) {
            
            [UIView animateWithDuration:.5 animations:^{
                
                [UIView setAnimationTransition:animationTransition forView:cell cache:YES];
                
                cell.imgView.hidden = !animationFlag;
                [cell configDetailView];
            }];

        }
        
        
    
    }
}



//
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0) {

    MovieLayout *layout = [[LargeLayout alloc] init];
  
    NSLog(@"]]]]%f", layout.minimumLineSpacing);
    
    CGFloat offsetX = targetContentOffset->x;
    NSLog(@"＝＝＝＝＝%f %f", offsetX, _itemWidth + layout.minimumLineSpacing);
    

    //单元格的宽度加上行间距的宽度当成页码的宽度
    NSInteger pageWidth = _itemWidth + layout.minimumLineSpacing;
    
    //页码的计算
    NSInteger pageNum = (offsetX + pageWidth/2)/pageWidth;
//    NSLog(@"pageNum = %ld", pageNum);
//    NSLog(@"velocity = %@", NSStringFromCGPoint(velocity));
//    
    //v.x>0就是右移，否则左移
    pageNum = velocity.x == 0 ? pageNum :((velocity.x>0 && velocity.x<=1.0) ? pageNum+1 : (velocity.x>1.0f ? pageNum+2 : pageNum-1));
    pageNum = MIN(MAX(pageNum, 0), self.dataArr.count-1);
    
//    NSLog(@"----%f", velocity.x);
    
//    NSLog(@"pageNum = %ld", pageNum);

    targetContentOffset->x = (layout.minimumLineSpacing + _itemWidth)*pageNum;
    
    self.currentIndex = pageNum;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        cell.imgView.hidden = NO;
        
    }];
    
    animationFlag = YES;
    
    
}

//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (_currentIndex != indexPath.row) {
//        //如果点击的不是居中的cell，那么就滚动到中间
//        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//        
//        //给当前页码赋值，让观察者能够响应
//        self.currentIndex = indexPath.row;
//    
//}
//}

#define mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSInteger index = [change[@"new"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (_currentIndex != index) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = index;
        
        NSLog(@"%ld", index);
    }
    
}

- (void)setDataArr:(NSArray *)dataArr {
    
    _dataArr = dataArr;
}

@end
