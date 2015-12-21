//
//  MenuNetManager.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuNetManager.h"
#import "MenuModel.h"
@implementation MenuNetManager
+(id)getMenuWithCompletionhandle:(void(^)(id model,NSError *error))completionhandle{
NSString *path=@"http://cookbook-cn.appcookies.com/article/link_container/com.appcookies.CookBook.json";
    return [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionhandle([MenuModel objectWithKeyValues:responseObj],error);
    }];

}
@end
