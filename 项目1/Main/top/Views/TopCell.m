//
//  TopCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopCell.h"
#import "StarView.h"

@implementation TopCell

- (void)awakeFromNib {



}

- (void)setModal:(TopModal *)modal {
    
    _modal = modal;
    
    NSURL *url = [NSURL URLWithString:[_modal.imagesDic objectForKey:@"medium"]];
    NSLog(@"%@", _modal.imagesDic);
    [self.postImgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    self.titlelabel.text = _modal.title;
    
    NSNumber *num = [_modal.ratingDic objectForKey:@"average"];
    
    float score = [num floatValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%.1f", score];
    
    StarView *stView = [[[NSBundle mainBundle] loadNibNamed:@"StarView" owner:self options:nil] firstObject];
    
    stView.backgroundColor = [UIColor clearColor];
    
    stView.percent = score/10.0f;
    
    [self.starView addSubview:stView];
    
}

@end
