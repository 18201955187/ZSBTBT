//
//  UesrCommonTypeCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UesrCommonTypeCell.h"

@implementation UesrCommonTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = Color_RGB(240, 240, 240);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)msGetInstance {
    return [[NSBundle mainBundle] loadNibNamed:@"UesrCommonTypeCell" owner:self options:nil][0];
}

- (void)LoadUesrCommonTypeCell:(NSString*)title editTitle:(NSString*)editTitle withClickBlock:(UesrCommonTypeCell_Block)clicked{
    self.TypeCell_Block = clicked;
    self.titleLabel.text = title;
    self.editTypeLabel.text = editTitle;
}
- (IBAction)tapCkick:(UITapGestureRecognizer *)sender {
    if (self.TypeCell_Block) {
        self.TypeCell_Block();
    }
}

@end
