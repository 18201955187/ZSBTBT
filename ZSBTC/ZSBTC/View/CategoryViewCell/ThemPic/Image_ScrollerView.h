//
//  Image_ScrollerView.h
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Image_ScrollerViewDelegate <NSObject>

- (void)Image_ScrollerView_SingleTap_Delegate;

@end


@interface Image_ScrollerView : UIScrollView<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,weak)id<Image_ScrollerViewDelegate>Tap_single_delegate;

@property (nonatomic,strong)UIImageView *contentImage;
- (void)setScrollerImage:(NSString*)imageName;
@property (nonatomic,assign) BOOL tapClicks;
@end
