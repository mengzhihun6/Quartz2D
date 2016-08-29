//
//  RedView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "RedView.h"

@implementation RedView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    //画直线
//    [self DrawLine];
    
    //画曲线
//    [self DrawQuadCurve];
    
    //画矩形
//    [self DrawRect];
    
    //画椭圆
    [self DrawEllipseWithRect:rect];
    

}

//画椭圆
- (void)DrawEllipseWithRect:(CGRect)rect {
    
    
    /* 画椭圆 方法1
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect aRect= CGRectMake(20, 80, 160, 100);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
//    [[UIColor cyanColor] set];
    CGContextSetLineWidth(context, 3.0);
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
    */
    
    //圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    
    //画椭圆 方法2
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 50, 160, 100)];
    
    
    //ArcCenter:圆心
    //radius:圆的半径
    //startAngle:开始角度//起始点圆的最右侧.
    //endAngle:截至角度
    //clockwise:顺时针还是逆时针 YES:顺时针 NO:逆时针
    //扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat redius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat endA = - M_PI_2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:NO];
    [path addLineToPoint:center];
    [path closePath];
    
    
    [[UIColor greenColor] set];
    
    //fill 会自动把路径给关闭
    [path fill];
    
    
    
}

//画矩形
- (void)DrawRect {
    
    //1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2. 描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    //3. 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor cyanColor] set];
    
//    CGContextSetLineWidth(ctx, 20);
    
    // 4. 把上下文显示出来
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
    
}



//画曲线
- (void)DrawQuadCurve {
    
    //1. 获取跟View相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2. 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1 设置起点
    [path moveToPoint:CGPointMake(20, 150)];
    //2.2 添加一条线到某个点
    [path addQuadCurveToPoint:CGPointMake(160, 150) controlPoint:CGPointMake(90, -20)];
    
    CGContextSetLineWidth(ctx, 10);
    //3. 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4. 把上下文的内容显示出来
    CGContextStrokePath(ctx);
    
    
    
    
}



//画直线
- (void)DrawLine {
    
    //    JGLog(@"%@",NSStringFromCGRect(self.bounds));
    
    //1. 取得一个跟View相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2. 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1 设置起点
    [path moveToPoint:CGPointMake(10, 100)];
    //2.2 添加一根线到某个点
    [path addLineToPoint:CGPointMake(180, 20)];
    
    //一个路径上面可以画多条线
    [path moveToPoint:CGPointMake(10, 150)];
    [path addLineToPoint:CGPointMake(170, 10)];
    
    
    
    //把上一条线的终点当做是下一条线的起点
    [path addLineToPoint:CGPointMake(150, 180)];
    
    
    //设置上下文的 状态
    //设置线的宽度
    CGContextSetLineWidth(ctx, 10);
    //设置线的样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    //设置顶角的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //设置线的颜色
    [[UIColor greenColor] set];
    
    
    //3 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //4 把上下文的内容显示View fill stroke
    CGContextStrokePath(ctx);

}



@end
