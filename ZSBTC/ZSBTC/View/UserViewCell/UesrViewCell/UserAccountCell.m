//
//  UserAccountCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/22.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UserAccountCell.h"
#import "UserAccountItemView.h"

@implementation UserAccountCell

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
    return [[NSBundle mainBundle] loadNibNamed:@"UserAccountCell" owner:self options:nil][0];
    
    
}

- (void)LoadUserAccountCellWithTypeBlock:(UserAccountCell_TypeBlock)TypeBlock{
    self.TypeBlock = TypeBlock;
    NSMutableArray *TypeArray = [[NSMutableArray alloc]initWithObjects:@"抵用卷",@"红包",@"帐户余额",@"积分", nil];
    NSMutableArray *NumberArray = [[NSMutableArray alloc]initWithObjects:@"0",@"元/0.00",@"元/0.00",@"0", nil];
    
   
    int i = 0;
    do {
        UserAccountItemView *userAccountItemView = [[UserAccountItemView alloc]initWithFrame:CGRectMake(i*Screen_Width/4, 0, Screen_Width/4, self.height) accountType:[NSString stringWithFormat:@"%@",[TypeArray objectAtIndex:i]] accountNumber:[NSString stringWithFormat:@"%@",[NumberArray objectAtIndex:i]]];
        userAccountItemView.tag = i;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
        userAccountItemView.userInteractionEnabled = YES;
        singleTap.numberOfTapsRequired = 1;
        [userAccountItemView addGestureRecognizer:singleTap];
        [self addSubview:userAccountItemView];
        i++;
        
    } while (i<[TypeArray count]);
    
}

- (void)singleTap:(UITapGestureRecognizer*)Tap{
    
    if (self.TypeBlock) {
        self.TypeBlock(Tap.view.tag);
    }
    
    
}



@end
