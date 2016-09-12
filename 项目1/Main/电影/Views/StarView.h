//
//  StarView.h
//  项目1
//
//  Created by yuanxuedao on 16/3/9.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    float starHeight;
    __weak IBOutlet UIView *yellowView;
    __weak IBOutlet UIView *grayView;
}

@property(nonatomic, assign)float percent;

//- (void)changeYellowViewWidth:(float)percent;

@end
