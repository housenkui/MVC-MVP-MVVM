//
//  Model.h
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *imageUrl;
@property (nonatomic,copy)NSString *num;

@end

NS_ASSUME_NONNULL_END
