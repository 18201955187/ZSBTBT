//
//  GuigeNumberCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuigeNumberCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *addNumberBtn;
@property (weak, nonatomic) IBOutlet UIButton *subtractNumberBtn;

@property (nonatomic,assign)NSInteger number;

+ (instancetype)msGetInstance;
@end
