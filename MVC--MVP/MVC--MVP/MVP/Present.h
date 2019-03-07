//
//  Present.h
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresentDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Present : NSObject <PresentDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;

//根据需求
- (void)loadData;
@property (nonatomic,weak)id <PresentDelegate>deleagte;
@end

NS_ASSUME_NONNULL_END
