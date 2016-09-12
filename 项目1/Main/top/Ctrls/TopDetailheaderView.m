//
//  TopDetailheaderView.m
//  项目1
//
//  Created by yuanxuedao on 16/3/15.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "TopDetailheaderView.h"

@implementation TopDetailheaderView

- (void)awakeFromNib {
    
    self.superView.layer.cornerRadius = 8;
    self.superView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    self.whiteEdgeView.layer.cornerRadius = 8;
    
}

- (void)setDataDic:(NSDictionary *)dataDic {
    
    _dataDic = dataDic;
    /*
     
     @property (weak, nonatomic) IBOutlet UILabel *actorsLabel;
     @property (weak, nonatomic) IBOutlet UILabel *directorLabel;
     @property (weak, nonatomic) IBOutlet UILabel *titleLabel;
     @property (weak, nonatomic) IBOutlet UILabel *typeLabel;
     @property (weak, nonatomic) IBOutlet UIView *superView;
     @property (weak, nonatomic) IBOutlet UIImageView *imgView1;
     @property (weak, nonatomic) IBOutlet UIImageView *imgView2;
     @property (weak, nonatomic) IBOutlet UIImageView *imgView3;
     @property (weak, nonatomic) IBOutlet UIImageView *imgView4;
     @property (weak, nonatomic) IBOutlet UILabel *locationAndDate;*/
    
    //演员名字
    NSArray *actors = [_dataDic objectForKey:@"actors"];
    NSMutableString *actorsStr = [NSMutableString string];
    int i = 0;
    for (NSString *actorName in actors) {
        i++;
        if (i == actors.count) {
            
            [actorsStr appendFormat:@"%@", actorName];

        } else {
            
            [actorsStr appendFormat:@"%@、", actorName];
        }
    }
    self.actorsLabel.text = actorsStr;
//    NSLog(@"actorsStr = %@", actorsStr);
    
    self.directorLabel.text = [[_dataDic objectForKey:@"directors"] firstObject];
    
    NSString *urlStr = [_dataDic objectForKey:@"image"];
    [self.postImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    self.titleLabel.text = [_dataDic objectForKey:@"titleCn"];
    
    
    
    NSArray *types = [_dataDic objectForKey:@"type"];
    NSMutableString *typesAtr = [NSMutableString string];
    int j = 0;
    for (NSString *typeName in types) {
        j++;
        if (j == types.count) {
            
            [typesAtr appendFormat:@"%@", typeName];
            
        } else {
            
            [typesAtr appendFormat:@"%@、", typeName];
        }
    }
    self.typeLabel.text = typesAtr;
    NSLog(@"typesAtr = %@", typesAtr);
    
    
    NSDictionary *releaseDic = [_dataDic objectForKey:@"release"];
    NSString *location = [releaseDic objectForKey:@"location"];
    NSString *date = [releaseDic objectForKey:@"date"];
    self.locationAndDate.text = [NSString stringWithFormat:@"%@ %@", location, date];
    
    
    NSArray *images = [_dataDic objectForKey:@"images"];
    
    NSURL *url1 = [NSURL URLWithString:images[0]];
    [self.imgView1 sd_setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"pig"]];
    NSURL *url2 = [NSURL URLWithString:images[1]];
    [self.imgView2 sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"pig"]];
    NSURL *url3 = [NSURL URLWithString:images[2]];
    [self.imgView3 sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"pig"]];
    NSURL *url4 = [NSURL URLWithString:images[3]];
    [self.imgView4 sd_setImageWithURL:url4 placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
    
    
}

@end
