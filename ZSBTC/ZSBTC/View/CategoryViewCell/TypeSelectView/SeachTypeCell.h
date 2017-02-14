//
//  SeachTypeCell.h
//  SeachView
//
//  Created by DJ on 16/12/1.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SeachTypeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
+ (instancetype)msGetInstance;
@end
