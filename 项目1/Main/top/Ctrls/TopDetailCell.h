//
//  TopDetailCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModal.h"

@interface TopDetailCell : UITableViewCell

@property (nonatomic, strong) ContentModal *modal;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@property (weak, nonatomic) IBOutlet UILabel *nickname;
@end
