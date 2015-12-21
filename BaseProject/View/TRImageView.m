//
//  TRImageView.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView
-(id)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        if(_imageView.frame.size.height >= kWindowH && _imageView.frame.size.width <= 320){
            _imageView.contentMode = 2;//保持宽高完全没变
        }
        if(_imageView.frame.size.width > 320){
             _imageView.contentMode = 1;//所有的都适应
        }
//        else {
//            _imageView.contentMode = 2;
//        }
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
