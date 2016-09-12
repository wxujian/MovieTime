//
//  TopDetailViewController.h
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "BaseViewController.h"

@interface TopDetailViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>



@property (nonatomic, strong) UITableView *contentTableView;

@end
