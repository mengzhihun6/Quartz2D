//
//  DrawView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "DrawView.h"
#import "JGBezierPath.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, assign) CGFloat Width;
@property (nonatomic, strong)UIColor *color;

@end

@implementation DrawView

- (NSMutableArray *)pathArray {
    if (!_pathArray) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}


//清屏
- (void)clear {
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
    
}
//撤销
- (void)undo {
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}
//橡皮擦
- (void)erase {
    [self setLineColor:[UIColor whiteColor]];
    
}
//设置线的宽度
- (void)setLineWidth:(CGFloat)width {
    self.Width = width;
    [self setNeedsDisplay];
}
//设置颜色
- (void)setLineColor:(UIColor *)color {
   
    self.color = color;
    [self setNeedsDisplay];
}

- (void)setImage:(UIImage *)image {
    
    _image = image;
    [self.pathArray addObject:image];
    [self setNeedsDisplay];
}

- (IBAction)pan:(UIPanGestureRecognizer *)pan {
   
    CGPoint curP = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
      
        JGBezierPath *path = [[JGBezierPath alloc] init];
        self.path = path;
        //设置线宽度
        [path setLineWidth:self.Width];
        [self.pathArray addObject:path];
        path.color = self.color;
        [path moveToPoint:curP];
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:curP];
        [self setNeedsDisplay];
    }
    
    
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    for (JGBezierPath *path in self.pathArray) {
        if ([path isKindOfClass:[UIImage class]]) {
            
            UIImage *img = (UIImage *)path;
            [img drawInRect:rect];
        }else {
            [path.color set];
            [path stroke];
        }
    } 
}


@end
