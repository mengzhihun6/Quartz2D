//
//  WatermarkView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "WatermarkView.h"

@interface WatermarkView ()

@property (nonatomic, weak) IBOutlet UIImageView *imgV;

@end


@implementation WatermarkView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *img = [UIImage imageNamed:@"draw"];
    
    //生成图片
    //size:开开启一个多大图片上下文.
    //opaque:不透度
    //scale:0
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    //把图片给绘制图片上下文
    [img drawAtPoint:CGPointZero];
    
//    JGLog(@"%@", NSStringFromCGSize(img.size));
    
    //绘制文字
    NSString *str = @"开源中国";
    CGPoint point = CGPointMake(img.size.width * 0.6 , img.size.height * 0.8);
    
    [str drawAtPoint:point withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:100],
                                            NSForegroundColorAttributeName : [UIColor redColor]
                                            }];
    
    //生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //手动关闭上下文
    UIGraphicsEndImageContext();
    
    self.imgV.image = newImage;
    
    
}


@end
