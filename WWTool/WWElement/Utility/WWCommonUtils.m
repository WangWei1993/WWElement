//
//  WWCommonUtils.m
//  WWTool
//
//  Created by 王伟 on 2017/11/10.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "WWCommonUtils.h"
#import <objc/message.h>

@interface WWCommonUtils () <UIAlertViewDelegate>

@end

@implementation WWCommonUtils


+(void)showDialogWithTaget:(nullable id)taget andTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate
{
    
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
    
}

- (void)showAlertWithTaget:(nullable id)taget andMsg:(NSString *)msg
{
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@""
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        
    }
    
}

- (void)showAlertWithTwoBtnsTaget:(nullable id)taget
                            title:(NSString *)title
                          message:(NSString *)msg
                          delegate:(id)delegate
                      sureHandler:(void(^)(void))sureHandler
                    cancelHandler:(void(^)(void))cancelHandler
{
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            sureHandler();
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelHandler();
        }];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        [taget presentViewController:alertController animated:YES completion:nil];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
    } else {
        
    }
}

@end
