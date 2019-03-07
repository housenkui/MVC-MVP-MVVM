//
//  MVVMViewController.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
static NSString *const reuserId = @"reuserId";

@interface MVVMViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MVVMViewModel *vm;
@property (nonatomic,strong) SKProxy *skProxy;

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
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"合计：" style:(UIBarButtonItemStyleDone) target:self action:nil];
    
    __weak __typeof(self) weakSelf = self;
    
    self.skProxy = [[SKProxy alloc]initWithIdentifier:reuserId configureBlock:^(MVPTableViewCell *  _Nonnull cell, Model *  _Nonnull mode, NSIndexPath * _Nonnull indexPath) {
        cell.nameLabel.text = mode.name;
        cell.numLabel.text = mode.num;
        cell.num = [mode.num intValue];
        cell.indexPath = indexPath;
        cell.delegate = weakSelf.vm;
        
    } selectBlock:^(NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"点击了%ld行cell",(long)indexPath.row);
        
    } reloadData:^(NSMutableArray * _Nonnull array) {
        
        weakSelf.vm.dataArray = array;
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self.skProxy;
    self.tableView.delegate = self.skProxy;
    
    //----ViewModel的操作 把数据带回来  更新UI
    self.vm = [[MVVMViewModel alloc]init];
    [self.vm initWithBlock:^(id  _Nonnull data) {
        
        weakSelf.skProxy.dataArray = [weakSelf.vm.dataArray mutableCopy];
        [weakSelf.tableView reloadData];
        weakSelf.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"合计:%d",[weakSelf.vm total]];
        
    } fail:^(id  _Nonnull data) {
        
    }];
    
    //加载数据
    [self.vm loadData];
}

- (void)dealloc
{
    NSLog(@"dealloc--- %@",self);
}

@end
