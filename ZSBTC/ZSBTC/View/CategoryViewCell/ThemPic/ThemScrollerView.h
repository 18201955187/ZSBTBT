//
//  ThemScrollerView.h
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image_ScrollerView.h"

@protocol ThemScrollerViewDelegate <NSObject>

- (void)ThemScrollerViewToIndex:(NSInteger)index;

@end

@interface ThemScrollerView : UIView<UIScrollViewDelegate,Image_ScrollerViewDelegate>

@property (nonatomic,weak)id<ThemScrollerViewDelegate>delegate;

@property (nonatomic,assign)NSInteger index;

- (void)loadScroller;
- (void)loadItemScroller:(NSMutableArray*)dataArray index:(NSInteger)index;
@property (nonatomic,strong)UIScrollView *backScroller;
@end
