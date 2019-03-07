//
//  BaseViewModel.h
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(id data);
@interface BaseViewModel : NSObject
@property (nonatomic,copy) SuccessBlock successBlock;
@property (nonatomic,copy) FailBlock failBlock;
- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock) failBlock;
@end

NS_ASSUME_NONNULL_END
