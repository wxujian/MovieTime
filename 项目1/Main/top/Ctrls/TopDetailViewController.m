//
//  TopDetailViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopDetailViewController.h"
#import "ContentModal.h"
#import "TopDetailCell.h"
#import "TopDetailheaderView.h"

static NSString *TopDetailViewCellID = @"TopDetailViewCellID";

@interface TopDetailViewController ()
{
    NSMutableArray *dataArr;
    NSDictionary *detailDataDic;
    NSIndexPath *selectedIndexPath;
}
@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self parseJsonData];
    
    [self createtableView];
    
    [self createHeaderView];
    
    
    
}

- (void)createHeaderView {
    
    TopDetailheaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"TopDetailheaderView" owner:self options:nil] firstObject];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.dataDic = detailDataDic;
    
    self.contentTableView.tableHeaderView = headerView;
    
    
}

- (void)createtableView {
    
    self.contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    
    self.contentTableView.backgroundColor = [UIColor clearColor];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.backgroundColor = [UIColor clearColor];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"TopDetailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TopDetailViewCellID];
    
    [self.view addSubview:self.contentTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//解析json数据
- (void)parseJsonData {
    
    dataArr = [NSMutableArray array];
    id result = [WXDataService requestDataWithJsonFile:@"movie_comment.json"];
    
    NSArray *listArr = [result objectForKey:@"list"];
    for (NSDictionary *dic in listArr) {
        
        ContentModal *modal = [[ContentModal alloc] init];
        modal.userImageUrl = [dic objectForKey:@"userImage"];
        modal.nickName = [dic objectForKey:@"nickname"];
        modal.rating = [dic objectForKey:@"rating"];
        modal.content = [dic objectForKey:@"content"];
        
        [dataArr addObject:modal];
    }
    
    detailDataDic = [WXDataService requestDataWithJsonFile:@"movie_detail.json"];
    
    NSLog(@"detailDataDic = %@", detailDataDic);
    
    
    
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:TopDetailViewCellID forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TopDetailCell" owner:self options:nil] firstObject];
    }
    
    cell.modal = dataArr[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView delegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([selectedIndexPath isEqual:indexPath]) {
        ContentModal *modal = [[ContentModal alloc] init];
        
        modal = dataArr[indexPath.row];
        
        //字体和大小要求一致，label的行数设置为0
        NSDictionary *attDic = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:16],
                                 
                                 };
        
        
       CGRect frame = [modal.content boundingRectWithSize:CGSizeMake(kScreenWidth - (375 - 240), 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attDic context:nil];
        
        NSLog(@"%@", modal.content);
        
        CGFloat height = frame.size.height + 80 - 21 + 10;
        
        height = MAX(height, 80);
        
        return height;
        
    }
    
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedIndexPath = indexPath;
    
    [tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    
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
