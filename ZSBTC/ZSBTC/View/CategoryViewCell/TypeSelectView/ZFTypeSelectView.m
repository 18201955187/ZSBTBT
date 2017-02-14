//
//  ZFTypeSelectView.m
//  SeachView
//
//  Created by DJ on 16/11/30.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import "ZFTypeSelectView.h"
#import "SeachTypeCell.h"

@interface ZFTypeSelectView()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>


@property (nonatomic,strong)UIView *contentBackView;
@property (nonatomic,strong)UIImageView *topImg;
@end

@implementation ZFTypeSelectView




- (id)init{
    if (self = [super init]) {
        [self AddTap];
    }
    return self;
}


- (void)addContentView:(CGRect)frame{
  
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = Black_Clear_Color;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius = 10;
    self.tableView.layer.masksToBounds = YES;
    [self addSubview:self.tableView];
    
    
    
    [self registUITableViewCell];
}


- (void)registUITableViewCell{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SeachTypeCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SeachTypeCell class])];
}


- (void)AddTap{
    
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
    
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    singleRecognizer.delegate = self;
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:singleRecognizer];
}

- (void)setZFTypeSeachViewDataArray:(NSMutableArray*)array{
    self.DataArray = [[NSMutableArray alloc]initWithArray:array];
    [self.tableView reloadData];
}


- (void)tapGestureClick:(UITapGestureRecognizer*)tap{
    __block typeof(self) BlockSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        BlockSelf.hidden = YES;
        BlockSelf.typeSelectView_Blank_Tap();
    }];
}


#pragma mark - tableview委托方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _DataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SeachTypeCell *cell = [SeachTypeCell msGetInstance];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",[self.DataArray objectAtIndex:indexPath.row]];
    
    return cell;
}

/* 列表cell方法 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *ContentStr = [NSString stringWithFormat:@"%@",self.DataArray[indexPath.row]];
    
    __block typeof(self) BlockSelf = self;
    
    [UIView animateWithDuration:0.1 animations:^{
        if (BlockSelf.typeSelectView_DidSelect_Block) {
            BlockSelf.typeSelectView_DidSelect_Block(ContentStr);
        }
    } completion:^(BOOL finished) {
        BlockSelf.hidden = YES;
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isDescendantOfView:self.tableView]) {
        return NO;
    }
    return YES;
}




@end
