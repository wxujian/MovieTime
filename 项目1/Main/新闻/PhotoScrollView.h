//
//  PhotoScrollView.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIImageView *imgView;
}

@property (nonatomic, strong) NSString *imgUrl;

@end
