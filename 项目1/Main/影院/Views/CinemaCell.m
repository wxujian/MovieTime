//
//  CinemaCell.m
//  项目1
//
//  Created by yuanxuedao on 16/3/17.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaListModal.h"

@implementation CinemaCell

- (void)awakeFromNib {

    [self.name sizeToFit];
//    [self.name layoutIfNeeded];
    NSLog(@"===%@", NSStringFromCGRect(self.name.frame));

    self.name.frame = CGRectMake(10, 8, self.name.frame.size.width, 24);
    self.grade.frame = CGRectMake(self.name.frame.origin.x+self.name.size.width+10, 6, 42, 29);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void)setDistrictArr:(NSArray *)districtArr {
    
    _districtArr = districtArr;
}

- (void)setModal:(CinemaListModal *)modal {
    
    _modal = modal;
    NSLog(@"%@ %@ %@ %@ ", modal.address, _modal.name, _modal.lowPrice, modal.grade);
    
/*
 @property (weak, nonatomic) IBOutlet UILabel *grade;
 @property (weak, nonatomic) IBOutlet UILabel *address;
 @property (weak, nonatomic) IBOutlet UIImageView *couponImgView;
 @property (weak, nonatomic) IBOutlet UILabel *name;
 @property (weak, nonatomic) IBOutlet UIImageView *seatImgView;
 @property (weak, nonatomic) IBOutlet UILabel *lowPrice;
 */
    
    
//    [self awakeFromNib];
    [self refreshUI];
}

- (void)refreshUI {
    
    self.grade.text = _modal.grade;
    self.address.text = _modal.address;
    self.name.text = _modal.name;
    self.lowPrice.text = [NSString stringWithFormat:@"¥ %@", _modal.lowPrice];
    
    //座位
    if ([_modal.isSeatSupport isEqualToString:@"1"]) {
        
        self.seatImgView.image = [UIImage imageNamed:@"cinemaSeatMark"];
    }else {
        self.seatImgView.image = nil;
    }
    
    //券
    if ([_modal.isCouponSupport isEqualToString:@"1"]) {
        self.couponImgView.image = [UIImage imageNamed:@"cinemaCouponMark"];
    }else {
        self.couponImgView.image = nil;
    }
    
    //imax
    if ([_modal.isImaxSupport isEqualToString:@"1"]) {
        self.iMaxImageView.image = [UIImage imageNamed:@"imaxMark"];
    } else {
        
        self.iMaxImageView.image = nil;
    }
    
    //团
    if ([_modal.isGroupBuySupport isEqualToString:@"1"]) {
        self.groupImageView.image = [UIImage imageNamed:@"cinemaGrouponMark"];
    } else {
        self.groupImageView.image = nil;
    }
    

    [self awakeFromNib];
}

@end
