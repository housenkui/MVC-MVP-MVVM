//
//  SKProxy.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//
//这个类承担了VC中tableView代理的方法实现
#import "SKProxy.h"
@interface SKProxy ()

@property (nonatomic,copy) NSString *cellIdentifier;
@property (nonatomic,copy) CellConfigureBefore cellConfigBefore;
@property (nonatomic,copy) selectCell selectBlock;
@property (nonatomic,copy) reloadData reloadData;

@end
@implementation SKProxy

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before selectBlock:(selectCell)selectBlock reloadData:(reloadData)reloadData
{
    if (self = [super init]) {
        _cellIdentifier = identifier;
        _cellConfigBefore = before;
        _selectBlock = selectBlock;
        _reloadData = reloadData;
    }
    return self;
}
- (void)addDataArray:(NSArray *)datas {
    
    if(!datas)return;
    if (self.dataArray.count > 0) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:datas];
}
- (id)modelsAtnIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count >indexPath.row ? self.dataArray[indexPath.row]:nil;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return !self.dataArray ? 0:self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id models = [self modelsAtnIndexPath:indexPath];
    if(self.cellConfigBefore){
        self.cellConfigBefore (cell,models,indexPath);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //将点击事件通过block的方式传递出去
    self.selectBlock(indexPath);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak __typeof(self) weakSelf = self;
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
        weakSelf.reloadData(weakSelf.dataArray);
        NSLog(@"删除");
    }];
    return @[deleteRowAction];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
}

@end
