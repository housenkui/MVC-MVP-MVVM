//
//  MVPTableViewCell.h
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVPTableViewCell : UITableViewCell
@property (nonatomic,strong)UIButton *subBtn;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *numLabel;
@property (nonatomic,strong)UIButton *addBtn;

@property (nonatomic,assign)int num;
@property (nonatomic,strong)NSIndexPath *indexPath;

@property (nonatomic,weak)id<PresentDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
