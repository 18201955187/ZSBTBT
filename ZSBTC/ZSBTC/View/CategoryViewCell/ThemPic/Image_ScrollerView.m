//
//  Image_ScrollerView.m
//  collectionView
//
//  Created by DJ on 17/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "Image_ScrollerView.h"
#import "UIImageView+WebCache.h"


@implementation Image_ScrollerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.contentSize = CGSizeMake(Screen_Width, 0);
        self.backgroundColor = [UIColor whiteColor];
       
        self.minimumZoomScale = 0.5f;
        self.maximumZoomScale = 3.0f;
        [self setZoomScale:1.0f];
        self.delegate = self;
        
        self.contentImage = [[UIImageView alloc]init];
        self.contentImage.frame = CGRectMake(0, 0, Screen_Width, Screen_Width);
        self.contentImage.userInteractionEnabled = YES;
        self.contentImage.contentMode = UIViewContentModeScaleAspectFill;
        
        
        UITapGestureRecognizer* singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
        singleRecognizer.numberOfTapsRequired = 1;
        [self.contentImage addGestureRecognizer:singleRecognizer];
        [self addSubview:self.contentImage];
        
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handleDoubleTap:)];
        [doubleTapGesture setNumberOfTapsRequired:2];
         [singleRecognizer requireGestureRecognizerToFail:doubleTapGesture];
        [self.contentImage addGestureRecognizer:doubleTapGesture];
    }
    return self;
}



#pragma mark -- 事件

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture{
    if (self.zoomScale<1.0f) {
        
        CGRect zoomRect = [self zoomMinRectCenter:CGPointMake(self.width/2, self.height/2)];
        [self zoomToRect:zoomRect animated:YES];
    }
    else if (self.zoomScale>1.0f){
        CGRect zoomRect = [self zoomMinRectCenter:CGPointMake(self.width/2, self.height/2)];
        [self zoomToRect:zoomRect animated:YES];
    }
    else if (self.zoomScale == 1.0f){
        CGRect zoomRect = [self zoomMaxRectCenter:CGPointMake(self.width/2, self.height/2)];
        [self zoomToRect:zoomRect animated:YES];
    }
}

- (void)tapGestureClick:(UITapGestureRecognizer*)sender{
    if ([self.Tap_single_delegate respondsToSelector:@selector(Image_ScrollerView_SingleTap_Delegate)]) {
        [self.Tap_single_delegate Image_ScrollerView_SingleTap_Delegate];
    }
}

- (CGRect)zoomMaxRectCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height =self.height/2;
    zoomRect.size.width  =self.width/2;
    zoomRect.origin.x = center.x - (zoomRect.size.width/2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height/2.0);
    return zoomRect;
}

- (CGRect)zoomMinRectCenter:(CGPoint)center{
    CGRect zoomRect;
    zoomRect.size.height =self.height/1.0;
    zoomRect.size.width  =self.width/1.0;
    zoomRect.origin.x = center.x - (zoomRect.size.width/2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height/2.0);
    return zoomRect;
}


#pragma mark -- UIScrollViewDelegate

- (void)setScrollerImage:(NSString*)imageName{
    NSURL * dataUrl = [NSURL URLWithString:imageName];
    [self.contentImage sd_setImageWithURL:dataUrl placeholderImage:nil];
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    for (UIImageView* view in [scrollView subviews]) {
        self.contentImage.contentMode = UIViewContentModeScaleAspectFill;
        return view;
    }
    return  nil;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    scrollView.contentSize = CGSizeMake(Screen_Width, 0);
    self.contentImage.center = CGPointMake(Screen_Width/2, Screen_Width/2);
}





@end
