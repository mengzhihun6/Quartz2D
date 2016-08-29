//
//  DrawView.h
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

//清屏
- (void)clear;
//撤销
- (void)undo;
//橡皮擦
- (void)erase;
//设置线的宽度
- (void)setLineWidth:(CGFloat)width;
//设置颜色
- (void)setLineColor:(UIColor *)color;


@property (nonatomic, strong) UIImage *image;


@end
