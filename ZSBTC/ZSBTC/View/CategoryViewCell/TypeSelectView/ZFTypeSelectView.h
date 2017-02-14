//
//  ZFTypeSelectView.h
//  SeachView
//
//  Created by DJ on 16/11/30.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZFTypeSelectView_DidSelect_Block)(NSString *contentStr);
typedef void(^ZFTypeSelectView_Blank_Tap)(void);

@interface ZFTypeSelectView : UIView

@property (nonatomic,copy)ZFTypeSelectView_DidSelect_Block typeSelectView_DidSelect_Block;
@property (nonatomic,strong) ZFTypeSelectView_Blank_Tap typeSelectView_Blank_Tap;

@property (nonatomic,strong)NSMutableArray *DataArray;
@property (nonatomic,strong)UITableView *tableView;

- (void)setZFTypeSeachViewDataArray:(NSMutableArray*)array;
- (void)addContentView:(CGRect)frame;
@end
