//
//  MenuNetManager.h
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface MenuNetManager : BaseNetManager
+(id)getMenuWithCompletionhandle:(void(^)(id model,NSError *error))completionhandle;
@end
