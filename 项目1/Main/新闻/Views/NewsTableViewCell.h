//
//  NewsTableViewCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/10.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModal.h"

enum {
    wordType,
    imageType,
    vedioType
};

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, strong) NewsModal *modal;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UIImageView *typeimageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end
