//
//  SmallMoviewCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/14.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "SmallMoviewCell.h"

@implementation SmallMoviewCell

- (void)setModal:(HomeCellModal *)modal {
    
    _modal = modal;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_modal.images[@"small"]] placeholderImage:[UIImage imageNamed:@"pig"]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
