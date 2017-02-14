//
//  GuiGeColorCell.h
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GuiGeColorCell_HightBlock)(CGFloat CellHight);

@interface GuiGeColorCell : UITableViewCell
@property (nonatomic,copy) GuiGeColorCell_HightBlock Cell_HightBlock;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *contentBackView;
@property (nonatomic,assign)NSInteger BtnTag;
+ (instancetype)msGetInstance;
- (void)setGuiGeColorSizeCell:(NSString*)title withDataArray:(NSMutableArray*)dataArray withCellHightBlock:(void(^)(CGFloat CellHight))CellHightBlock;
@end
