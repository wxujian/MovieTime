//
//  MoreViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/8.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cachesSize;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"更多";
    
    self.tableView.backgroundColor = [UIColor blackColor];
    
  
    
}

- (void)viewWillAppear:(BOOL)animated {
    
      self.cachesSize.text = [NSString stringWithFormat:@"%.1fMB",[self readCache]];
}

- (void)clearChache {
    
    [[SDImageCache sharedImageCache] clearDisk];
    
    self.cachesSize.text = @"0.0MB";
    
}

- (float)readCache {


    
//    NSUInteger fileSize = [[SDImageCache sharedImageCache] getSize];
//    NSLog(@"%lu", fileSize);
    
//    NSLog(@"NSHomeDirectory = %@", NSHomeDirectory());
    
    NSString *fullPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    NSLog(@"fullPath = %@", fullPath);
    
    NSUInteger size = 0;
    
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:fullPath];
    
    for (NSString *fileName in enumerator) {
        
        NSString *filePath = [fullPath stringByAppendingPathComponent:fileName];
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        size += [attrs fileSize];
    }
    
//    NSLog(@"size = %lu", size);
    
   NSLog(@"%f", (float)size/(1024*1024));
    
    return (float)size/(1024*1024);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定清除所有缓存？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self clearChache];
            
        }];
        
      
        
        [alertCtrl addAction:cancleAction];
        [alertCtrl addAction:sureAction];
        
        [self presentViewController:alertCtrl animated:YES completion:^{
            
            NSLog(@"success");
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
