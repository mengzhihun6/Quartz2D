//
//  ProgressView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView


- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    //如果我们手动调用drawRect,系统是不会给我们生成跟View相关联的上下文， 系统调用drawRect的时候， 才会生成跟View相关联的上下文
    [self drawRect:self.bounds];
    
    //底层就会调用drawRect,系统自动调用
    [self setNeedsDisplay];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    
    //画弧
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat redius = rect.size.width * 0.5 -10;
    CGFloat startA = - M_PI_2;
    CGFloat endA = -M_PI_2 + self.progress * M_PI * 2;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];

    [path stroke];
}



@end
