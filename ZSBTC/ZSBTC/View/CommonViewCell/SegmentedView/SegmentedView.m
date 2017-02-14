//
//  SegmentedView.m
//  ZSBTC
//
//  Created by DJ on 17/1/25.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "SegmentedView.h"

@implementation SegmentedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray*)titleArray textFont:(CGFloat)textFont Radius:(CGFloat)Radius borderWidth:(CGFloat)borderWidth LayerColor:(UIColor*)LayerColor backNormalColor:(UIColor*)backNormalColor  backSelectColor:(UIColor *)backSelectColor defaultSelectIndex:(NSInteger)defaultSelectIndex withSelectIndexBlock:(SegmentedView_selectIndexBlock)SelectIndexBlock{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = Radius;
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = [LayerColor CGColor];
        self.backNormalColor = backNormalColor;
        self.layer.masksToBounds = YES;
        self.selectIndexBlock = SelectIndexBlock;
        
       
        [self addSubview:self.contemtBackView];
        self.backNormalColor = backNormalColor;
        self.backSelectColor = backSelectColor;
        int i = 0;
        do {
            
            
            UIView *linView = [[UIView alloc]initWithFrame:CGRectMake((i+1)*(self.width/titleArray.count), 0, 0.5, self.height)];
            linView.backgroundColor = backSelectColor;
            [self addSubview:linView];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.tag = i;
            btn.frame = CGRectMake(i*(self.width/titleArray.count), 0, self.width/titleArray.count, self.height);
            btn.backgroundColor = [UIColor clearColor];
            btn.titleLabel.font = [UIFont systemFontOfSize:textFont];
            [btn setTitle:[NSString stringWithFormat:@"%@",[titleArray objectAtIndex:i]] forState:UIControlStateNormal];
            if (btn.tag == defaultSelectIndex) {
                
                [btn setTitleColor:backNormalColor forState:UIControlStateNormal];
                self.ItemBackView = [[UIView alloc]init];
                self.ItemBackView.frame = CGRectMake(i*(self.width/titleArray.count), 0, self.width/titleArray.count, self.height);
                self.ItemBackView.backgroundColor = backSelectColor;
                [self insertSubview:self.ItemBackView atIndex:0];
                if (self.selectIndexBlock) {
                    self.selectIndexBlock(btn.tag);
                }
            }
            else{
                [btn setTitleColor:backSelectColor forState:UIControlStateNormal];
            }
            [btn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.contemtBackView addSubview:btn];
            i++;
        } while (i<titleArray.count);
    }
    
    
   /** int j = 0;
    do {
    
    } while (j<titleArray.count);**/
    
    
    
    return self;
}

- (UIView *)contemtBackView{
    if (!_contemtBackView) {
        _contemtBackView = [[UIView alloc]init];
        _contemtBackView.frame = CGRectMake(0, 0, self.width, self.height);
        _contemtBackView.backgroundColor = [UIColor clearColor];
    }
    return _contemtBackView;
}

- (void)BtnClicked:(UIButton*)btn{
    for (UIButton *button in self.contemtBackView.subviews) {
        [button setTitleColor:self.backSelectColor forState:UIControlStateNormal];
    }
    [btn setTitleColor:self.backNormalColor forState:UIControlStateNormal];
    self.ItemBackView.frame = CGRectMake(btn.tag*btn.width, 0, btn.width, btn.height);
    if (self.selectIndexBlock) {
        self.selectIndexBlock(btn.tag);
    }
    
}


@end
