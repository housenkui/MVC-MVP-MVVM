//
//  MVPViewController.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "MVPViewController.h"
#import "Target.h"
#import "MVPTableViewCell.h"
#import "Model.h"

#import "Present.h"

static NSString *const reuserId = @"resultId";

@interface MVPViewController ()<PresentDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)Present *pt;
@property (nonatomic,strong)Target *subTarget;

@end

@implementation MVPViewController

/*
 1.解耦
 2.接重：NSObject
    -| 中介
    -| 封装
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.pt = [[Present alloc]init];
    __weak typeof (self) weakSelf = self;
    self.subTarget = [[Target alloc]initWithIdentifier:reuserId configureBlock:^(MVPTableViewCell * cell, Model * model, NSIndexPath *indexPath) {
        //函数式编程
        //Rac 编程思想的集大成者
        cell.nameLabel.text = model.name;
        cell.numLabel.text = model.num;
        cell.indexPath = indexPath;
        cell.delegate = weakSelf.pt;

    } selectBlock:^(NSIndexPath *indexPath) {
        
        NSLog(@"点击了%ld行cell",(long)indexPath.row);
    }];
    [self.subTarget addDataArray:self.pt.dataArray];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.subTarget;
    self.tableView.delegate = self.subTarget;
    self.pt.deleagte = self;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:reuserId];
    }
    return _tableView;
}
- (void)reloadDataForUI{
    
    [self.subTarget addDataArray:self.pt.dataArray];
    
    [self.tableView reloadData];
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
