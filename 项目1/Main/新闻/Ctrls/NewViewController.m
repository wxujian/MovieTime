//
//  NewViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "NewViewController.h"
#import "NewsTableViewCell.h"
#import "NewsModal.h"

#define kImgViewHeight 200

static NSString *kNewsCellID = @"kNewsCellID";


@interface NewViewController ()
{
    
    NSMutableArray *dataArr;
    UIImageView *bigPostImageView; //最大的海报视图
    UILabel *bigPostLabel;         //海报视图下面的那句话
    
    UIView *backView;
}
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"新闻";

    self.navigationController.navigationBar.alpha = 1.0f;
    
    dataArr = [NSMutableArray array];
    
    [self parseJsonData];
    
    [self configUI];
 
}

//- (void)viewDidAppear:(BOOL)animated {
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        self.navigationController.tabBarController.tabBar.hidden = NO;
//    }];
//    
//}

- (void)viewWillAppear:(BOOL)animated {
    
   
    [self.newsTableView reloadData];
}

//解析json数据
- (void)parseJsonData {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news_list" ofType:@"json"];
    NSLog(@"%@", path);
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@", result);
    
    for (NSDictionary *dic in result) {
        
        NewsModal *modal = [[NewsModal alloc] init];
        modal.type = [dic objectForKey:@"type"];
        modal.imageUrl = [dic objectForKey:@"image"];
        modal.summary = [dic objectForKey:@"summary"];
        modal.title = [dic objectForKey:@"title"];
        
        [dataArr addObject:modal];
    }
    
    NSLog(@"%@", dataArr);
    
  
    
}

- (void)configUI {
    
    
    bigPostImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kImgViewHeight)];
    
    NewsModal *modal = dataArr[0];
    
    NSURL *url = [NSURL URLWithString:modal.imageUrl];
    [bigPostImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    [dataArr removeObjectAtIndex:0];
    //最大海报视图下面的那个视图，为了显示透明效果再建一个view
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, kImgViewHeight - 30, kScreenWidth, 30)];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.5;
    
    [bigPostImageView addSubview:backView];
    
    
    bigPostLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kImgViewHeight - 30, kScreenWidth, 30)];
    bigPostLabel.textAlignment = NSTextAlignmentCenter;
    bigPostLabel.textColor = [UIColor whiteColor];
    bigPostLabel.font = [UIFont boldSystemFontOfSize:20];
    bigPostLabel.text = modal.title;
//    bigPostLabel.text = @"adfg";
    [bigPostImageView addSubview:bigPostLabel];
    
    self.newsTableView.backgroundColor = [UIColor clearColor];
    
    [_newsTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kNewsCellID];
    
    _newsTableView.rowHeight = 100;
    
//    _newsTableView.backgroundColor = [UIColor redColor];
    
    //遮盖在最大的海报视图上的透明视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kImgViewHeight)];
    view.backgroundColor = [UIColor clearColor];
    view.alpha = 0.0f;
    _newsTableView.tableHeaderView = view;
    
    [self.view insertSubview:bigPostImageView belowSubview:_newsTableView];
}


#pragma mark - UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewsCellID forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:self options:nil] firstObject];
        

    }
    
//    cell.textLabel.text = @"as";
    cell.backgroundColor = [UIColor whiteColor];
    
//    if (indexPath.row == 0) { //第一张最大的海报视图
//        NewsModal *modal = [dataArr objectAtIndex:0];
//        NSString *url = modal.imageUrl;
//        
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
//        bigPostImageView.image = [UIImage imageWithData:data];
//        
//        bigPostLabel.text = modal.title;
//        
//    } else {
    
//        cell.modal = nil;
        cell.modal = [dataArr objectAtIndex:indexPath.row];

//    }
    
    return cell;
}




#pragma mark - UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y >= 0) { //往上拉
        bigPostImageView.frame = CGRectMake(0, -y+64, kScreenWidth, kImgViewHeight);
        backView.frame = CGRectMake(0, bigPostImageView.frame.size.height-30, kScreenWidth, 30);
        bigPostLabel.frame = CGRectMake(0, bigPostImageView.frame.size.height-30, kScreenWidth, 30);
    } else {       //往下拉
        
        CGFloat scale = (kImgViewHeight - y) / kImgViewHeight;
        bigPostImageView.frame = CGRectMake(-((scale-1)*kScreenWidth)/2.0f, 64, kScreenWidth * scale, kImgViewHeight*scale);
        
        backView.frame = CGRectMake(((scale-1)*kScreenWidth)/2.0f, bigPostImageView.frame.size.height-30, kScreenWidth, 30);
        bigPostLabel.frame = CGRectMake(((scale-1)*kScreenWidth)/2.0f, bigPostImageView.frame.size.height-30, kScreenWidth, 30);
    }
}

//选中cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsModal *modal = [dataArr objectAtIndex:indexPath.row];
    NSInteger type = [modal.type integerValue];
    NSString *storyboardID = nil;
    if (type == wordType) {
        storyboardID = @"NewsDetailWordsViewController";
    } else if (type == imageType) {
        storyboardID = @"NewsDetailImageViewController";
    } else {
        
        return;//如果是视频的话那就先return
    }
    
    UIViewController *viewCtrls = [self.storyboard instantiateViewControllerWithIdentifier:storyboardID];
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:viewCtrls animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;

    
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
