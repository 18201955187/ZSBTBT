//
//  GuiGeView.m
//  ZSBTC
//
//  Created by DJ on 17/1/17.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "GuiGeView.h"

#import "GuiGeSizeCell.h"
#import "GuiGeColorCell.h"
#import "GuigeNumberCell.h"

#define ProductImg_Hight Screen_Height/4*3/4

#define Clear_Color [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.2]

@implementation GuiGeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)reloadSizeArray:(NSMutableArray*)SizeArray ColorArray:(NSMutableArray*)ColorArray{
    _SizeArray = SizeArray;
    _ColorArray = ColorArray;
    [self.tableView reloadData];
    
}

- (void)loadData{
    self.Cell_OneHight = 80;
    self.Cell_TwoHight = 80;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = Clear_Color;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick:)];
        singleTap.numberOfTapsRequired = 1;
        singleTap.delegate = self;
        [self addGestureRecognizer:singleTap];
        [self loadData];
        [self addSubview:[self contentView]];
        [self.contentView addSubview:[self productImg]];
        [self.contentView addSubview:[self tableView]];
        [self.contentView addSubview:[self linView]];
        [self.contentView addSubview:[self confirmBtn]];
        [self.contentView addSubview:[self delectBtn]];
        [self.contentView addSubview:[self priceLabel]];
        [self.contentView addSubview:[self StockNumber]];
        [self.contentView addSubview:[self guigeLabel]];
        
        
        [UIView animateWithDuration:0.6f delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0.7f
                            options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews
                         animations:^{
                             _contentView.transform = CGAffineTransformIdentity;
                         } completion:nil];
    }
    return self;
}

#pragma mark -- 事件
- (void)confirmBtnClick:(UIButton*)sender{
    __block typeof(self) BlockSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        BlockSelf.contentView.transform = CGAffineTransformMakeTranslation(0, Screen_Height/4*3);
        if ([BlockSelf.delegate respondsToSelector:@selector(confirmClicked)]) {
            [BlockSelf.delegate confirmClicked];
        }
    } completion:^(BOOL finished) {
        [BlockSelf.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [BlockSelf removeFromSuperview];
    }];
}

- (void)delectBtnBtnClick:(UIButton*)sender{
    __block typeof(self) BlockSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        BlockSelf.contentView.transform = CGAffineTransformMakeTranslation(0, Screen_Height/4*3);
        if ([BlockSelf.delegate respondsToSelector:@selector(confirmClicked)]) {
            [BlockSelf.delegate confirmClicked];
        }
    } completion:^(BOOL finished) {
        [BlockSelf.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [BlockSelf removeFromSuperview];
    }];
    
}


- (void)TapClick:(id)sender{
    __block typeof(self) BlockSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        BlockSelf.contentView.transform = CGAffineTransformMakeTranslation(0, Screen_Height/4*3);
        if (BlockSelf.TapBg_Block) {
            BlockSelf.TapBg_Block();
        }
    } completion:^(BOOL finished) {
        [BlockSelf.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [BlockSelf removeFromSuperview];
    }];
    
}

#pragma mark -
#pragma mark-- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}

#pragma mark -
#pragma mark--UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return _Cell_OneHight;
    }
    else if (indexPath.row == 1){
        return _Cell_TwoHight;
    }
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row==0) {
        GuiGeSizeCell*cell = [GuiGeSizeCell msGetInstance];
        __block typeof(self) BlockSelf = self;
        [cell setGuiGeColorSizeCell:@"尺寸" withDataArray:_SizeArray withCellHightBlock:^(CGFloat CellHight) {
           BlockSelf.Cell_OneHight = CellHight;
            /**if ([BlockSelf.tableView.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
                [BlockSelf.tableView.delegate tableView:BlockSelf.tableView heightForRowAtIndexPath:indexPath];
            }**/
        }];
        return cell;
    }
    else if(indexPath.row == 1){
        GuiGeColorCell*cell = [GuiGeColorCell msGetInstance];
        __block typeof(self) BlockSelf = self;
        [cell setGuiGeColorSizeCell:@"颜色" withDataArray:_ColorArray withCellHightBlock:^(CGFloat CellHight) {
           BlockSelf.Cell_TwoHight = CellHight;
            /*if ([BlockSelf.tableView.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
                [BlockSelf.tableView.delegate tableView:BlockSelf.tableView heightForRowAtIndexPath:indexPath];
            }*/
        }];
        return cell;
    }
    else{
        GuigeNumberCell*cell = [GuigeNumberCell msGetInstance];
        return cell;
    
    }
}

