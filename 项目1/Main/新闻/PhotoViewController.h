//
//  PhotoViewController.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

@interface PhotoViewController : BaseViewController

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSArray *imgUrlArr;

@end
