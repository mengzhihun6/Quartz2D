//
//  DrawingView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //绘文字
    [self DrawText];
    
    //绘图片
//    [self drawPicture:rect];
    
    
}

- (void)drawPicture:(CGRect)rect {
    
    //加载图片
    UIImage *img = [UIImage imageNamed:@"draw"];
    
    //绘制出来的图片是保持原来的图片
//    [img drawAtPoint:CGPointZero];
    
    //把图片填充到rect中
    [img drawInRect:rect];
    //添加裁剪区域， 把超出裁剪区域以外都剪掉
//    UIRectClip(CGRectMake(0, 0, 50, 50));
//    [img drawAsPatternInRect:self.bounds];
    
//    [[UIColor blueColor] set];
//    UIRectFill(CGRectMake(10, 10, 100, 100));
    
    
}


- (void)DrawText {
    
   NSString *str = @"美丽杭州，开源中国";
    
    //
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //设置文字大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    //设置文字颜色
    dict[NSForegroundColorAttributeName] = [UIColor greenColor];
    //设置描边宽度
    dict[NSStrokeWidthAttributeName] = @2;
    //设置描边颜色
    dict[NSStrokeColorAttributeName] = [UIColor redColor];
    
    //设置阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    //设置阴影颜色
    shadow.shadowColor = [UIColor yellowColor];
    //设置阴影偏移量
    shadow.shadowOffset = CGSizeMake(10, 10);
    //设置模糊程度
    shadow.shadowBlurRadius = 3;
    dict[NSShadowAttributeName] = shadow;
    
    //不会自动换行
//    [str drawAtPoint:CGPointZero withAttributes:dict];
    
    //会自动换行
    [str drawInRect:self.bounds withAttributes:dict];
    
    
    
    
}



@end
