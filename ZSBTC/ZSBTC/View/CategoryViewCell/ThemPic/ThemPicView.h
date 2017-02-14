//
//  ThemPicView.h
//  collectionView
//
//  Created by DJ on 17/1/4.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ThemViewCell.h"

#import "ThemScrollerView.h"

typedef void(^ThemPicViewContentOffent_Block)(void);

@interface ThemPicView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,ThemScrollerViewDelegate>
@property (nonatomic,copy) ThemPicViewContentOffent_Block ContentOffent_Block;

- (void)initSelf;
- (void)setThemPicViewData:(NSMutableArray*)array;
@property (nonatomic,strong)UIPageControl*pageControl;
@property (nonatomic,strong)NSMutableArray *themImageArray;
@property (nonatomic,strong)UICollectionView*collectionView;
@property (nonatomic,retain)UICollectionViewFlowLayout* flowLayout;

@end
