//
//  PhotoViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
#import "PhotoFlowLayout.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSLog(@"===== %@ %ld", _imgUrlArr, _indexPath.row);
    
    //UICollectionView -> UICollectionViewCell layout
    //UICOllectionViewCell -> UIScrollView(缩放)—>UIImageView

    self.extendedLayoutIncludesOpaqueBars = YES;
    
    [self createCollectionView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(popAction)];
    
//    self.navigationController.navigationItem
    
    
}

- (void)popAction {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setImgUrlArr:(NSArray *)imgUrlArr {
    
    _imgUrlArr = imgUrlArr;
}

- (void)createCollectionView {
    
    PhotoFlowLayout *flowLayout = [[PhotoFlowLayout alloc] init];
    
    PhotoCollectionView *photoCollView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth+kPhotoImageWidthWithImage, self.view.height) collectionViewLayout:flowLayout];
    
    photoCollView.dataArr = _imgUrlArr;
    
    [self.view addSubview:photoCollView];
    
    [photoCollView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
