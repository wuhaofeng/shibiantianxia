//
//  MenuViewModel.h
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface MenuViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
-(NSString*)textForRow:(NSInteger)row;
-(NSURL *)iconUrlForRow:(NSInteger)row;
@property(nonatomic,strong)NSArray *imageURLs;
@end
