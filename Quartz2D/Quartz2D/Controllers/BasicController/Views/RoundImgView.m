//
//  RoundImgView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "RoundImgView.h"

@interface RoundImgView ()

@property (nonatomic, weak) IBOutlet UIImageView *imgV;

@end


@implementation RoundImgView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1. 加载图片
    UIImage *img = [UIImage imageNamed:@"round"];
    //2. 生成一个跟图片相同大小的上下文
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
    //3. 在上下文添加一个圆形裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //把路径设置成裁剪区域
    [path addClip];
    
    //4. 把图片绘制图片上下文
    [img drawAtPoint:CGPointZero];
    
    //5. 生成一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //6. 关闭图片上下文
    UIGraphicsEndImageContext();
    
    self.imgV.image = newImg;
}


@end
