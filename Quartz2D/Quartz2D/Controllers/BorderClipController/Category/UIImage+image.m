//
//  UIImage+image.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image {
    
    //1. 开启图片上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //2. 先描述一个大圆， 设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //3. 设置边框颜色
    [color set];
    [path fill];
    //4. 再添加一个小圆， 把小圆设裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    
    //5. 把图片绘制给上下文
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    //6. 生成一张新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //7. 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}

@end
