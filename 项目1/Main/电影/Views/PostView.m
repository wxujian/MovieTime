//
//  PostView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/12.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "PostView.h"
#import "HomeCellModal.h"
#import "SmallLayout.h"
#import "LargeLayout.h"

@implementation PostView
{
    UIImageView *upImageView;
    UIImageView *imageView;
}
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        isSelected = YES;
        
        [self createUI];
        
    }
    return self;
}

-(void)awakeFromNib {
    
    [self createUI];
}

- (void)createUI {
    
    [self parseJson];
    
    //创建头视图
    [self createHeaderView];
    
    
    //创建遮盖视图
    [self createMaskView];
    
    //创建标题视图
    [self createTitileLabel];
    
    
    
    [self createLargeView];
    
    [self createLight];
    
    [self createUISwipeGestureRecognizer];
    [self createTapGestureRecognizer];
    
    
    //添加观察者
    [largeMovieView addObserver:self forKeyPath:kObservePropertyStr options:NSKeyValueObservingOptionNew context:nil];
    
    [largeMovieView addObserver:smallMoviewView forKeyPath:kObservePropertyStr options:NSKeyValueObservingOptionNew context:nil];
    
    [smallMoviewView addObserver:largeMovieView forKeyPath:kObservePropertyStr options:NSKeyValueObservingOptionNew context:nil];
}

//观察者方法
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    
    NSInteger index = [change[@"new"] integerValue];
    
    [self changeMovietitle:index];
}

- (void)changeMovietitle:(NSInteger )index {
    
    HomeCellModal *modal = _dataArr[index];
    titleLabelView.text = modal.title;
}

- (void)parseJson {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    
//    NSData *jsonData = [NSData dataWithContentsOfFile:path];
//    //解析json数据
//    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
   id result = [WXDataService requestDataWithJsonFile:@"us_box.json"];
    
    _dataArr = [NSMutableArray array];
    
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
        
        [_dataArr addObject:modal];
    }
    
    


    
}

- (void)createLargeView {
    
    MovieLayout *layout = [[LargeLayout alloc] init];
    
    largeMovieView = [[LargeMovieView alloc] initWithFrame:CGRectMake(0, 26, kScreenWidth, self.height-30-49-26) collectionViewLayout:layout];
    largeMovieView.backgroundColor = [UIColor clearColor];
//    largeMovieView.pagingEnabled = YES;
    largeMovieView.dataArr = _dataArr;
    
    [self insertSubview:largeMovieView belowSubview:headerView];
    
    
}

- (void)createTitileLabel {
    
    titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - 200)/2, kScreenHeight-49-30-64, 200, 30)];
    titleLabelView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    
    titleLabelView.font = [UIFont boldSystemFontOfSize:20];
    titleLabelView.textAlignment = NSTextAlignmentCenter;
    titleLabelView.textColor = [UIColor whiteColor];
    
    HomeCellModal *modal = (HomeCellModal *)_dataArr[0];
    titleLabelView.text = modal.title;
    
    
    [self addSubview:titleLabelView];
    
}

- (void)createHeaderView {
    
    headerView  = [[UIView alloc] initWithFrame:CGRectMake(0, - kHeiderViewHeight, 0, kHeiderViewHeight)];
    headerView.backgroundColor = [UIColor blackColor];
    
    MovieLayout *smallLayout = [[SmallLayout alloc] init];
    
    smallMoviewView = [[SmallMoviewView alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 110) collectionViewLayout:smallLayout];
    
    smallMoviewView.backgroundColor = [UIColor clearColor];
    smallMoviewView.dataArr = _dataArr;
    
    [headerView addSubview:smallMoviewView];
    
    [self addSubview:headerView];
    
}

- (void)createTapGestureRecognizer {
    
   
}

- (void)createMaskView {
    
    maskView = [[UIControl alloc] initWithFrame:CGRectMake(0, headerView.frame.origin.y+2*headerView.frame.size.height, kScreenWidth, kScreenHeight-64-49-30)];
    NSLog(@"headerView.frame.origin.y = %f", headerView.frame.origin.y);
    maskView.backgroundColor = [UIColor grayColor];
    maskView.alpha = 0;
    
    [self addSubview:maskView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHideHeaderView)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    
    [maskView addGestureRecognizer:tap];
    
    maskViewControl  = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 26)];
//    maskViewControl.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"indexBG_home"]];
    
    [maskViewControl addTarget:self action:@selector(showOrHideHeaderView) forControlEvents:UIControlEventTouchUpInside];
    
   imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0+64, kScreenWidth, 26)];
    imageView.image = [UIImage imageNamed:@"indexBG_home"];
    imageView.userInteractionEnabled = YES;
//    [maskViewControl addSubview:imageView];
    
    imageView.center = maskViewControl.center;
    
//    [maskView addSubview:maskViewControl];
//    [maskView insertSubview:imageView belowSubview:maskViewControl];
    
    [self addSubview:imageView];
    [imageView addSubview:maskViewControl];
    
    
    //新建黄色的小视图
    upImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"up_home"]];
    upImageView.frame = CGRectMake((kScreenWidth-13)/2+3, 12, 13, 10);
    upImageView.transform = CGAffineTransformMakeRotation(M_PI);
    [imageView addSubview:upImageView];
    
    
}



//创建下滑手势
- (void)createUISwipeGestureRecognizer {
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHideHeaderView)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [largeMovieView addGestureRecognizer:swipe];
}

- (void)showOrHideHeaderView{
    
    
    [UIView animateWithDuration:0.2 animations:^{
        
        upImageView.transform = CGAffineTransformRotate(upImageView.transform, M_PI);
    }];

  [UIView animateWithDuration:0.5 animations:^{
      
      CGFloat alpha = !isSelected == 1 ? 0 : 0.8;
      maskView.alpha = alpha;
      
  }];
    
    if (isSelected) { //往下
        
        
        NSLog(@"======");
        [UIView animateWithDuration:0.5 animations:^{
            headerView.frame = CGRectMake(0, 0, kScreenWidth, kHeiderViewHeight);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            imageView.transform = CGAffineTransformMakeTranslation(0, kHeiderViewHeight);
        }];
        
        
        
    } else { // 往上拉
        
        [UIView animateWithDuration:0.5 animations:^{
             headerView.frame = CGRectMake(0, -kHeiderViewHeight, kScreenWidth, kHeiderViewHeight);
        }];
        [UIView animateWithDuration:0.5 animations:^{
             imageView.transform = CGAffineTransformMakeTranslation(0, 0);;
        }];
        
        
       
    }
    
    isSelected = !isSelected;
    
    
}

//创建灯那个视图
- (void)createLight {
    
    UIImageView *lightView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"light"]];
    lightView1.frame = CGRectMake((kScreenWidth/2.0-124)/2.0f, 10, 124, 204);
    
    UIImageView *lightView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"light"]];
    lightView2.frame = CGRectMake(kScreenWidth/2.0 + (kScreenWidth/2.0-124)/2.0f + 10, 10, 124, 204);
    
    NSLog(@"==============%f", kScreenWidth);
    
    [self addSubview:lightView1];
    [self addSubview:lightView2];
    
}

//数据源传递
//- (void)setDataArr:(NSArray *)dataArr {
//    
//    _dataArr = dataArr;
//    NSLog(@"%ld", _dataArr.count);
//
//}

@end
