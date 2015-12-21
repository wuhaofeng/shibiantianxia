//
//  MenuModel.h
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface MenuModel : BaseModel
@property(nonatomic,strong)NSArray *links;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *slug;
@end
@interface MenuLinksModel : BaseModel
@property(nonatomic,strong)NSString *href;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)NSString *thumb;
@end