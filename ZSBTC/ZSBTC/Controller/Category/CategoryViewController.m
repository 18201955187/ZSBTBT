//
//  CategoryViewController.m
//  ZSBTC
//
//  Created by DJ on 17/1/10.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "CategoryViewController.h"

#import "ProductListController.h"

@interface CategoryViewController ()

@property (nonatomic,strong) UITextField*textSearch;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    [self initNavBar:NavBarType_BackHideen_Yes title:@"分类"];
    
    [self.view addSubview:self.tableView];
    NSLog(@"qwe");
    NSLog(@"qwe");
    NSLog(@"qwe");
    NSLog(@"qwe");
    NSLog(@"qwe");
    NSLog(@"qwe");
    NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");
    NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");

    NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");

    NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");

    NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");NSLog(@"qwe");

    

}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavBar_Hight, Screen_Width, Screen_Height-NavBar_Hight-Height_TabBar) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.textLabel.text = @"分类列表";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"Category" bundle:nil];
    ProductListController* Vc = [story instantiateViewControllerWithIdentifier:@"ProductListController"];
    Vc.title = @"商品列表";
    [self.navigationController pushViewController:Vc animated:YES];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
