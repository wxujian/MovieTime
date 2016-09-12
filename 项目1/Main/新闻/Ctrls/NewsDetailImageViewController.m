//
//  NewsDetailImageViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/11.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "NewsDetailImageViewController.h"
#import "ImageNewsModal.h"

static NSString *NewsDetailImageViewControllerCellID = @"NewsDetailImageViewControllerCellID";


#define ITEMSCOUNT 3
#define IMAGEWIDTH 100
#define IMAGEHEIGHT 70
#define LINESPACE (kScreenWidth - ITEMSCOUNT*IMAGEWIDTH)/ (ITEMSCOUNT+1)



@interface NewsDetailImageViewController ()
{
    NSMutableArray *jsonDataArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation NewsDetailImageViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    //解析数据
    [self parseJsonData];
    
    
    
    [self createCollectionView];
    
    self.navigationItem.title = @"图片新闻";
}

- (void)parseJsonData {
    
    //初始化可变数据数组
    jsonDataArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in result) {
     
        ImageNewsModal *modal = [[ImageNewsModal alloc] init];
        modal.imageID = [dic objectForKey:@"id"];
        modal.image = [dic objectForKey:@"image"];
        modal.type = [dic objectForKey:@"type"];
        
        [jsonDataArray addObject:modal];
    }
    
}

- (void)createCollectionView {
    
    //注册单元格
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NewsDetailImageViewControllerCellID];
    
    
//    self.flowLayout.itemSize = CGSizeMake((kScreenWidth - LINESPACE*5)/4.0f, (kScreenWidth - LINESPACE*5)/4.0f);
//    self.flowLayout.minimumInteritemSpacing = LINESPACE;
//    self.flowLayout.minimumLineSpacing = LINESPACE;
//    self.flowLayout.sectionInset = UIEdgeInsetsMake(LINESPACE, LINESPACE, LINESPACE, LINESPACE);
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return jsonDataArray.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NewsDetailImageViewControllerCellID forIndexPath:indexPath];
        
    //刷新图片
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, IMAGEWIDTH-2, IMAGEHEIGHT-2)];
    ImageNewsModal *modal = [jsonDataArray objectAtIndex:indexPath.row];
    NSString *path = modal.image;
    NSURL *url = [NSURL URLWithString:path];
    [imgView sd_setImageWithURL:url placeholderImage: [UIImage imageNamed:@"pig"]];
    
    [cell.contentView addSubview:imgView];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(IMAGEWIDTH, IMAGEHEIGHT);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(LINESPACE, LINESPACE, LINESPACE, LINESPACE);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)sectio {
    return LINESPACE;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return LINESPACE;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    
//    
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    
//    
//}

#pragma mark - UICollectionDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoViewController *photoViewCtrl = [[PhotoViewController alloc] init];
    
    photoViewCtrl.indexPath = indexPath;
    
    NSMutableArray *imgUrlArr = [NSMutableArray array];
    
    for ( ImageNewsModal *modal in jsonDataArray) {
        NSString *imgUrl = modal.image;
        [imgUrlArr addObject:imgUrl];
    }
    photoViewCtrl.imgUrlArr = imgUrlArr;
    
    [self.navigationController pushViewController:photoViewCtrl animated:YES];
    
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
