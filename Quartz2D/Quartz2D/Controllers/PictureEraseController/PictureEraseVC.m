//
//  PictureEraseVC.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "PictureEraseVC.h"

@interface PictureEraseVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation PictureEraseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)pan:(UIPanGestureRecognizer *)pan {
 
    //获取当前手指所在的点
    CGPoint curP = [pan locationInView:self.imgV];
    CGFloat rectWH = 30;
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(self.imgV.bounds.size, NO, 0);
    //获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把UIImageView上面的图片绘制到上下文
    [self.imgV.layer renderInContext:ctx];
    
    //确定擦除区域
    CGContextClearRect(ctx, rect);
    
    //生成一张新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    //给原来图片重新赋值
    self.imgV.image = newImg;
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
