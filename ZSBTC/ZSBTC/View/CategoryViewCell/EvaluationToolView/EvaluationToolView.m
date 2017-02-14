//
//  EvaluationToolView.m
//  ZSBTC
//
//  Created by DJ on 17/1/24.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "EvaluationToolView.h"

#import "CommonTwoTextView.h"

@interface EvaluationToolView ()
@property (nonatomic,strong)CommonTwoTextView*TwoTextView;
@property (nonatomic,strong) UIView *contentBackView;
@end

@implementation EvaluationToolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withTap_Block:(EvaluationToolViewTap_Block)Tap_Block{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bottomLinView];
        [self addSubview:self.contentBackView];
        self.ToolViewTap_Block = Tap_Block;
        int i = 0;
        do {
            CommonTwoTextView *view = [[CommonTwoTextView alloc]initWithFrame:CGRectMake(self.contentBackView.width/self.TopArray.count*i, 0, self.contentBackView.width/4, self.contentBackView.height) TopFrame:CGRectMake(0, 0, self.contentBackView.width/4, self.contentBackView.height/2) TopTextColor:[UIColor blackColor] TopTextFont:12.0 BottomFrame:CGRectMake(0, self.contentBackView.height/2, self.contentBackView.width/4, self.contentBackView.height/2) BottomTextColor:[UIColor blackColor] BottomTextFont:12.0];
            
            view.tag = i;
            if (view.tag == 0) {
                view.topLabel.textColor = Common_NomalColor;
                view.bottomLabel.textColor = Common_NomalColor;
                if (self.ToolViewTap_Block) {
                    self.ToolViewTap_Block(view.tag);
                }
            }
            view.topLabel.text = [NSString stringWithFormat:@"%@",self.TopArray[i]];
            view.bottomLabel.text = [NSString stringWithFormat:@"%@",self.BottomArray[i]];
            
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapClick:)];
            [view addGestureRecognizer:singleTap];
            
            
            [self.contentBackView addSubview:view];
            i++;
        } while (i<self.TopArray.count);
    }
    return self;
}


- (void)singleTapClick:(UITapGestureRecognizer*)tap{
    
    for (CommonTwoTextView *twoTextView in self.self.contentBackView.subviews) {
        twoTextView.topLabel.textColor = [UIColor blackColor];
        twoTextView.bottomLabel.textColor = [UIColor blackColor];
    }
    self.TwoTextView = (CommonTwoTextView*)tap.view;
    self.TwoTextView.topLabel.textColor = Common_NomalColor;
    self.TwoTextView.bottomLabel.textColor = Common_NomalColor;
    if (self.ToolViewTap_Block) {
        self.ToolViewTap_Block(self.TwoTextView.tag);
    }
}

- (NSArray*)TopArray{
    if (!_TopArray) {
        _TopArray = [[NSArray alloc]initWithObjects:@"全部评价",@"好评",@"中评",@"差评",@"晒图", nil];
    }
    return _TopArray;
}

- (NSArray*)BottomArray{
    if (!_BottomArray) {
        _BottomArray = [[NSArray alloc]initWithObjects:@"1289",@"1239",@"485",@"344",@"241", nil];
    }
    return _BottomArray;
}

- (UIView*)contentBackView{
    if (!_contentBackView) {
        _contentBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height-0.5)];
    }
    return _contentBackView;
}

- (UIView *)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-0.5, self.width, 0.5)];
        _bottomLinView.backgroundColor =  ToolLinViewColor;
    }
    return _bottomLinView;
}

@end
