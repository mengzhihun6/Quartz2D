//
//  ClockView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ClockView.h"

@interface ClockView ()

@property (nonatomic, strong) NSMutableArray *selectBtn;
@property (nonatomic, assign) CGPoint curP;

@end

@implementation ClockView

- (NSMutableArray *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [NSMutableArray array];
    }
    return _selectBtn;
}


- (void)awakeFromNib {
    
    //添加按钮
    [self setUP];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加按钮
        [self setUP];
    }
    return self;
}


- (void)setUP {
    
    for (int i = 0; i < 9; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int clomn = 3;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat btnWH = 74;
    
    CGFloat margin = (self.bounds.size.width - btnWH * clomn) / (clomn + 1);
    for (int i = 0; i < self.subviews.count; i++) {
        int curCloumn = i % clomn;
        int curRow = i / clomn;
        x = margin + curCloumn * (btnWH + margin);
        y = curRow * (btnWH + margin);
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
 
    }
 
}

//手指开始点击
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    JGFunc;
    CGPoint curP = [self getCurrentPoint:touches];
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn) {
        btn.selected = YES;
        [self.selectBtn addObject:btn];
    }
}

//手指移动的时候调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //获取当前手指所在的点
    CGPoint curP = [self getCurrentPoint:touches];
    self.curP = curP;
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectBtn addObject:btn];
    }
    [self setNeedsDisplay];
}

//手指离开屏幕时调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //取消选中的按钮状态
    NSMutableString *str = [NSMutableString string];
    
    for (UIButton *btn in self.selectBtn) {
        [str appendFormat:@"%d",(int)btn.tag];
        btn.selected = NO;
    }
    
    NSLog(@"%@",str);
    
    //清空路径
    [self.selectBtn removeAllObjects];
    [self setNeedsDisplay];
    
}





//获取当前手指所在的点
- (CGPoint)getCurrentPoint:(NSSet *)touches {
    
    UITouch *touch  = [touches anyObject];
    return [touch locationInView:self];
}

//判断当前手指在不在按钮上
- (UIButton *)btnRectContainsPoint:(CGPoint)point {
    for (UIButton *btn in self.subviews) {
        
        //判断当前手指在不在按钮上
        //判断一个点在不在某个区域当中
        if (CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.selectBtn.count <= 0) return;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.selectBtn.count; i++) {
        
        UIButton *btn = self.selectBtn[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        }else {
            [path addLineToPoint:btn.center];
        }
 
    }
    
    [path addLineToPoint:self.curP];
    
    [[UIColor greenColor] set];
    [path setLineWidth:10];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
}


@end
