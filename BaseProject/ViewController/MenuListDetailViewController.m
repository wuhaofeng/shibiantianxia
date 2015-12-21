//
//  MenuListDetailViewController.m
//  BaseProject
//
//  Created by ios on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuListDetailViewController.h"

@interface MenuListDetailViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation MenuListDetailViewController
-(UIWebView *)webView{
    if (!_webView) {
        _webView=[[UIWebView alloc]init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _webView.delegate=self;
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[NSString stringWithFormat:@"http://cookbook-cn.appcookies.com/article/show/%@.html",self.ID];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;

}
- (void)webViewDidStartLoad:(UIWebView *)webView{
[self.webView showProgress];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView hideProgress];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self.webView hideProgress];

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
