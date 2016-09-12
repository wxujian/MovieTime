//
//  PhotoCollectionViewCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)PhotoScrollView *photoScrollView;
@property (nonatomic, strong)NSString *imgUrl;

@end
