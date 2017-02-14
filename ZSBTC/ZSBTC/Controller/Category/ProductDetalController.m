//
//  ProductDetalController.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "ProductDetalController.h"
#import "HMSegmentedControl.h"

@interface ProductDetalController ()
@property (nonatomic,strong)NSArray *TypedataArray;
@property (nonatomic,strong)HMSegmentedControl *segmentControl;
@property (nonatomic,strong)UIView *bottomLinView;



@end

@implementation ProductDetalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadUI];
    

}

- (void)loadUI{
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.bottomLinView];
    [self addLinView];

}

- (NSArray*)TypedataArray{
    if (!_TypedataArray) {
        _TypedataArray = [[NSArray alloc]initWithObjects:@"商品介绍",@"规格参数",@"包装售后", nil];
    }
    return _TypedataArray;

}

- (void)addLinView{
    int i = 0;
    do {
        UIView *linView = [[UIView alloc]initWithFrame:CGRectMake(Screen_Width/3+(Screen_Width/3*i), 10, 1, 20)];
        linView.backgroundColor = ToolLinViewColor;
        [self.segmentControl addSubview:linView];
        i++;
    } while (i<2);
}


- (HMSegmentedControl*)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.TypedataArray];
        _segmentControl.font = [UIFont systemFontOfSize:14];
        [_segmentControl  setFrame:CGRectMake(0, 0, Screen_Width, 40)];
        _segmentControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        
        __block typeof(self) BlockSelf = self;
        _segmentControl.selectedSegmentIndex = 0;
        if (_segmentControl.selectedSegmentIndex == 0) {
            self.label.text = @"商品介绍";
        }
        [_segmentControl  setIndexChangeBlock:^(NSInteger index) {
            ZFLog(@"%ld",index);
            switch (index) {
                case 0:
                    BlockSelf.label.text = @"商品介绍";
                    break;
                case 1:
                    BlockSelf.label.text = @"规格参数";
                    break;
                case 2:
                    BlockSelf.label.text = @"包装售后";
                    break;
                    
                default:
                    break;
            }
            
        }];
        
        _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleArrow;
        _segmentControl .selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
        _segmentControl.textColor = [UIColor blackColor];
        _segmentControl .selectedTextColor = Common_NomalColor;
        _segmentControl.backgroundColor = [UIColor clearColor];
        _segmentControl .shouldAnimateUserSelection = YES;
    }
    return _segmentControl;
}

- (UIView *)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, Screen_Width, 0.5)];
        _bottomLinView.backgroundColor = ToolLinViewColor;
    }
    return _bottomLinView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
