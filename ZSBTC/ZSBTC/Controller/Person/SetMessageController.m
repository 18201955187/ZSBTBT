//
//  SetMessageController.m
//  ZSBTC
//
//  Created by DJ on 17/1/16.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "SetMessageController.h"
#import "LoginViewController.h"



@interface SetMessageController ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation SetMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=Light_WhiteColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ViewTouchClick:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}
- (IBAction)CompleteBtnClick:(UIButton *)sender {
    for (UIViewController *Vc in self.navigationController.viewControllers) {
        if ([Vc isKindOfClass:[LoginViewController class]]) {
            [self.navigationController popToViewController:Vc animated:YES];
        }
    }
}
- (IBAction)imgTapClick:(UITapGestureRecognizer *)sender {
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"更改图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册上传", nil];
    menu.delegate=self;
    menu.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
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


-(void)localPhoto{
    __block UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    picker.navigationBar.barTintColor =[UIColor whiteColor];
    picker.navigationBar.tintColor = [UIColor blackColor];
    picker.navigationBar.titleTextAttributes = @{UITextAttributeTextColor:[UIColor blackColor]};
    [self presentViewController:picker animated:YES completion:^{
        picker = nil;
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //完成选择
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSLog(@"%@",[info objectForKey:@"UIImagePickerControllerOriginalImage"]);
        
        
        [picker dismissViewControllerAnimated:YES completion:^{
            self.headerImg.image = image;
        }];
    }
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
