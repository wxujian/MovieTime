//
//  LargeMovieCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "LargeMovieCell.h"
#import "StarView.h"

@implementation LargeMovieCell

{
    StarView *stView;
}

-(void)awakeFromNib {
    
   stView = [[[NSBundle mainBundle] loadNibNamed:@"StarView" owner:self options:nil] firstObject];
    stView.frame = CGRectMake(0, 0, 30*5, 30);
    stView.backgroundColor = [UIColor clearColor];

    [self.starView addSubview:stView];
}

- (void)setModal:(HomeCellModal *)modal {
    
    _modal = modal;
    
    self.imgView.userInteractionEnabled = YES;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_modal.images[@"large"]] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
}

- (void)configDetailView {
    
    [self.postImagView sd_setImageWithURL:[NSURL URLWithString:[_modal.images objectForKey:@"medium"]]placeholderImage:[UIImage imageNamed:@"pig"]];
    
    self.chineseName.text = _modal.title;
    self.sourceName.text = _modal.original_title;
    self.year.text = [NSString stringWithFormat:@"%@", _modal.year];
    self.rate.text = [NSString stringWithFormat:@"%@", [_modal.ratingDic objectForKey:@"average"]];
    
    stView.percent = [[_modal.ratingDic objectForKey:@"average"] floatValue] / 10.0f;
    
    
    
}

@end
