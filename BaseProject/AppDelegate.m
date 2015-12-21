//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "MenuViewModel.h"
#import "LeftViewController.h"
@interface AppDelegate ()
@property(nonatomic,strong)RESideMenu *sideMenu;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeWithApplication:application];
    self.window.rootViewController=self.sideMenu;
    [self configGloalUIStyle];
    return YES;
}
/**配置全局UI的样式*/
-(void)configGloalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance]setTranslucent:NO];
    /** 设置导航栏背景图*/
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:(UIBarMetricsDefault)];
    /** 配置导航栏题目的样式*/
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldFlatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
    
    
}
-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
        UINavigationController *vc=kVCFromSb(@"Navi1", @"Main");
        UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:[LeftViewController new]];
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:vc leftMenuViewController:navi rightMenuViewController:nil];
        _sideMenu.backgroundImage=[UIImage imageNamed:@"4"];
        //可以让出现时菜单不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden=YES;
        //不允许菜单栏缩小到了边缘还可以缩小
        _sideMenu.bouncesHorizontally=NO;
    }
    return _sideMenu;
}
@end