-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}


- (UIView*)linView{
    if (!_linView) {
        _linView = [[UIView alloc]initWithFrame:CGRectMake(15, ProductImg_Hight-0.5, Screen_Width-30, 0.5)];
        _linView.backgroundColor = [UIColor lightGrayColor];
    }
    return _linView;
}


- (UIView*)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.frame = CGRectMake(0, Screen_Height/4, Screen_Width, Screen_Height/4*3);
        _contentView.transform = CGAffineTransformMakeTranslation(0, Screen_Height/4*3);
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        _contentView.layer.shadowOffset = CGSizeMake(1,-3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        _contentView.layer.shadowOpacity = 0.3;//阴影透明度，默认0
        _contentView.layer.shadowRadius = 2;//阴影半径，默认3
        _contentView.clipsToBounds = NO;
    }
    return _contentView;
}

- (UIImageView *)productImg{
    if (!_productImg) {
        _productImg = [[UIImageView alloc]init];
        _productImg.frame = CGRectMake(15, -25, ProductImg_Hight, ProductImg_Hight);
        _productImg.backgroundColor = [UIColor whiteColor];
        _productImg.layer.cornerRadius = 5.0f;
        _productImg.layer.borderWidth = 0.5f;
        _productImg.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        _productImg.layer.masksToBounds = YES;
        _productImg.clipsToBounds = NO;
    }
    return _productImg;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(15, ProductImg_Hight, Screen_Width-30, ProductImg_Hight*3-45-10) style:UITableViewStylePlain];
        _tableView.contentInset=UIEdgeInsetsMake(0,0,0,0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GuiGeColorCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([GuiGeColorCell class])];
         [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GuiGeSizeCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([GuiGeSizeCell class])];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GuigeNumberCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([GuigeNumberCell class])];
    }
    return _tableView;
}

- (UIButton*)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(0,Screen_Height/4*3-45 , Screen_Width, 45);
        _confirmBtn.backgroundColor = Common_NomalColor;
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UIButton*)delectBtn{
    if (!_delectBtn) {
        _delectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _delectBtn.frame = CGRectMake(Screen_Width-50,10,40,40);
        [_delectBtn setImage:[UIImage imageNamed:@"Inner_delete"] forState:UIControlStateNormal];
        [_delectBtn addTarget:self action:@selector(delectBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delectBtn;
    
}

- (UILabel*)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.frame = CGRectMake(ProductImg_Hight+15+15, 20, 120, (ProductImg_Hight-25-20)/3);
        _priceLabel.text = @"元／价格";
        _priceLabel.font = [UIFont systemFontOfSize:14];
        _priceLabel.textColor = Common_NomalColor;
        _priceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _priceLabel;
}

- (UILabel*)StockNumber{
    if (!_StockNumber) {
        _StockNumber = [[UILabel alloc]init];
        _StockNumber.frame = CGRectMake(ProductImg_Hight+15+15, 20+((ProductImg_Hight-25-20)/3), 120, (ProductImg_Hight-25-20)/3);
        _StockNumber.text = @"库存3000件";
        _StockNumber.font = [UIFont systemFontOfSize:14];
        _StockNumber.textColor = [UIColor darkGrayColor];
        _StockNumber.textAlignment = NSTextAlignmentLeft;
    }
    return _StockNumber;
}

- (UILabel*)guigeLabel{
    if (!_guigeLabel) {
        _guigeLabel = [[UILabel alloc]init];
        _guigeLabel.frame = CGRectMake(ProductImg_Hight+15+15, 20+((ProductImg_Hight-25-20)/3*2), 120, (ProductImg_Hight-25-20)/3);
        _guigeLabel.text = @"选择 尺码 颜色";
        _guigeLabel.font = [UIFont systemFontOfSize:14];
        _guigeLabel.textColor = [UIColor darkGrayColor];
        _guigeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _guigeLabel;
}





@end
