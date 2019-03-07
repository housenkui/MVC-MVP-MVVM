//
//  MVCViewController.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "MVCViewController.h"

static NSString *const resuerId = @"resuerId";

@interface MVCViewController ()<PresentDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)Target *subTarget;
@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    __weak __typeof(self) weakSelf = self;
    self.subTarget = [[Target alloc]initWithIdentifier:resuerId configureBlock:^(MVPTableViewCell* cell, Model * model, NSIndexPath *indexPath) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        cell.delegate = strongSelf;
        cell.indexPath = indexPath;
        cell.nameLabel.text = model.name;
        cell.numLabel.text = model.num;
    } selectBlock:^(NSIndexPath *indexPath) {
        
        NSLog(@"点击了%ld行cell",(long)indexPath.row);
    
    }];
    [self.subTarget addDataArray:self.dataArray];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate =  self.subTarget;
    self.tableView.dataSource = self.subTarget;
    
    // Do any additional setup after loading the view.
}
#pragma mark ---加载数据
- (void)loadData{
    NSArray *temArray = @[ @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"adn",@"imageUrl":@"http://Dean ",@"num":@"9"},
                           @{@"name":@"sd",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"adin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adfci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"Dsdfn",@"imageUrl":@"http://Dean ",@"num":@"9"}
                          ];
    //字典转模型
    for (int i = 0 ; i<temArray.count; i++) {
        Model *m = [Model modelWithDictionary:temArray[i]];
        [self.dataArray addObject:m];
        
    }
}

- (void)reloadDataForUI{
    
    [self.subTarget addDataArray:self.dataArray];
    [self.tableView reloadData];
}

#pragma mark--PresentDelegate
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath{
    Model *m = self.dataArray[indexPath.row];
    m.num = num;
    
    if ([num intValue] >6) {
        NSArray *array = @[
                           @{@"name":@"CfC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"sadfa",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"sderfx",@"imageUrl":@"http://Cooci",@"num":@"9"}
                           ];
        [self.dataArray removeAllObjects];
        for (int i = 0 ; i<array.count; i++) {
            Model *m = [Model modelWithDictionary:array[indexPath.row]];
            [self.dataArray addObject:m];
        }
        //根据indexPath获取cell
        MVPTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if(cell.delegate &&[cell.delegate respondsToSelector:@selector(reloadDataForUI)]){
            [cell.delegate reloadDataForUI];
        }
    }
}


#pragma mark---lazy
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:resuerId];
    }
    return _tableView;
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
