//
//  MenuListModel.h
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class MenuListPagingModel;
@interface MenuListModel : BaseModel
@property(nonatomic,strong)MenuListPagingModel *paging;
@property(nonatomic,strong)NSArray *result;
@property(nonatomic,strong)NSString  *status;
@end
@interface MenuListPagingModel : BaseModel
@property(nonatomic,strong)NSString *next;
@property(nonatomic)NSInteger offset;
@property(nonatomic)NSInteger *start;
@end
@interface MenuListResultModel : BaseModel
@property(nonatomic,strong)NSString *cookingDifferent;
@property(nonatomic,strong)NSString *cookingTime;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *likes;
@property(nonatomic,strong)NSString *publishAt;
@property(nonatomic,strong)NSString *taste;
@property(nonatomic,strong)NSString *thumbnail;
@property(nonatomic,strong)NSString *title;
@end