//
//  HomeCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    
    stView = [[[NSBundle mainBundle] loadNibNamed:@"StarView" owner:self options:nil] firstObject];
    stView.frame = CGRectMake(90, 45, 30*5, 30);
    stView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:stView];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



/*
 @property (weak, nonatomic) IBOutlet UIImageView *postView;
 @property (weak, nonatomic) IBOutlet UILabel *titleLabel;
 @property (weak, nonatomic) IBOutlet UIView *starView;
 @property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
 @property (weak, nonatomic) IBOutlet UILabel *timeLabel;

 */


- (void)setModal:(HomeCellModal *)modal {
    
    _modal = modal;

    NSString *path = [_modal.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:path];
    
    [_postView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _titleLabel.text = _modal.title;
//    _scoreLabel.text = [[_modal.ratingDic objectForKey:@"average"] stringValue];;
    
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f", [[_modal.ratingDic objectForKey:@"average"] floatValue]];
    
    _timeLabel.text = _modal.year;
    
    //10.0是总分
    float score = [[_modal.ratingDic objectForKey:@"average"] floatValue];
    
    stView.percent = score / 10;
}

@end
