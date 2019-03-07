//
//  BaseViewModel.m
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    _successBlock = successBlock;
    _failBlock = failBlock;
}
@end
