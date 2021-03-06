//
//  Present.h
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Present : NSObject<PresentDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,weak)id <PresentDelegate>delegate;
- (void)loadData;

#pragma mark --计算总数
- (int)total;

@end

NS_ASSUME_NONNULL_END
