//
//  TopViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopViewController.h"
#import "TopCollectionView.h"
#import "TopLayout.h"
#import "TopModal.h"
#import "TopDetailViewController.h"

@interface TopViewController ()
{
    TopCollectionView *collectionView;
    NSMutableArray *dataArr;
}
@end

@implementation TopViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Top250";
    
    dataArr = [NSMutableArray array];
    
    [self parseJsonData];
    
    [self createUI];
    
}

- (void)parseJsonData {
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"top250" ofType:@"json"];

    id result = [WXDataService requestDataWithJsonFile:@"top250.json"];
    
    NSArray *subArr = [result objectForKey:@"subjects"];
    for (NSDictionary *subDic in subArr) {
        
        TopModal *modal = [[TopModal alloc] init];
        modal.ratingDic = [subDic objectForKey:@"rating"];
        modal.title = [subDic objectForKey:@"title"];
        modal.imagesDic = [subDic objectForKey:@"images"];
        
        [dataArr addObject:modal];
    }
    
    
    
    
}

- (void)createUI {
    
    TopLayout *layout = [[TopLayout alloc] init];
    
    collectionView = [[TopCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataArr = dataArr;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
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


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TopDetailViewController *topDetailView = [[TopDetailViewController alloc] init];
    
    [self.navigationController pushViewController:topDetailView animated:YES];
}

@end
