//
//  MoviewViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "MoviewViewController.h"
#import "HomeCell.h"
#import "HomeCellModal.h"
#import "PostView.h"

static NSString *identifier = @"kHomeCellID";

@interface MoviewViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *postTableView;
    __weak IBOutlet UIView *postView;
    
    NSMutableArray *dataArr; //保存modal的数组
    PostView *newPostView;
    BOOL animationFlag;
}
@end

@implementation MoviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dataArr = [NSMutableArray array];
    //解析json数据
    [self parseJsonData];
    
//    newPostView.dataArr = dataArr;
    
    [self createPostView];

    
    animationFlag = YES;
    
    self.navigationItem.title = @"电影";

    [self createRightButtonItem];
    
    [postTableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    postTableView.separatorColor = [UIColor grayColor];

    
}

- (void)createPostView {
    
    newPostView = [[PostView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    newPostView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
//    newPostView.dataArr = dataArr;
    
    [postView addSubview:newPostView];
    
//    NSLog(@"%lf %lf", postView.width, newPostView.width);
    
    
    
}

- (void)parseJsonData {
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    //解析json数据
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *jsonArr = result[@"subjects"];
    for (NSDictionary *dic in jsonArr) {
        
        HomeCellModal *modal = [[HomeCellModal alloc] init];
        
        NSDictionary *subDic = [dic objectForKey:@"subject"];
        modal.ratingDic = [subDic objectForKey:@"rating"];
        //        NSLog(@"=====%@", modal.ratingDic);
        modal.title = [subDic objectForKey:@"title"];
        modal.original_title = [subDic objectForKey:@"original_title"];
        modal.images = [subDic objectForKey:@"images"];
        modal.year = [subDic objectForKey:@"year"];
        
        [dataArr addObject:modal];
    }
    

    newPostView.dataArr = dataArr;
}

- (void)createRightButtonItem {
    
    UIView *customview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 49, 32)];
    
    
    //海报
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [postButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    postButton.frame = customview.bounds;
    [postButton addTarget:self action:@selector(exchangeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customview addSubview:postButton];
    
    //列表
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [listButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    listButton.frame = customview.bounds;
    [listButton addTarget:self action:@selector(exchangeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [customview addSubview:listButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customview];
}

- (void)exchangeButtonAction:(UIButton *)button {
    
    UIView *customView = self.navigationItem.rightBarButtonItem.customView;
    
    animationFlag = !animationFlag;
    UIViewAnimationTransition animationTransition = animationFlag ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight;
    
    //交换自定义视图上的两个button
    [customView sendSubviewToBack:button];
    
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [UIView animateWithDuration:.5 animations:^{
       
        [UIView setAnimationTransition:animationTransition forView:customView cache:YES];
        
        
    }];
    
    [UIView animateWithDuration:.5 animations:^{
        
        [UIView setAnimationTransition:animationTransition forView:self.view cache:YES];
        
    }];
    
    
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:self options:nil] firstObject];
    }

    //赋值
    cell.modal = dataArr[indexPath.row];
    
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    return cell;
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
