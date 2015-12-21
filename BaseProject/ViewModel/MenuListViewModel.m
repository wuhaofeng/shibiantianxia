//
//  MenuListViewModel.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuListViewModel.h"
#import "MenuListNetManager.h"
#import "MenuListModel.h"
@implementation MenuListViewModel
-(instancetype)initWithText:(NSString *)text{
    if (self=[super init]) {
        self.text=text;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s,必须使用initWithText方法", __func__);
    }
    return self;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;

}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.offset=20;
    self.start=0;
    [self getDataFromNetCompleteHandle:completionHandle];

}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start=self.offset;
    self.offset+=20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if (self.offset==20) {
        [self.dataArr removeAllObjects];
    }
    [MenuListNetManager getWithText:self.text offset:self.offset start:self.start completionhandle:^(MenuListModel  *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.result];
        completionHandle(error);
    }];
}
-(MenuListResultModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];

}
-(NSURL*)thumbnailForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumbnail];

}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;

}
-(NSString *)cookingTimeForRow:(NSInteger)row{
    return [self modelForRow:row].cookingTime;
}
-(NSString *)tasteForRow:(NSInteger)row{
    return [self modelForRow:row].taste;

}
-(NSString *)likesForRow:(NSInteger)row{
    return [self modelForRow:row].likes;

}
-(NSString *)IDForRow:(NSInteger)row{
    return [self modelForRow:row].id;

}
@end
