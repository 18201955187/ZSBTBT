//
//  SeachTypeCell.m
//  SeachView
//
//  Created by DJ on 16/12/1.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "SeachTypeCell.h"

@implementation SeachTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)msGetInstance {
    return [[[NSBundle mainBundle] loadNibNamed:[[self class] msGetCellId] owner:nil options:nil] firstObject];
}

+ (NSString *)msGetCellId{
    return @"SeachTypeCell";
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
