//
//  MenuListNetManager.h
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface MenuListNetManager : BaseNetManager
+(id)getWithText:(NSString *)text offset:(NSInteger)offset start:(NSInteger)start completionhandle:(void(^)(id model,NSError *error))completionhandle;
@end
