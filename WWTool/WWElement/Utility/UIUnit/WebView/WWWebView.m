//
//  WWWebView.m
//
//  Created by 王伟 on 2017/6/7.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "WWWebView.h"
#import "UIView+WWAdd.h"

#define IsNull(s) (!s || [s isKindOfClass:[NSNull class]])

@interface WWWebView ()<WKNavigationDelegate, WKUIDelegate>

/** */
@property (assign, nonatomic) BOOL processDidTerminated;

@end

@implementation WWWebView

#pragma mark -
#pragma mark - init mothod

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        
        // 监听estimatedProgress和title
        [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:nil];
        
        // 添加开始加载
        [self.loadingView startAnimating];
    }
    return self;
}

#pragma mark -
#pragma mark - lazy mothod

- (UIButton *)reloadView {
    if (!_reloadView) {
        UIButton *reloadView = [UIButton buttonWithType:UIButtonTypeCustom];
        self.reloadView = reloadView;
        [self.reloadView setTitle:@"网络不给力，点击屏幕重试" forState:UIControlStateNormal];
        [self.reloadView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.reloadView addTarget:self action:@selector(refreshWebView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.reloadView];
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:reloadView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                               
                               [NSLayoutConstraint constraintWithItem:reloadView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                               
                               [NSLayoutConstraint constraintWithItem:reloadView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                               
                               [NSLayoutConstraint constraintWithItem:reloadView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]
                               ]];
        
    }
    return _reloadView;
}


- (UIActivityIndicatorView *)loadingView {
    
    if (!_loadingView) {
        CGFloat wh = 50;
        
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] init];
        loadingView.translatesAutoresizingMaskIntoConstraints = NO;
        self.loadingView = loadingView;
        loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        loadingView.backgroundColor = [UIColor grayColor];
        loadingView.alpha = 0.5;
        loadingView.layer.cornerRadius = 6;
        loadingView.layer.masksToBounds = YES;
        loadingView.hidesWhenStopped = YES;
        [self addSubview:loadingView];
        
        [self addConstraints:@[
                              [NSLayoutConstraint constraintWithItem:loadingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                              
                              [NSLayoutConstraint constraintWithItem:loadingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0],
                              
                              [NSLayoutConstraint constraintWithItem:loadingView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:wh],
                              
                              [NSLayoutConstraint constraintWithItem:loadingView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:wh]
                               ]];
        
    }
    return _loadingView;
    
}

#pragma mark -
#pragma mark - privite method

// 重新加载
- (void)refreshWebView
{
    [self reload];
    self.reloadView.hidden = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        //            [self.progressView setAlpha:1.0f];
        //            [self.progressView setProgress:self.currentSubView.webView.estimatedProgress animated:YES];
        //
        //            if(self.currentSubView.webView.estimatedProgress >= 1.0f) {
        //
        //                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //                    [self.progressView setAlpha:0.0f];
        //                } completion:^(BOOL finished) {
        //                    [self.progressView setProgress:0.0f animated:NO];
        //                }];
        //
        //            }
        
        
        
    }
    else if ([keyPath isEqualToString:@"title"])
    {
        if ([change[@"new"] isKindOfClass:[NSString class]]) {
            if (_titleBlock) {
                _titleBlock(change[@"new"]);
            }
        }
    }
    else if (object == self && [keyPath isEqualToString:@"URL"])
    {
        NSURL *newUrl = [change objectForKey:NSKeyValueChangeNewKey];
        NSURL *oldUrl = [change objectForKey:NSKeyValueChangeOldKey];
        if (IsNull(newUrl) && !IsNull(oldUrl)) {
            _processDidTerminated = YES;
            [self reload];
        };
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"estimatedProgress"];
    [self removeObserver:self forKeyPath:@"title"];
    [self removeObserver:self forKeyPath:@"URL"];
}


@end
