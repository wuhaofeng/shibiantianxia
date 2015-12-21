//
//  NSObject+Common.m
//  FDPublic
//
//  Created by 刘伟 on 15/6/19.
//  Copyright (c) 2015年 timShadow. All rights reserved.
//

#import "NSObject+Common.h"

#define kToastDuration     1

@implementation NSObject (Common)
/*
//显示失败提示
- (void)showErrorMsg:(NSString *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//显示成功提示
- (void)showSuccessMsg:(NSString *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//显示忙
- (void)showProgress{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//隐藏提示
- (void)hideProgress{
    [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
}

- (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    return controller.view;
}

@end
