//
//  SKProxy.h
//  MVP--MVVM
//
//  Created by Code_Hou on 2019/3/7.
//  Copyright © 2019年 侯森魁. All rights reserved.
//
//这个类承担了VC中tableView代理的方法实现

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CellConfigureBefore)(id cell,id mode,NSIndexPath *indexPath);

typedef void(^selectCell)(NSIndexPath *indexPath);

typedef void(^reloadData)(NSMutableArray *array);
@interface SKProxy : NSObject <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;

//自定义
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before selectBlock:(selectCell)selectBlock reloadData:(reloadData) reloadData;

- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtnIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
