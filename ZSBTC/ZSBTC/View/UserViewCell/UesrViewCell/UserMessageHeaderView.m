//
//  UserMessageHeaderView.m
//  ZSBTB
//
//  Created by DJ on 16/12/14.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "UserMessageHeaderView.h"

@interface UserMessageHeaderView ()

@property (nonatomic,strong)UIImageView *headerBackImg;
@property (nonatomic,strong)UIImageView *userHeaderImg;
@property (nonatomic,strong)UILabel *UserNameLabel;
@property (nonatomic,strong)UIImageView *headerImg;
@property (nonatomic,strong)UILabel *userNameLabel;

@end

@implementation UserMessageHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel*)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.frame = CGRectMake(self.headerImg.maxX, self.headerImg.maxY-21, 160, 21);
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.backgroundColor = [UIColor clearColor];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.font = [UIFont systemFontOfSize:14];
        _userNameLabel.text = @"有钱就是任性";
    }
    return _userNameLabel;
}

- (UIImageView*)headerImg{
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.height/3, self.height/2, self.height/2)];
        _headerImg.userInteractionEnabled = YES;
        _headerImg.backgroundColor = [UIColor lightGrayColor];
        _headerImg.image = [UIImage imageNamed:@"collect3"];
        _headerImg.layer.cornerRadius = self.height/4;
        _headerImg.layer.masksToBounds = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapClick:)];
        singleTap.numberOfTapsRequired = 1;
        [_headerImg addGestureRecognizer:singleTap];
    }
    return _headerImg;
}

-(void)singleTapClick:(UITapGestureRecognizer*)single{
    if (self.HeaderImgView_Block) {
        self.HeaderImgView_Block();
    }
    
}

- (UIImageView*)backImgView{
    if (!_backImgView) {
        _backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _backImgView.image = [UIImage imageNamed:@"backImage"];
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}

- (UIButton*)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(self.width-80, self.height-20, 80, 20);
        _loginBtn.backgroundColor = [UIColor whiteColor];
        
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_loginBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn addTarget: self action:@selector(loginBtnClock:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}

- (instancetype)initWithFrame:(CGRect)frame withHeaderImgView_Block:(UserMessageHeaderImgView_Block)HeaderImgView_Block{
    self.userInteractionEnabled = YES;
    if (self = [super initWithFrame:frame]) {
        self.HeaderImgView_Block = HeaderImgView_Block;
        [self addSubview:self.backImgView];
        [self.backImgView addSubview:self.loginBtn];
        [self.backImgView addSubview:self.headerImg];
        [self.backImgView addSubview:self.userNameLabel];
    }
    return self;
}

- (void)loginBtnClock:(UIButton*)btn{
    if (self.loginBlock) {
        self.loginBlock();
    }
}

@end
