//
//  GHWebController.m
//  GrowthHacker
//
//  Created by 王伟 on 2017/6/8.
//  Copyright © 2017年 MagicWindow. All rights reserved.
//

#import "WWWebController.h"
#import "WWWebView.h"
#import "UIView+WWAdd.h"
#import "NSString+Rock.h"

@interface WWWebController ()<WKNavigationDelegate,WKUIDelegate, UIScrollViewDelegate>

/** webView */
@property (weak, nonatomic) WWWebView *webView;

/** 导航栏 */
@property (weak, nonatomic) IBOutlet UIView *navView;

/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation WWWebController

- (WWWebView *)webView {
    if (!_webView) {
        // 创建webView
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        WWWebView *webView = [[WWWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) configuration:config];
        webView.navigationDelegate = self;
        webView.UIDelegate = self;
        self.webView = webView;
        [self.view addSubview:webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获取标题
    __weak WWWebController *weakSelf = self;
    self.webView.titleBlock = ^(NSString *title) {
        weakSelf.title = title;
    };
    // 请求网址
    if ([self.urlString isNotBlank]) {
        [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]]];
        NSLog(@"web请求的地址：%@",self.urlString);
    }
}

- (IBAction)closeClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)leftClick:(UITapGestureRecognizer *)sender {
    if (self.webView.canGoBack) {
        self.closeBtn.hidden = NO;
        [self.webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)rightClick:(UITapGestureRecognizer *)sender {
    
//    //分享操作
//    UIImage *shareImg = [UIImage imageNamed:@"logo"];
//    NSString *shareUrl = [self.url absoluteString];
////    NSString *shareTitle = webShareDic[@"title"];
//
//    CafeiShareContent *shareContent = [[CafeiShareContent alloc] init];
//    shareContent.title = self.titleL.text;
//    shareContent.content = self.titleL.text;
//    shareContent.thumbImage = shareImg;
//    shareContent.thumbImgData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mw_share" ofType:nil]];
//    shareContent.url = shareUrl;
//
//    CafeiActionSheet *actionSheet = [[CafeiActionSheet alloc] init];
//    [actionSheet setShareContent:shareContent];
//    [actionSheet showInView:self.view];
    
}

// 页面开始加载时调用
- (void)webView:(WWWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    
}

// 页面加载完成之后调用
- (void)webView:(WWWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [webView.loadingView stopAnimating];
    webView.reloadView.hidden = YES;
    webView.isload = YES;
    
}
// 页面加载失败时调用
- (void)webView:(WWWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    [webView.loadingView stopAnimating];
    webView.reloadView.hidden = NO;
    webView.isload = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_webView removeFromSuperview];
    _webView = nil;
}

@end
