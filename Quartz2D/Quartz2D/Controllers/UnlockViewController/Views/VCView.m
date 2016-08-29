//
//  VCView.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "VCView.h"

@implementation VCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *img = [UIImage imageNamed:@"Home_refresh_bg"];
    [img drawInRect:rect];
    
}


@end
