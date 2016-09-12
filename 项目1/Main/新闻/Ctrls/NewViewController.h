//
//  NewViewController.h
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end
