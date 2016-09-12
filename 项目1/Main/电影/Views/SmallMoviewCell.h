//
//  SmallMoviewCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/14.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModal.h"

@interface SmallMoviewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property(nonatomic, strong) HomeCellModal *modal;

@end
