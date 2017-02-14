//
//  GuiGeSizeCell.m
//  ZSBTC
//
//  Created by DJ on 17/1/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "GuiGeSizeCell.h"

#define Button_Tag 200
#define Button_Title_Distance 20
//button上下之间的间距
#define Margin_Col_Distance 10
//button与button之间的间距
#define Button_Distance 10

#define Cell_Width Screen_Width- (15*2)

@implementation GuiGeSizeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)msGetInstance{
    return [[[NSBundle mainBundle] loadNibNamed:[[self class] msGetCellId] owner:nil options:nil] firstObject];
}

+ (NSString *)msGetCellId{
    return @"GuiGeSizeCell";
}



- (void)setGuiGeColorSizeCell:(NSString*)title withDataArray:(NSMutableArray*)dataArray withCellHightBlock:(void(^)(CGFloat CellHight))CellHightBlock{
    
    self.Cell_HightBlock = CellHightBlock;
    self.titleLabel.text = title;
    CGFloat CellHight = 0.0f;
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    
    for (int i = 0; i < dataArray.count; i++){
        NSString *btnName = [NSString stringWithFormat:@"%@",[dataArray objectAtIndex:i]];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5.0;
        button.layer.masksToBounds = YES;
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = Color_RGBA(246, 246, 246, 1);
        button.tag = Button_Tag + i;
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGSize Button_Size = [btnName boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        [button setTitle:btnName forState:UIControlStateNormal];
        
        button.frame = CGRectMake(w, h, Button_Size.width + Button_Title_Distance , 30);
        
        if(w + button.frame.size.width > Cell_Width){
            w = 0;
            h = h + button.frame.size.height + Margin_Col_Distance;
            button.frame = CGRectMake(w, h, Button_Size.width + Button_Title_Distance, 30);
            
        }
        w = button.frame.size.width + button.frame.origin.x+Button_Distance;
        [self.contentBackView addSubview:button];
    }
    
    CellHight = h+30+10+30;
    
    ZFLog(@"%f",CellHight);
    
    if (self.Cell_HightBlock) {
        self.Cell_HightBlock(CellHight);
    }
}



- (void)btnClick:(UIButton*)sender{
    for (UIButton*btn in self.contentBackView.subviews) {
        btn.backgroundColor = Color_RGBA(246, 246, 246, 1);
    }
    sender.backgroundColor = Common_NomalColor;
    self.BtnTag = sender.tag;
}



@end
