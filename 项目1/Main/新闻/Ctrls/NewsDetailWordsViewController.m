//
//  NewsDetailWordsViewController.m
//  项目1
//
//  Created by yuanxuedao on 16/3/11.
//  Copyright © 2016年 yuanxuedao. All rights reserved.
//

#import "NewsDetailWordsViewController.h"

@interface NewsDetailWordsViewController ()
{
    
    UIActivityIndicatorView *indicatorView;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NewsDetailWordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"文字新闻";
    
    
    NSURL *url = [NSURL URLWithString:@"http://news.mtime.com/2013/08/31/1517208.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:indicatorView];
    
    
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return  YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [indicatorView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
    [indicatorView stopAnimating];
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
