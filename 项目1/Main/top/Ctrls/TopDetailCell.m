//
//  TopDetailCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopDetailCell.h"

@implementation TopDetailCell

- (void)awakeFromNib {
 
    self.userImage.layer.cornerRadius = 8;
    self.backView.layer.cornerRadius = 8;
    [self refreshUI];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModal:(ContentModal *)modal {
    
    _modal = modal;
    
    [self refreshUI];
}

- (void)refreshUI {
    
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:_modal.userImageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    self.nickname.text = _modal.nickName;
    self.rating.text = [NSString stringWithFormat:@"%.1f", [_modal.rating floatValue]];

    self.contentLabel.text = _modal.content;

    //自动布局之后要获取UIView的正确frame需要调用UIView的layoutIfNeeded方法
    [_contentLabel layoutIfNeeded];
    NSLog(@"===%f", _contentLabel.width);

}


@end
