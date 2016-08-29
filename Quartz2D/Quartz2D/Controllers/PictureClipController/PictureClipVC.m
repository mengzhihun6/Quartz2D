//
//  PictureClipVC.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "PictureClipVC.h"

@interface PictureClipVC ()

//手指开始点
@property (nonatomic, assign)CGPoint startP;
//遮盖
@property (nonatomic, weak) UIView *coverView;

@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation PictureClipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UIView *)coverView {
    
    if (!_coverView) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.7;
        [self.view addSubview:view];
        _coverView  = view;
    }
    return _coverView;
}


- (IBAction)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint curP = [pan locationInView:self.view];
    
//    JGLog(@"%@",NSStringFromCGPoint(curP));
    
    if (pan.state == UIGestureRecognizerStateBegan) {
       
        CGPoint startP = curP;
        self.startP = startP;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
       
        CGFloat offsetX = curP.x - self.startP.x;
        CGFloat offsetY = curP.y - self.startP.y;
        //确定遮盖的区域位置
        CGRect rect = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
        //每次移动时，调用遮盖的frame
        self.coverView.frame = rect;
    }else if (pan.state == UIGestureRecognizerStateEnded) {
       
        //1. 开启一个跟原始图片相同大小的图片上下文
        UIGraphicsBeginImageContextWithOptions(self.imgV.bounds.size, NO, 0);
        //2. 把self.cover.frame 设为裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [path addClip];
        
        //3. 获取当前上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //4. 把UIImageView当中的图片绘制上下文中
        [self.imgV.layer renderInContext:ctx];
        //5. 从上下文中生成一张新的图片
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        //6. 关闭上下文
        UIGraphicsEndImageContext();
        
        //7. 给图片重新赋值
        self.imgV.image = newImg;
        
        //8. 移除遮盖
        [self.coverView removeFromSuperview];
    }
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
