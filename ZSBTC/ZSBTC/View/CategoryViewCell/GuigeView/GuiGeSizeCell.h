//
//  GuiGeSizeCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GuiGeSizeCell_HightBlock)(CGFloat CellHight);

@interface GuiGeSizeCell : UITableViewCell
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,assign)NSInteger BtnTag;
@property (nonatomic,copy) GuiGeSizeCell_HightBlock Cell_HightBlock;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *contentBackView;
+ (instancetype)msGetInstance;
- (void)setGuiGeColorSizeCell:(NSString*)title withDataArray:(NSMutableArray*)dataArray withCellHightBlock:(void(^)(CGFloat CellHight))CellHightBlock;
@end
