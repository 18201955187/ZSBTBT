//
//  ThemViewCell.m
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ThemViewCell.h"

#import "UIImageView+WebCache.h"

@implementation ThemViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setThemViewCell_ContentImage:(NSString*)imageName{
    NSURL * dataUrl = [NSURL URLWithString:imageName];
    [self.contentImage sd_setImageWithURL:dataUrl placeholderImage:nil];
}


@end
