//
//  ThemPicView.m
//  collectionView
//
//  Created by DJ on 17/1/4.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ThemPicView.h"

@implementation ThemPicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSMutableArray*)themImageArray{
    if (!_themImageArray) {
        _themImageArray = [[NSMutableArray alloc]init];
    }
    return _themImageArray;
}

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (void)initSelf{
    
    [self SetCollectionView];
    
    [self SetPageNumber];
}

- (void)SetCollectionView{
    
    if (self.collectionView == nil) {
        UICollectionViewFlowLayout*flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.flowLayout = flowLayout;
      
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.scrollsToTop = NO;
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ThemViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ThemViewCell class])];
        [self addSubview:collectionView];
        self.collectionView = collectionView;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.flowLayout.itemSize = self.frame.size;
    self.collectionView.frame = self.bounds;
    self.pageControl.frame = CGRectMake(0, self.height-20, self.width, 20);
}

- (void)SetPageNumber{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(0, self.height-20, self.width, 20);
    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)setThemPicViewData:(NSMutableArray*)array{
    self.themImageArray = array;
    self.pageControl.numberOfPages = array.count;
    self.pageControl.currentPage = 0;
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.themImageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThemViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ThemViewCell class]) forIndexPath:indexPath];
    [cell setThemViewCell_ContentImage:[self.themImageArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ThemScrollerView *themScrollerView = [[ThemScrollerView alloc]init];
    themScrollerView.delegate = self;
    themScrollerView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    [themScrollerView loadScroller];
    [themScrollerView loadItemScroller:self.themImageArray index:indexPath.row];
    [window addSubview:themScrollerView];

}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>(self.themImageArray.count-1)*self.width) {
        if (self.ContentOffent_Block) {
            self.ContentOffent_Block();
        }
    }
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>=0) {
        NSInteger page;
        page = scrollView.contentOffset.x/self.width;
        self.pageControl.currentPage = page;
    }
}




#pragma mark --- ThemScrollerViewDelegate
- (void)ThemScrollerViewToIndex:(NSInteger)index{
    NSIndexPath * path = [NSIndexPath indexPathForItem:index  inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:0 animated:NO];
}

@end
