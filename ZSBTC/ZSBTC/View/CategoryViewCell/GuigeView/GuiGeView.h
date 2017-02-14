//
//  GuiGeView.h
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^GuiGeView_TapBg_Block)(void);

@protocol GuiGeView_Delegate <NSObject>

- (void)confirmClicked;


@end

@interface GuiGeView : UIView<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic,weak) id<GuiGeView_Delegate>delegate;
@property (nonatomic,copy) GuiGeView_TapBg_Block TapBg_Block;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIImageView *productImg;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *linView;
@property (nonatomic,strong) UIButton *confirmBtn;
@property (nonatomic,strong) UIButton *delectBtn;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *StockNumber;
@property (nonatomic,strong) UILabel *guigeLabel;

@property (nonatomic,assign) CGFloat Cell_OneHight;
@property (nonatomic,assign) CGFloat Cell_TwoHight;

@property (nonatomic,strong)NSMutableArray *SizeArray;
@property (nonatomic,strong)NSMutableArray *ColorArray;
- (void)reloadSizeArray:(NSMutableArray*)SizeArray ColorArray:(NSMutableArray*)ColorArray;

@end
