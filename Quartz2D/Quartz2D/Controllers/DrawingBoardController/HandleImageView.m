//
//  HandleImageView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/29.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "HandleImageView.h"

@interface HandleImageView () <UIGestureRecognizerDelegate>

@property (nonatomic, weak)UIImageView *imageV;

@end


@implementation HandleImageView

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
}

- (UIImageView *)imageV {
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        imageV.userInteractionEnabled = YES;
        [self addSubview:imageV];
        _imageV = imageV;
        
        //添加手势
        [self addGes:imageV];
        
    }
    return _imageV;
}

- (void)addGes:(UIImageView *)imageV {
    
    //pan 拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [imageV addGestureRecognizer:pan];

    //pinch 捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [imageV addGestureRecognizer:pinch];
    
    //添加旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [imageV addGestureRecognizer:rotation];
    
    //长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPress.delegate = self;
    [imageV addGestureRecognizer:longPress];
}


#pragma mark - 拖拽时调用 -
- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint transP = [pan translationInView:pan.view];
    
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    //复位
    [pan setTranslation:CGPointZero inView:pan.view];
}

#pragma mark - 捏合时调用 -
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

#pragma mark - 旋转时调用 -
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    //旋转图片
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    
    //复位， 只要想相对于上一次旋转就复位
    rotation.rotation = 0;
}

#pragma mark - 长按时调用 -
- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            //设置为透明
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.imageV.alpha = 1;
                //把当前的View做一个截屏
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                //获取上下文
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctx];
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                //关闭上下文
                UIGraphicsEndImageContext();
                
                //调用代理的方法
                if ([self.delegate respondsToSelector:@selector(handleImageView:newImage:)]) {
                    [self.delegate handleImageView:self newImage:newImage];
                }
                
                //从父控件中移除
                [self removeFromSuperview];
            }];
        }];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end