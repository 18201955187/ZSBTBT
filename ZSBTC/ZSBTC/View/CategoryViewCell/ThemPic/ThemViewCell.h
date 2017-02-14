//
//  ThemViewCell.h
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemViewCell : UICollectionViewCell

- (void)setThemViewCell_ContentImage:(NSString*)imageName;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@end
