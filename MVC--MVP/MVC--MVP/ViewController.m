//
//  ViewController.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import "MVCViewController.h"
#import "MVPViewController.h"


@interface ViewController ()

@end

@implementation ViewController
- (IBAction)gotoMVC:(UIButton *)sender {
    [self.navigationController pushViewController:[MVCViewController new] animated:YES];

}
- (IBAction)gotoMVP:(UIButton *)sender {
    [self.navigationController pushViewController:[MVPViewController new] animated:YES];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
