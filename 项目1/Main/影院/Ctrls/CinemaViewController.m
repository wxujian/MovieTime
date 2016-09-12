//
//  CinemaViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "CinemaViewController.h"
#import "DistrictListModal.h"
#import "CinemaListModal.h"
#import "CinemaCell.h"

static NSString *kCinemaCellID = @"kCinemaCellID";
static NSString *kHeaderViewID = @"kHeaderViewID";

@interface CinemaViewController ()

{
    /*
    {
        "name" : @"东城区",
        "id" : "1029"
    }
     
     {
        "1029" :
                        [
             cinemeModel1,
             cinemeModel1
             cinemeModel1
             cinemeModel1
             cinemeModel1
                        ]
     }
     
     */
    
    NSMutableArray *districtList;
    NSMutableDictionary *cinemaDic;
    
    BOOL isSelect[19];
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.title = @"影院";
    
    [self parseJsonData];
    
    //初始化bool数组
    memset(isSelect, 1, 19*sizeof(BOOL));
    
    [self.cinemaTableView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:kCinemaCellID];
    
    self.cinemaTableView.backgroundColor = [UIColor clearColor];
}

//解析json数据
- (void)parseJsonData {
    
    districtList = [NSMutableArray array];
    cinemaDic  = [NSMutableDictionary dictionary];
    
    id result = [WXDataService requestDataWithJsonFile:@"district_list.json"];
    districtList = [result objectForKey:@"districtList"];//地区的数组信息

    
    id result2 = [WXDataService requestDataWithJsonFile:@"cinema_list.json"];
    NSArray *cinemasArr = [result2 objectForKey:@"cinemaList"];
    
   
    for (NSDictionary *dic in cinemasArr) {
        
        CinemaListModal *modal = [[CinemaListModal alloc] init];
        //解析数据
        modal.districtID = [dic objectForKey:@"districtId"];
        modal.lowPrice = [dic objectForKey:@"lowPrice"];
        modal.grade = [dic objectForKey:@"grade"];
        modal.address = [dic objectForKey:@"address"];
        modal.name = [dic objectForKey:@"name"];
        modal.isSeatSupport = [dic objectForKey:@"isSeatSupport"];
        modal.isCouponSupport = [dic objectForKey:@"isCouponSupport"];//券
        modal.circleName = [dic objectForKey:@"circleName"];
        modal.isGroupBuySupport = [dic objectForKey:@"isGroupBuySupport"];
        modal.isImaxSupport = [dic objectForKey:@"isImaxSupport"];
        
        //拿取到地区代号，把相同地区代号的modal放到同一个数组里
        NSString *districtID = modal.districtID;
        //拿取对应地区代号里的数组
        NSMutableArray *tempArr = [cinemaDic objectForKey:districtID];
        
        if (tempArr == nil) { //如果数组为空，就是没有找到，那么就新建一个放入
            tempArr = [NSMutableArray array];
            [tempArr addObject:modal];
            [cinemaDic setObject:tempArr forKey:districtID];
             //tempArr = nil;//用完之后指向空，反正下次循环还是会再次拿取或者创建
        }
        //如果找到了，那就直接放入
        [tempArr addObject:modal];
        
        
    }
    
    NSLog(@"======%@", cinemaDic);
    

    
}

#pragma mark - UITableViewDatasource
//组个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return districtList.count;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (isSelect[section]) {
        return 0;
    }
    
    NSDictionary *dic = districtList[section];
    NSString *districtId = [dic objectForKey:@"id"];
    NSArray *cinemeArr = [cinemaDic objectForKey:districtId];
//    NSLog(@"%ld", cinemeArr.count);
    return cinemeArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:kCinemaCellID forIndexPath:indexPath];
    
    cell.districtArr = districtList;
    
    NSString *sectionName = [districtList[indexPath.section] objectForKey:@"id"];
    
    NSArray *cinemaArr = [cinemaDic objectForKey:sectionName];
    
    cell.modal = cinemaArr[indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 96;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderViewID];
    
    if (headerView == nil) {
        
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:kHeaderViewID];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 7.5, 200, 20)];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        label.tag = 100;
        [headerView addSubview:label];
    }
    
    headerView.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hotMovieBottomImage"]];
    UILabel *label = [headerView viewWithTag:100];
    NSArray *cinemaArr = [cinemaDic objectForKey:[districtList[section] objectForKey:@"id"]];
    label.text = [NSString stringWithFormat:@"%@(%ld)", [districtList[section] objectForKey:@"name"], cinemaArr.count];
    
    
    //点击打开
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 1;
    [headerView addGestureRecognizer:tap];
    
    headerView.tag = 1000 + section;
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
}




- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    NSInteger section = tap.view.tag - 1000;
    
    isSelect[section] = !isSelect[section];
    
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
    [self.cinemaTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
