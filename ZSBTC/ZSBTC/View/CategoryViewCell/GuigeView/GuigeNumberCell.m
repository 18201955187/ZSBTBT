//
//  GuigeNumberCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "GuigeNumberCell.h"

@implementation GuigeNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.number = 1;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.numberLabel.backgroundColor = Color_RGBA(246, 246, 246, 1);
    self.addNumberBtn.backgroundColor =Color_RGBA(246, 246, 246, 1);
    self.subtractNumberBtn.backgroundColor = Color_RGBA(249, 249, 249, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)msGetInstance{
    return [[[NSBundle mainBundle] loadNibNamed:[[self class] msGetCellId] owner:nil options:nil] firstObject];
}

+ (NSString *)msGetCellId{
    return @"GuigeNumberCell";
}
- (IBAction)subtractNumberBtnClick:(UIButton *)sender {
    //self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
    if (self.number<=1) {
        self.subtractNumberBtn.backgroundColor = Color_RGBA(249, 249, 249, 1);
        return;
    }
    else{
        self.number--;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
    }
}

- (IBAction)addNumberBtnClick:(UIButton *)sender {
    self.number++;
    self.subtractNumberBtn.backgroundColor = Color_RGBA(246, 246, 246, 1);
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.number];
}

@end
