//
//  UereGeneralActionCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/22.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UereGeneralActionCell.h"
#import "UserOrderItemStatusView.h"

@implementation UereGeneralActionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}




+ (instancetype)msGetInstance {
    return [[NSBundle mainBundle] loadNibNamed:@"UereGeneralActionCell" owner:self options:nil][0];
}

- (void)LoadUereGeneralActionCellWithOne_Block:(ActionCell_One_Block)clicked{
    self.Cell_One_Block = clicked;
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithObjects:@"我的收藏",@"购物足迹",@"店铺钱包",@"乐赚", nil];
    NSMutableArray *ImgNameArray = [[NSMutableArray alloc]initWithObjects:@"collect1",@"collect2",@"collect3",@"collect4", nil];
    
    
    int i = 0;
    do {
        UserOrderItemStatusView *view = [[UserOrderItemStatusView alloc]initWithFrame:CGRectMake(i*Screen_Width/4, 0, Screen_Width/4, self.height) title:[NSString stringWithFormat:@"%@",[titleArray objectAtIndex:i]] imageName:[NSString stringWithFormat:@"%@",[ImgNameArray objectAtIndex:i]]];
        view.tag = i;
        UITapGestureRecognizer *OneTapSingle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OneTapSingleClick:)];
        OneTapSingle.numberOfTapsRequired = 1;
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:OneTapSingle];
        [self addSubview:view];
        i++;
        
    } while (i<titleArray.count);
}

- (void)LoadUereGeneralActionCell_Two{
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithObjects:@"会员中心",@"积分商城",@"客服中心",@"帮助与反馈", nil];
    NSMutableArray *ImgNameArray = [[NSMutableArray alloc]initWithObjects:@"collect2",@"collect4",@"collect3",@"collect1", nil];
    
    
    int i = 0;
    do {
        UserOrderItemStatusView *view = [[UserOrderItemStatusView alloc]initWithFrame:CGRectMake(i*Screen_Width/4, 0, Screen_Width/4, self.height) title:[NSString stringWithFormat:@"%@",[titleArray objectAtIndex:i]] imageName:[NSString stringWithFormat:@"%@",[ImgNameArray objectAtIndex:i]]];
        [self addSubview:view];
        i++;
        
    } while (i<titleArray.count);
}

- (void)LoadUereGeneralActionCell_Three{
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithObjects:@"我的预约", nil];
    NSMutableArray *ImgNameArray = [[NSMutableArray alloc]initWithObjects:@"collect3", nil];
    int i = 0;
    do {
        UserOrderItemStatusView *view = [[UserOrderItemStatusView alloc]initWithFrame:CGRectMake(i*Screen_Width/4, 0, Screen_Width/4, self.height) title:[NSString stringWithFormat:@"%@",[titleArray objectAtIndex:i]] imageName:[NSString stringWithFormat:@"%@",[ImgNameArray objectAtIndex:i]]];
        [self addSubview:view];
        i++;
        
    } while (i<titleArray.count);
}



- (void)OneTapSingleClick:(UITapGestureRecognizer*)Tap{
    if (self.Cell_One_Block) {
        self.Cell_One_Block(Tap.view.tag);
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
