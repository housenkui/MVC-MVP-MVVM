//
//  PresentDelegate.h
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PresentDelegate <NSObject>
@optional
//刷新UI ---> tableview vc
- (void)reloadDataForUI;

//解耦
//需求：需求驱动代码 清晰
//维护：快

//UI-->model
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
