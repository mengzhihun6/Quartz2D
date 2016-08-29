//
//  DrawingBoardVC.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "DrawingBoardVC.h"
#import "DrawView.h"
#import "HandleImageView.h"

@interface DrawingBoardVC () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate, HandleImageViewDelegate>

@property (weak, nonatomic) IBOutlet DrawView *drawView;

@property (nonatomic, weak) UIImageView *imgV;

@end

@implementation DrawingBoardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clear:(UIBarButtonItem *)sender {
    
    [self.drawView clear];
    
}

- (IBAction)undo:(UIBarButtonItem *)sender {
    
    [self.drawView undo];
}

- (IBAction)erase:(UIBarButtonItem *)sender {
    
    [self.drawView erase];
    
}

- (IBAction)chosePic:(UIBarButtonItem *)sender {
 
    //系统相册控制器
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    //设置照片来源
    pickVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //设置代理
    pickVC.delegate = self;
    //model出系统相册控制器
    [self presentViewController:pickVC animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //获取当前选中的图片，通过UIImagePickerControllerOriginalImage就获取
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    HandleImageView *handV = [[HandleImageView alloc] init];
    handV.frame = self.drawView.bounds;
    handV.image = image;
    handV.delegate = self;
    
    [self.drawView addSubview:handV];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleImageView:(HandleImageView *)handleImageV newImage:(UIImage *)image {
    self.drawView.image = image;
}


- (IBAction)save:(UIBarButtonItem *)sender {
    
    //1. 把画板东西生成一张图片保存
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:ctx];
    
    //2. 生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //3. 关闭上下文
    UIGraphicsEndImageContext();
    
    //写到系统相册中
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"保存成功");
    
}

- (IBAction)valueChange:(UISlider *)sender {
    [self.drawView setLineWidth:sender.value];
}

- (IBAction)setColor:(UIButton *)sender {
    
    [self.drawView setLineColor:sender.backgroundColor];
    
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

@end
