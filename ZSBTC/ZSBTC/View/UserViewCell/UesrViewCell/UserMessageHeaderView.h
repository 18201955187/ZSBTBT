//
//  UserMessageHeaderView.h
//  ZSBTB
//
//  Created by DJ on 16/12/14.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserMessageHeaderView_login_Block)(void);
typedef void(^UserMessageHeaderImgView_Block)(void);

@interface UserMessageHeaderView : UIView
@property (nonatomic,copy)UserMessageHeaderView_login_Block loginBlock;
@property (nonatomic,strong)UIImageView* backImgView;
@property (nonatomic,strong)UIButton *loginBtn;

@property (nonatomic,copy) UserMessageHeaderImgView_Block HeaderImgView_Block;
- (instancetype)initWithFrame:(CGRect)frame withHeaderImgView_Block:(UserMessageHeaderImgView_Block)HeaderImgView_Block;
@end
