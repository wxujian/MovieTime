//
//  LargeMovieCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModal.h"

@interface LargeMovieCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *DetailView;

//详细视图的属性
@property (weak, nonatomic) IBOutlet UILabel *sourceName;
@property (weak, nonatomic) IBOutlet UIImageView *postImagView;
@property (weak, nonatomic) IBOutlet UILabel *chineseName;
@property (weak, nonatomic) IBOutlet UILabel *rate;

@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UIView *starView;

@property (nonatomic, strong) HomeCellModal *modal;

- (void)configDetailView;

@end
