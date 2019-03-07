//
//  Target.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "Target.h"
@interface Target()

@property (nonatomic,copy)NSString *cellIdentifier;

@property (nonatomic,copy)CellConfigureBefore cellConfigureBefore;

@property (nonatomic,copy)SelectCell selectCellBlock;

@end

@implementation Target

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before selectBlock:(SelectCell)selectBlock {
    if (self = [super init]) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
        _selectCellBlock = [selectBlock copy];
    }
    return self;
}
- (void)addDataArray:(NSArray *)datas{
    if (!datas) {
        return;
    }
    if (self.dataArray.count >0) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:datas];
}

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] :nil;
}
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return !self.dataArray ? 0:self.dataArray.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    id model = [self modelsAtIndexPath:indexPath];
    
    if (self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model, indexPath);
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //将点击事件通过block方式传递h出去
    self.selectCellBlock(indexPath);
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
}
@end
