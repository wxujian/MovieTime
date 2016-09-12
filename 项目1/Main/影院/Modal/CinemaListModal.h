//
//  CinemaListModal.h
//  项目1
//
//  Created by yuanxuedao on 16/3/17.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaListModal : NSObject

@property(nonatomic, copy)NSString *lowPrice;
@property(nonatomic, copy)NSString *grade;
@property(nonatomic, copy)NSString *address;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *districtID;
@property(nonatomic, copy)NSString *isSeatSupport;
@property(nonatomic, copy)NSString *isCouponSupport; //券
@property(nonatomic, copy)NSString *isGroupBuySupport; 
@property(nonatomic, copy)NSString *isImaxSupport;

@property(nonatomic, copy)NSString *circleName;



@end
