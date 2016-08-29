//
//  BorderClipVC.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "BorderClipVC.h"
#import "UIImage+image.h"

@interface BorderClipVC ()
@property (weak, nonatomic) IBOutlet UIImageView *Img0;
@property (weak, nonatomic) IBOutlet UIImageView *Img1;
@property (weak, nonatomic) IBOutlet UIImageView *Img2;
@property (weak, nonatomic) IBOutlet UIImageView *Img3;
@property (weak, nonatomic) IBOutlet UIImageView *Img4;
@end

@implementation BorderClipVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.Img0.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"round"]];
    self.Img1.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"round"]];
    self.Img2.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"round"]];
    self.Img3.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"round"]];
    self.Img4.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"阿狸头像"]];

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
