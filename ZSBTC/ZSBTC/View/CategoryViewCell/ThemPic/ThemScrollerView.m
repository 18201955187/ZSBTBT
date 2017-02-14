//
//  ThemScrollerView.m
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ThemScrollerView.h"

@implementation ThemScrollerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = Black_Clear_Color;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)loadScroller{
    UIScrollView *backScroller = [[UIScrollView alloc]init];
    backScroller.frame = CGRectMake(0,NavBar_Hight, Screen_Width, Screen_Width);
    [UIView animateWithDuration:0.5f animations:^{
        backScroller.frame = CGRectMake(0,Screen_Height/2-(Screen_Width/2), Screen_Width, Screen_Width);
    }];
    backScroller.pagingEnabled = YES;
    backScroller.scrollEnabled = YES;
    backScroller.backgroundColor = [UIColor whiteColor];
    backScroller.userInteractionEnabled = YES;
    backScroller.showsVerticalScrollIndicator = FALSE;
    backScroller.showsHorizontalScrollIndicator = FALSE;
    backScroller.delegate = self;
    [self addSubview:backScroller];
    self.backScroller = backScroller;
}


#pragma mark -- 加载事件
- (void)loadItemScroller:(NSMutableArray*)dataArray index:(NSInteger)index{
    self.backScroller.contentSize = CGSizeMake(self.width*dataArray.count, 0);
    self.index = index;
    for (int i = 0; i<dataArray.count; i++) {
        CGRect rect;
        rect = CGRectMake(self.width*i, 0, Screen_Width, Screen_Width);
        Image_ScrollerView *image_ScrollerView = [[Image_ScrollerView alloc]initWithFrame:rect];
        image_ScrollerView.Tap_single_delegate = self;
        [image_ScrollerView setScrollerImage:[NSString stringWithFormat:@"%@",[dataArray objectAtIndex:i]]];
        [self.backScroller addSubview:image_ScrollerView];
    }
    self.backScroller.contentOffset = CGPointMake(Screen_Width*index, 0);
}


#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>=0) {
        NSInteger page;
        page = scrollView.contentOffset.x/Screen_Width;
        self.index = page;
    }
}

#pragma mark -- Image_ScrollerViewDelegate

- (void)Image_ScrollerView_SingleTap_Delegate{
    __block typeof(self) BlockSelf = self;
    [UIView animateWithDuration:0.5f animations:^{
        BlockSelf.backScroller.frame = CGRectMake(0,NavBar_Hight, Screen_Width, Screen_Width);
    } completion:^(BOOL finished) {
        [BlockSelf removeFromSuperview];
        [BlockSelf.subviews respondsToSelector:@selector(removeFromSuperview)];
        if ([self.delegate respondsToSelector:@selector(ThemScrollerViewToIndex:)]) {
            [self.delegate ThemScrollerViewToIndex:self.index];
        }
    }];
}

@end
