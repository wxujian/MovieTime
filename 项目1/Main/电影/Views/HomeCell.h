//
//  HomeCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModal.h"
#import "StarView.h"

@interface HomeCell : UITableViewCell
{
    StarView *stView;
}
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, strong)HomeCellModal *modal;//通过这个modal给cell赋值


@end
