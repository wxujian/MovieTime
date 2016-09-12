//
//  PhotoScrollView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView
{
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        
        self.delegate = self;
        
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.userInteractionEnabled = YES;
        [self addSubview:imgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction:)];
        tap.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer:tap];
        
        
    }
    return self;
}


- (void)doubleTapAction:(UITapGestureRecognizer *)tap {
    
    float scale = self.zoomScale > 1 ? 1.0f : 2.0f;
    [self setZoomScale:scale animated:YES];
    
}

- (void)setImgUrl:(NSString *)imgUrl {
    
    _imgUrl = imgUrl;
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:_imgUrl]];

}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return imgView;
}

@end
