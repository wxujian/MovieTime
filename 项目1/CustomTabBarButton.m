//
//  CustomTabBarButton.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "CustomTabBarButton.h"
#import "commom.h"

#define kImageSize 20

@implementation CustomTabBarButton

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imgName title:(NSString *)title {
    
    if (self = [super initWithFrame:frame]) {
        
        imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
        imgView.frame = CGRectMake((kScreenWidth / 5.0 - kImageSize)/2, 5, kImageSize, kImageSize);
//        imgView.userInteractionEnabled= YES;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imgView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, kScreenWidth / 5.0, 24)];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        
        
    }
    
    return self;
}

@end
