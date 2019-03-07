//
//  MVPViewController.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "MVPViewController.h"
#import "Present.h"
static NSString *const reuserId = @"reuserId";
@interface MVPViewController ()<PresentDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) Present *pt;

@property (nonatomic,strong)  SKProxy *skProxy;

@end

@implementation MVPViewController
- (UITableView *)tableView {
    if(!_tableView){
        _tableView  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:reuserId];
        _tableView.rowHeight = 44;

    }
    return _tableView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"合计：" style:(UIBarButtonItemStyleDone) target:self action:nil];

    self.pt = [[Present alloc]init];
    __weak __typeof(self) weakSelf = self;
    self.skProxy = [[SKProxy alloc]initWithIdentifier:reuserId configureBlock:^(MVPTableViewCell *  _Nonnull cell, Model * _Nonnull mode, NSIndexPath * _Nonnull indexPath) {
        cell.nameLabel.text = mode.name;
        cell.numLabel.text = mode.num;
        cell.num = [mode.num intValue];
        
        cell.indexPath = indexPath;
        cell.delegate = weakSelf.pt;
        
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击了 %ld行cell",(long) indexPath.row);
        
    } reloadData:^(NSMutableArray * _Nonnull array) {
        weakSelf.pt.dataArray = [array mutableCopy];
        [weakSelf reloadDataForUI];
    }];
    [self.skProxy addDataArray:self.pt.dataArray];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self.skProxy;
    self.tableView.delegate = self.skProxy;
    
    //Present代理设置
    self.pt.delegate = self;
    self.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"合计:%d",[self.pt total]];

}

#pragma mark--- PresentDelegate

- (void)reloadDataForUI {
    
    [self.skProxy addDataArray:self.pt.dataArray];
    [self.tableView reloadData];
    self.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"合计:%d",[self.pt total]];
}
@end
