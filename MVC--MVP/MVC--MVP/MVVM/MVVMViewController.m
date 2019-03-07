//
//  MVVMViewController.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
static NSString *const reuserId = @"reuserId";

@interface MVVMViewController ()

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)MVVMViewModel *vm;
@property (nonatomic,strong)Target *subTarget;

@end

@implementation MVVMViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:reuserId];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"合计：" style:(UIBarButtonItemStyleDone) target:self action:nil];
    __weak __typeof(self) weakSelf = self;
    self.subTarget = [[Target alloc]initWithIdentifier:reuserId configureBlock:^(MVPTableViewCell *cell, Model * model, NSIndexPath *indexPath) {
        
        cell.nameLabel.text = model.name;
        cell.numLabel.text = model.num;
        cell.indexPath = indexPath;
        cell.delegate = weakSelf.vm;
    } selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行cell",(long)indexPath.row);
    }];
    self.view.backgroundColor = [UIColor whiteColor];
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
