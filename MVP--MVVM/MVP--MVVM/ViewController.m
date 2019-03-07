//
//  ViewController.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import "MVVMViewController.h"
#import "MVPViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)gotoMVVM:(UIButton *)sender {
    
    [self.navigationController pushViewController:[MVVMViewController new] animated:YES];
}
- (IBAction)gotoMVP:(UIButton *)sender {
    
    [self.navigationController pushViewController:[MVPViewController new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
