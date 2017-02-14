//
//  ProductMessageController.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductMessageController.h"

#import "ProductDetalController.h"
#import "ThemPicView.h"
#define BottomBarHight 46
@interface ProductMessageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)ThemPicView *themPicView;
@property (nonatomic,strong)NSMutableArray *themImageArray;

@property (nonatomic,strong)UILabel *footLabel;

@end

@implementation ProductMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.themPicView];
    [self.tableView sendSubviewToBack:self.themPicView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (UILabel*)footLabel{
    if (!_footLabel) {
        _footLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
        _footLabel.text = @"模态图文详情暂不编辑";
        _footLabel.textColor = [UIColor lightGrayColor];
        _footLabel.backgroundColor = [UIColor whiteColor];
        _footLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _footLabel;
}


- (NSMutableArray*)themImageArray{
    if (!_themImageArray) {
        _themImageArray = [[NSMutableArray alloc]initWithObjects:@"http://pic2016.5442.com:82/2016/0811/26/1.jpg%21960.jpg",
                           @"http://imgsrc.baidu.com/baike/pic/item/a6efce1b9d16fdfa241bf189b68f8c5494ee7b65.jpg",
                           @"http://imgsrc.baidu.com/forum/pic/item/5bb5c9ea15ce36d3da6bfdb93af33a87e850b1cf.jpg",
                           @"http://image.tianjimedia.com/uploadImages/2012/178/K830IZAG0Q20.jpg", nil];
    }
    return _themImageArray;
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-NavBar_Hight-BottomBarHight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.contentInset=UIEdgeInsetsMake(Screen_Width,0,0,0);
        _tableView.tableFooterView = self.footLabel;
    }
    return _tableView;
}

- (ThemPicView*)themPicView{
    if (!_themPicView) {
        _themPicView = [[ThemPicView alloc]init];
        _themPicView.frame = CGRectMake(0, -Screen_Width, Screen_Width, Screen_Width);
        [_themPicView initSelf];
        [_themPicView setThemPicViewData:self.themImageArray];
        __block typeof(self) BlockSelf = self;
        _themPicView.ContentOffent_Block = ^{
            if (BlockSelf.ContentOff_Block) {
                BlockSelf.ContentOff_Block();
            }
        };
    }
    return _themPicView;
}


#pragma mark -
#pragma mark--UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *celler = @"celler";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celler];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celler];
    }
    cell.textLabel.text = @"商品";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    ZFLog(@"contentOffset.y:%f",scrollView.contentOffset.y);
    CGRect targetFrame = self.themPicView.frame;
    CGFloat offset =  - scrollView.contentOffset.y - scrollView.contentInset.top;
    if (offset < 0) {
        offset *= -3.0f;
        targetFrame.origin.y = - scrollView.contentInset.top + offset/4;
        self.themPicView.frame = targetFrame;
    }
    else{
        CGRect f =self.themPicView.frame;
        f.origin.y= offsetY ;
        f.size.height=  -offsetY;
        self.themPicView.frame= f;
        self.themPicView.frame = CGRectMake(0, offsetY, Screen_Width, -offsetY);
    }
}


@end
