//
//  MVVMViewModel.h
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//
#import "BaseViewModel.h"
#import "PresentDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVVMViewModel : BaseViewModel<PresentDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;

- (void)loadData;

#pragma mark ---计算总数
- (int)total;

@end

NS_ASSUME_NONNULL_END
