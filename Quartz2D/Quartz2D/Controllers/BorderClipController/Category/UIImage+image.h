//
//  UIImage+image.h
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
/**
 *  传入一张照片返回一张带边框的圆形照片
 *
 *  @param borderW 边框宽度
 *  @param color   边框颜色
 *  @param image   传入的照片
 *
 *  @return 返回带边框的圆形照片
 */
+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

@end
