//
//  MenuViewController.m
//  BaseProject
//
//  Created by ios on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuViewController.h"
#import "iCarousel.h"
#import "MenuViewModel.h"
#import "TRImageView.h"
#import "MenuListTableViewController.h"
@interface MenuViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)iCarousel *ic;
@property(nonatomic,strong)MenuViewModel *menuVM;
@end

@implementation MenuViewController
-(MenuViewModel *)menuVM{
    if (!_menuVM) {
        _menuVM=[MenuViewModel new];
    }
    return _menuVM;
}
-(iCarousel *)ic{
    if (!_ic) {
        _ic=[[iCarousel alloc]init];
        [self.view addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _ic.delegate=self;
        _ic.dataSource=self;
        _ic.type=3;
        _ic.autoscroll=0.5;
        
    }
  return  _ic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.menuVM getDataFromNetCompleteHandle:^(NSError *error) {
        self.ic.pagingEnabled=YES;
    }];
    [Factory addMenuItemToVC:self];
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //修改缝隙
    if (option==iCarouselOptionSpacing) {
        return value*1.5;
    }
    if (option==iCarouselOptionWrap) {
        return YES;
    }
  
    return value;

}
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.menuVM.imageURLs.count;

}

-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW-10, kWindowH/2+50)];
        TRImageView *imageView=[TRImageView new];
        imageView.tag=100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
        UILabel *textLabel=[UILabel new];
        textLabel.tag=200;
        [view addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
            make.top.left.right.mas_equalTo(0);
        }];
        textLabel.numberOfLines=0;
        textLabel.font=[UIFont boldSystemFontOfSize:22];
        textLabel.textAlignment=UITextAlignmentCenter;
    }
    TRImageView *imageView=(TRImageView *)[view viewWithTag:100];
    [imageView.imageView setImageWithURL:self.menuVM.imageURLs[index]];
    UILabel *label=(UILabel *)[view viewWithTag:200];
    label.text=[self.menuVM textForRow:index];
    return view;
}
//两个cell之间的距离
-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return kWindowW-10;
}
//用于跳转
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    MenuListTableViewController *vc=kVCFromSb(@"MenuListVC", @"Main");
    vc.text=[self.menuVM textForRow:index];
    vc.title=[self.menuVM textForRow:index];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
