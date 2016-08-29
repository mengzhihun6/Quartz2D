//
//  HandleImageView.h
//  Quartz2D
//
//  Created by stkcctv on 16/8/29.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HandleImageView;
@protocol HandleImageViewDelegate <NSObject>


- (void)handleImageView:(HandleImageView *)handleImageV newImage:(UIImage *)image;

@end


@interface HandleImageView : UIView


/** 图片  */
@property (nonatomic, strong)UIImage *image;
/** 代理 */
@property (nonatomic, weak) id<HandleImageViewDelegate> delegate;

@end
