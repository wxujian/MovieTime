//
//  CustomTabBarButton.h
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarButton : UIControl
{
    UIImageView *imgView;
    UILabel *label;
}
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imgName title:(NSString *)title;

@end
