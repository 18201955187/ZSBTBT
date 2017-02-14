//
//  ZSTaBarController.m
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ZSTaBarController.h"

#import "HomeViewConroller.h"
#import "CartViewController.h"
#import "UserViewController.h"
#import "CartViewController.h"


@interface ZSTaBarController ()



@end

@implementation ZSTaBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTabBar];
    [self setTabBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTabBar{
    
    UIStoryboard* Home_story = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UINavigationController* HomeNav = [Home_story instantiateViewControllerWithIdentifier:@"HomeNav"];

    UIStoryboard* Category_story = [UIStoryboard storyboardWithName:@"Category" bundle:nil];
    UINavigationController* CategoryNav = [Category_story instantiateViewControllerWithIdentifier:@"CategoryNav"];
    
    UIStoryboard* Cart_story = [UIStoryboard storyboardWithName:@"Cart" bundle:nil];
    UINavigationController* CartNav = [Cart_story instantiateViewControllerWithIdentifier:@"CartNav"];
    
    UIStoryboard* User_story = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController* UserNav = [User_story instantiateViewControllerWithIdentifier:@"UserNav"];
    
    NSArray* array = [[NSArray alloc]initWithObjects: HomeNav,CategoryNav,CartNav,UserNav,nil];
    self.viewControllers = array;
    self.delegate = self;
    
    
    self.tabBar.translucent = NO;
    [self.tabBar setClipsToBounds:NO];
    
    self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.tabBar.layer.shadowOffset = CGSizeMake(1,-2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.tabBar.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    self.tabBar.layer.shadowRadius = 2;//阴影半径，默认3
}

- (void)setTabBarItem{
    
    UITabBarItem* HometabBarItem = self.tabBar.items[0];
    HometabBarItem.title = @"首页";
    HometabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"account_highlight"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    HometabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"account_normal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem* CategorytabBarItem = self.tabBar.items[1];
    CategorytabBarItem.title = @"分类";
    CategorytabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"fish_highlight"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CategorytabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"fish_normal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.CartabBarItem = self.tabBar.items[2];
    self.CartabBarItem.title = @"购物车";
    
    self.CartabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"message_highlight"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.CartabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"message_normal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem* UsertabBarItem = self.tabBar.items[3];
    UsertabBarItem.title = @"个人中心";
    UsertabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"home_highlight"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UsertabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"home_normal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
}

- (void)setTabBarIndex:(NSInteger)index{
    self.selectedIndex = index;
}

- (void)setCartabBarItembadgeValue:(NSString*)ValueStr{
    self.CartabBarItem.badgeValue = ValueStr;
}






#pragma mark -- tabBarViewControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
