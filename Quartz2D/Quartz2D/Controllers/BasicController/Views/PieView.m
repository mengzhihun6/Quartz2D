//
//  PieView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "PieView.h"

@implementation PieView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *dataArray = @[@5,@25,@30,@40];
    
    //画饼图扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat redius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (NSNumber *num in dataArray) {
        
        startA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        
        [[self randomColor] set];
        [path fill];
    }
 
}

//随机生成一个颜色
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    //0-255.
    //    colorWithRed  0-1
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}



@end
