//
//  UserOrderStatusCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/20.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserOrderStatusCell.h"
#import "UserOrderItemStatusView.h"

@implementation UserOrderStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)msGetInstance {
    return [[NSBundle mainBundle] loadNibNamed:@"UserOrderStatusCell" owner:self options:nil][0];
}

- (void)LoadUserOrderStatusCellWithStatus_Block:(UserOrderStatusCell_Block)UserOrderStatusCell_Block{
    self.OrderStatusCell_Block = UserOrderStatusCell_Block;
    NSMutableArray *titleArray = [[NSMutableArray alloc]initWithObjects:@"待付款",@"待发货",@"待收货",@"待评价",@"售后/退款", nil];
    NSMutableArray *ImageArray = [[NSMutableArray alloc]initWithObjects:@"index_ic_assist",@"index_ic_delegate",@"index_ic_key",@"index_ic_new",@"index_ic_used", nil];
    
    for (int i = 0; i<titleArray.count; i++) {
        UserOrderItemStatusView*userOrderItemStatusView = [[UserOrderItemStatusView alloc]initWithFrame:CGRectMake(Screen_Width/5*i, 0, Screen_Width/5, 80) title:[NSString stringWithFormat:@"%@",titleArray[i]] imageName:[NSString stringWithFormat:@"%@",ImageArray[i]]];
        userOrderItemStatusView.tag = i;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick:)];
        [userOrderItemStatusView addGestureRecognizer:singleTap];
        [self addSubview:userOrderItemStatusView];
    }
}

- (void)TapClick:(UITapGestureRecognizer*)Tap{
    NSOrderStatus_Type TypeDex = Tap.view.tag+1;
    if (self.OrderStatusCell_Block) {
        self.OrderStatusCell_Block(TypeDex);
    }
}



@end
