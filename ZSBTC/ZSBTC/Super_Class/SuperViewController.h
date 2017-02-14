//
//  SuperViewController.h
//  ZSBTB
//
//  Created by DJ on 16/12/15.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ZSNavBarView.h"

@interface SuperViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (void)initNavBar:(NavBarType)navBarType title:(NSString*)title;
@end
