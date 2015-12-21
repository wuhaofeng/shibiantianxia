//
//  MenuViewModel.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuViewModel.h"
#import "MenuNetManager.h"
#import "MenuModel.h"
@implementation MenuViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;

}
-(NSArray *)imageURLs{
    if (!_imageURLs) {
        _imageURLs=[NSArray new];
    }
    return _imageURLs;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
self.dataTask=[MenuNetManager getMenuWithCompletionhandle:^(MenuModel *model, NSError *error) {
    [self.dataArr addObjectsFromArray:model.links];
    NSMutableArray *imgUrls=[NSMutableArray new];
    for (int i=0;i<self.dataArr.count;i++) {
        [imgUrls addObject:[self iconUrlForRow:i]];
    }
    self.imageURLs=[imgUrls copy];
    completionHandle(error);
}];
}
-(MenuLinksModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];

}
-(NSString*)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
-(NSURL *)iconUrlForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://cookbook-cn.appcookies.com/%@",[self modelForRow:row].thumb]];
}
@end
