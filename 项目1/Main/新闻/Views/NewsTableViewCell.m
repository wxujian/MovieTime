//
//  NewsTableViewCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/10.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "NewsTableViewCell.h"





@implementation NewsTableViewCell

- (void)awakeFromNib {


}

/*
 newsModal
 
 @property(nonatomic, assign)NSNumber *type;
 @property(nonatomic, copy)NSString *title;
 @property(nonatomic, copy)NSString *summary;
 @property(nonatomic, copy)NSString *imageUrl;
 */
- (void)setModal:(NewsModal *)modal {
    
    _modal = modal;
    
    NSURL *url = [NSURL URLWithString:_modal.imageUrl];
    [self.postImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    self.titlelabel.text = _modal.title;
    self.detailView.text = _modal.summary;

    
    NSInteger type = [_modal.type integerValue];
    
    if (type == 0) {
        self.typeimageView.image = nil;
        
    } else if (type == 1) {
        self.typeimageView.image = [UIImage imageNamed:@"sctpxw"];
        
    } else if (type == 2) {
        self.typeimageView.image = [UIImage imageNamed:@"scspxw"];
    }
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
