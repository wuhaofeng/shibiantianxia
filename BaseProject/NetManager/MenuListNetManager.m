//
//  MenuListNetManager.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuListNetManager.h"
#import "MenuListModel.h"
@implementation MenuListNetManager
+(id)getWithText:(NSString *)text offset:(NSInteger)offset start:(NSInteger)start completionhandle:(void(^)(id model,NSError *error))completionhandle{
    NSString *path=[NSString stringWithFormat:@"http://cookbook-cn.appcookies.com/article/list_by_tag/%@.json?order=title&offset=%@&start=%@",text,@(offset),@(start)];
   path=[BaseNetManager percentPathWithPath:path params:nil];
    NSLog(@"path:%@",path);
    return [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionhandle([MenuListModel objectWithKeyValues:responseObj],error);
        
    }];
}
@end
