//
//  Present.m
//  MVC--MVP
//
//  Created by Code_Hou on 2019/3/6.
//  Copyright © 2019年 侯森魁. All rights reserved.
//

#import "Present.h"
#import "NSObject+YYModel.h"
#import "Model.h"
 #import <UIKit/UIkit.h> 
@implementation Present
- (instancetype)init {
    if (self = [super init]) {
        [self loadData];
    }
    return self;
}
- (void)loadData {
    
    NSArray *tempArray = @[
                           @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"adn",@"imageUrl":@"http://Dean ",@"num":@"9"},
                           @{@"name":@"sd",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"adin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adfci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"CadsC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"Jadsfes",@"imageUrl":@"http://James",@"num":@"9"},
                           @{@"name":@"Gadsfin",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"adci",@"imageUrl":@"http://Cooci",@"num":@"9"},
                           @{@"name":@"Dsdfn",@"imageUrl":@"http://Dean ",@"num":@"9"}
                           ];
    for (int i = 0 ; i<tempArray.count; i++) {
        
        Model *m = [Model modelWithDictionary:tempArray[i]];
        
        [self.dataArray addObject:m];
    }
}

#pragma mark --lazy
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

#pragma mark --PresentDelegate
- (void)didClickAddBtnWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath
{
//    Model *m = self.dataArray[indexPath.];
    Model *m = self.dataArray[indexPath.row];
    m.num = num;
    
    if ([num intValue] >6) {
        NSArray *array = @[
                           @{@"name":@"CfC",@"imageUrl":@"http://CC",@"num":@"9"},
                           @{@"name":@"sadfa",@"imageUrl":@"http://Gavin",@"num":@"9"},
                           @{@"name":@"sderfx",@"imageUrl":@"http://Cooci",@"num":@"9"}
                           ];
        [self.dataArray removeAllObjects];
        for (int i = 0 ; i<array.count; i++) {
            Model *m = [Model modelWithDictionary:array[i]];
            [self.dataArray addObject:m];
        }
        if (self.deleagte && [self.deleagte respondsToSelector:@selector(reloadDataForUI)]) {
            [self.deleagte reloadDataForUI];
        }
    }

}
@end
