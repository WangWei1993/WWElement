//
//  WWCommonUtils.h
//  WWTool
//
//  Created by 王伟 on 2017/11/10.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma clang diagnostic ignored "-Wdocumentation"//去掉参数配置不恰当的警告
#pragma clang diagnostic ignored "-Wdeprecated-declarations"// 去掉弃用的警告

NS_ASSUME_NONNULL_BEGIN

@interface WWCommonUtils : NSObject

/*!
 @method
 @abstract 只有一个“确定”按钮的系统提示对话框
 @discussion
 @param msg 提示消息内容
 @result 无返回
 */
- (void)showAlertWithTaget:(nullable id)taget andMsg:(NSString *)msg;

/*!
 @method
 @abstract 只有一个“确定”按钮的系统提示对话框
 @discussion
 @param title 标题
 @param msg 提示消息内容
 @param delegate 对话框点击后回调委托
 @param tag 对话框tag，用于同一viewController多个提示框中区分
 @result 无返回
 */
+(void)showDialogWithTaget:(nullable id)taget andTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate;

/*!
 @method
 @abstract 有“确定”、"取消"按钮的系统提示对话框
 @discussion
 @param title 标题
 @param msg 提示消息内容
 @param delegate 对话框点击后回调委托
 @param sureHandler   确定回调
 @param cancelHandler 取消回调
 @result 无返回
  */
- (void)showAlertWithTwoBtnsTaget:(nullable id)taget
                            title:(NSString *)title
                          message:(NSString *)msg
                         delegate:(id)delegate
                      sureHandler:(void(^)(void))sureHandler
                    cancelHandler:(void(^)(void))cancelHandler;

NS_ASSUME_NONNULL_END

@end
