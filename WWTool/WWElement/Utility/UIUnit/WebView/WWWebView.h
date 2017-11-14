//
//  WWWebView.h
//
//  Created by 王伟 on 2017/6/7.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <WebKit/WebKit.h>


typedef void(^WebTitleBlock)(NSString *title);
typedef void(^WebEstimatedProgressBlock)(CGFloat estimatedProgressBlock);

@interface WWWebView : WKWebView

/** 是否加载过 */
@property (assign, nonatomic) BOOL isload;

/** 标题 */
@property (copy, nonatomic) WebTitleBlock titleBlock;

/** 进度 */
@property (copy, nonatomic) WebEstimatedProgressBlock estimatedProgressBlock;

/** loading */
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

/** 获取失败按钮 */
@property (nonatomic, strong) UIButton *reloadView;




@end
