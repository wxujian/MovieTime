//
//  RootTabBarController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "RootTabBarController.h"
#import "CustomTabBarButton.h"
#import "commom.h"
//#import "MoviewViewController.h"
//#import "NewViewController.h"
//#import "TopViewController.h"
//#import "CinemaViewController.h"
//#import "MoreViewController.h"


@interface RootTabBarController ()
{
    
    UIImageView *selectedImgView;
}
@end

@implementation RootTabBarController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self removeSystemTabBarButton];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    
    //创建视图控制器， 需要先创建控制器
    [self createviewCtrls];
    
    //自定义按钮
    [self createTabBarButton];
    
    
    
    
}

//因为是在故事板里，视图会在即将出现时重新加载，所以需要在将要出现里移除
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    [self removeSystemTabBarButton];
//}

- (void)createviewCtrls {
    
    
    UIStoryboard *movie = [UIStoryboard storyboardWithName:@"Movie" bundle:nil];
    UIStoryboard *news = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    UIStoryboard *top = [UIStoryboard storyboardWithName:@"Top" bundle:nil];
    UIStoryboard *cinema = [UIStoryboard storyboardWithName:@"Cinema" bundle:nil];
    UIStoryboard *more = [UIStoryboard storyboardWithName:@"More" bundle:nil];
    
    NSArray *viewCtrls = @[
                           [movie instantiateInitialViewController],
                           [news instantiateInitialViewController],
                           [top instantiateInitialViewController],
                           [cinema instantiateInitialViewController],
                           [more instantiateInitialViewController]
                           ];

    self.viewControllers = viewCtrls;
    
}

- (void)createTabBarButton {
    
    NSArray *titles = @[@"电影", @"新闻", @"TOP", @"影院", @"更多"];
    NSArray *images = @[@"movie_cinema", @"msg_new", @"start_top250", @"icon_cinema", @"more_setting"];
    
    //选中视图
    selectedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/5, 49)];
    selectedImgView.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
    
    [self.tabBar addSubview:selectedImgView];
    
    for (int i = 0; i < titles.count; i++) {
        CustomTabBarButton *tabBarButton = [[CustomTabBarButton alloc] initWithFrame:CGRectMake(i * kScreenWidth/ 5.0, 0, kScreenWidth / 5.0, 49) imageName:images[i] title:titles[i]];
        
        tabBarButton.tag = 1000 + i;
        [tabBarButton addTarget:self action:@selector(tabBarbuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:tabBarButton];
    }
    
}

#pragma mark - buttonAction

- (void)tabBarbuttonSelected:(CustomTabBarButton *)tabBarButton {
    
    self.selectedIndex = tabBarButton.tag - 1000;

    [UIView animateWithDuration:0.5 animations:^{
        
        selectedImgView.center = tabBarButton.center;
    }];
}

//系统自带的tabbarItem
//- (void)removeSystemTabBarButton {
//    
//    for (UIView *view in self.tabBar.subviews) {
//        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [view removeFromSuperview];
//        }
//    }
//    
//    NSLog(@"%@", self.tabBar.subviews);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
