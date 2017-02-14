//
//  OrderBackGoodController.m
//  ZSBTC
//
//  Created by DJ on 17/1/23.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "OrderBackGoodController.h"
#import "ZYQAssetPickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface OrderBackGoodController ()<UIActionSheetDelegate,ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *backImageView;

@end

@implementation OrderBackGoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)upImgClick:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"上传凭证"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"相册",nil];
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //0->拍照，1->相册
    if (buttonIndex == 0) {
        [self snapImage];
    } else if (buttonIndex == 1) {
        [self localPhoto];
    }
}


- (void) snapImage
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        __block UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.delegate = self;
        ipc.allowsEditing = YES;
        ipc.navigationBar.barTintColor =[UIColor whiteColor];
        ipc.navigationBar.tintColor = [UIColor whiteColor];
        ipc.navigationBar.titleTextAttributes = @{UITextAttributeTextColor:[UIColor whiteColor]};
        [self presentViewController:ipc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器无法打开照相机");
    }
}

- (void)localPhoto{
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 5;
    picker.assetsFilter = ZYQAssetsFilterAllAssets;
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        if ([(ZYQAsset*)evaluatedObject mediaType]==ZYQAssetMediaTypeVideo) {
            NSTimeInterval duration = [(ZYQAsset*)evaluatedObject duration];
            return duration >= 5;
        } else {
            return YES;
        }
        
        
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    [self.backImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i=0; i<assets.count; i++) {
            ZYQAsset *asset=assets[i];
            UIImageView *imgview=[[UIImageView alloc] initWithFrame:CGRectMake(i*50, 50, 50, 50)];
            imgview.contentMode=UIViewContentModeScaleAspectFill;
            imgview.clipsToBounds=YES;
            [asset setGetFullScreenImage:^(UIImage *result) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [imgview setImage:result];
                    [self.backImageView addSubview:imgview];
                });
                
            }];
        }
    });
}


-(void)assetPickerControllerDidMaximum:(ZYQAssetPickerController *)picker{
    NSLog(@"到达上限");
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/










@end
