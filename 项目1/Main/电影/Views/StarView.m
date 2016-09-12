//
//  StarView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (void)awakeFromNib {
    
    yellowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow"]];
    grayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
    
    
}

- (void)setFrame:(CGRect)frame
{
    
    [super setFrame:frame];
    
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    
    starHeight = yellowImg.size.height + 0.5;
    
    //缩放星星视图，比例等雨视图的高度 除以 星星图片的高度
    CGFloat scale = frame.size.height / starHeight;
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //缩放之后需要重新设置frame值，否则就会乱套
    yellowView.frame = CGRectMake(0, 0, frame.size.height * 5, frame.size.height);
    grayView.frame = CGRectMake(0, 0, frame.size.height * 5, frame.size.height);
}



- (void)setPercent:(float)percent {
    
    _percent = percent;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    yellowView.frame = CGRectMake(0, 0, _percent * self.frame.size.height * 5, self.frame.size.height);
}

@end
