//
//  Target.h
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

typedef void (^CellConfigureBefore)(id cell,id model,NSIndexPath *indexPath);

typedef void (^SelectCell)(NSIndexPath *indexPath);

NS_ASSUME_NONNULL_BEGIN

@interface Target : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataArray;

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before selectBlock:(SelectCell)selectBlock;

- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
