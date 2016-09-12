//
//  CinemaCell.h
//  项目1
//
//  Created by yuanxuedao on 16/3/17.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaListModal.h"

@interface CinemaCell : UITableViewCell

@property(nonatomic, strong)CinemaListModal *modal;
@property(nonatomic, strong)NSArray *districtArr;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIImageView *couponImgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *seatImgView;
@property (weak, nonatomic) IBOutlet UIImageView *iMaxImageView;
@property (weak, nonatomic) IBOutlet UILabel *lowPrice;
@property (weak, nonatomic) IBOutlet UIImageView *groupImageView;

@end
