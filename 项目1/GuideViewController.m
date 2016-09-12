//
//  GuideViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/18.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "GuideViewController.h"
#import "RootTabBarController.h"

@interface GuideViewController ()<UIScrollViewDelegate>


@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
    
}

- (void)createUI {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(5*kScreenWidth, kScreenHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    
    for (int i = 0; i < 5; i++) {
        
        NSString *imgName = [NSString stringWithFormat:@"guide%d", i+1];
        NSString *guideProgressImageName = [NSString stringWithFormat:@"guideProgress%d", i+1];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
        imgView.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight);
        
        UIImageView *pgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:guideProgressImageName]];
        pgImgView.frame = CGRectMake((kScreenWidth-173)/2.0f, kScreenHeight-50, 173, 26);
        
        [imgView addSubview:pgImgView];
        [scrollView addSubview:imgView];
        
        
    }
    
    [self.view addSubview:scrollView];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == 4*kScreenWidth) {
        
        RootTabBarController *roottabbar = [[RootTabBarController alloc] init];
        
        [UIView transitionWithView:self.view.window
                          duration:.4
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            self.view.window.rootViewController = roottabbar;
                        }
                        completion:^(BOOL finished) {
                            
                            
                        }];
        
    }
}

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
