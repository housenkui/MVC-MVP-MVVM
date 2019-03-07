//
//  Present.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "Present.h"

@implementation Present
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}
- (void)loadData{
    NSArray *temArray = @[
                          @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"1"},
                          @{@"name":@"飞机",@"imageUrl":@"http://James",@"num":@"1"},
                          @{@"name":@"跑车",@"imageUrl":@"http://Gavin",@"num":@"1"},
                          @{@"name":@"女票",@"imageUrl":@"http://Cooci",@"num":@"1"},
                          @{@"name":@"男票",@"imageUrl":@"http://Dean ",@"num":@"1"},
                          @{@"name":@"滑板",@"imageUrl":@"http://CC",@"num":@"1"},
                          @{@"name":@"一日游",@"imageUrl":@"http://James",@"num":@"1"}
                          ];
    
    for (int i = 0 ; i<temArray.count; i++) {
        
        Model *m = [Model modelWithDictionary:temArray[i]];
        [self.dataArray addObject:m];
    }
}

#pragma mark --PresentDelegae
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath
{
    Model *m = self.dataArray[indexPath.row];
    m.num = num;
    
    if ([num intValue] > 6) {
        NSArray *temArray = @[
                              @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"6"},
                              @{@"name":@"飞机",@"imageUrl":@"http://James",@"num":@"6"},
                              @{@"name":@"跑车",@"imageUrl":@"http://Gavin",@"num":@"6"},
                              @{@"name":@"女票",@"imageUrl":@"http://Cooci",@"num":@"6"},
                              @{@"name":@"男票",@"imageUrl":@"http://Dean ",@"num":@"6"},
                              @{@"name":@"滑板",@"imageUrl":@"http://CC",@"num":@"6"},
                              @{@"name":@"一日游",@"imageUrl":@"http://James",@"num":@"6"}
                              ];
        [self.dataArray removeAllObjects];
        for (int i = 0 ; i < temArray.count; i++) {
            Model *m = [Model modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadDataForUI)]) {
        [self.delegate reloadDataForUI];
    }
}
#pragma mark--计算总数
- (int)total{
    int total = 0;
    for (Model *model in self.dataArray) {
        int num = [model.num intValue];
        total += num;
    }
    return total;
}
@end
