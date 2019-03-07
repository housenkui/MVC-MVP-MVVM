//
//  MVVMViewModel.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

// 只在viewModel里进行 数据请求 和逻辑处理 绝不写在V里
#import "MVVMViewModel.h"

@implementation MVVMViewModel
#pragma mark ---lazy
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
   NSLog(@"%@ change ",change[NSKeyValueChangeNewKey]);
    self.successBlock(change[NSKeyValueChangeNewKey]);
}
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"dataArray"];
}
- (void)loadData {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSArray *temArray = @[
                              @{@"name":@"火车",@"imageUrl":@"http://CC",@"num":@"1"},
                              @{@"name":@"飞机",@"imageUrl":@"http://James",@"num":@"1"},
                              @{@"name":@"跑车",@"imageUrl":@"http://Gavin",@"num":@"1"},
                              @{@"name":@"女票",@"imageUrl":@"http://Cooci",@"num":@"1"},
                              @{@"name":@"男票",@"imageUrl":@"http://Dean ",@"num":@"1"},
                              @{@"name":@"滑板",@"imageUrl":@"http://CC",@"num":@"1"},
                              @{@"name":@"一日游",@"imageUrl":@"http://James",@"num":@"1"}
                              ];
        [self.dataArray removeAllObjects];
        for (int i = 0 ; i<temArray.count ; i++) {
            Model *m = [Model modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }
        //子线程网络请求
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //主线程刷新数据
            self.successBlock(self.dataArray);
            
        });
    });
}
#pragma mark--PresentDelegate

- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath {
    
    Model *m = [self.dataArray objectAtIndex:indexPath.row];
    m.num = num;
    
    if ([num intValue] >6) {
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
        for (int i = 0 ; i<temArray.count; i++) {
            Model *m = [Model modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }
    }
    self.successBlock(self.dataArray);
}

- (int)total {
    int total = 0;
    //所有元素的总票数
    for (Model *model in self.dataArray) {
        int num = [model.num intValue];
        total += num;
    }
    return total;
}
@end
