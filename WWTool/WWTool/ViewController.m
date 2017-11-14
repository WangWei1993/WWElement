//
//  ViewController.m
//  WWTool
//
//  Created by 王伟 on 2017/11/6.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "ViewController.h"
#import "WWCommonUtils.h"
#import "WWDefine.h"
#import "UIView+WWAdd.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}

- (IBAction)giologAction {
    
    [[[WWCommonUtils alloc] init] showAlertWithTwoBtnsTaget:self title:@"111" message:@"222" delegate:self sureHandler:^{
        NSLog(@"点击确定");
    } cancelHandler:^{
        NSLog(@"点击取消");
    }];
    [self.view removeAllSubviews];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
