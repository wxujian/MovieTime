//
//  PostView.h
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LargeMovieView.h"
#import "SmallMoviewView.h"

#define kHeiderViewHeight 130
#define kTitleLabelHeight 30

@interface PostView : UIView
{
    UIView *headerView;//头视图
    UIView *largeView;
    UILabel *titleLabelView;
    UIControl *maskViewControl;
    UIView *maskView;
    
    MovieCollectionView *largeMovieView;
    SmallMoviewView *smallMoviewView;
    
    BOOL isSelected;
    
}

@property (nonatomic, strong)NSMutableArray *dataArr;

@end
