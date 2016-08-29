//
//  BasicGraphicsVC.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "BasicGraphicsVC.h"
#import "ProgressView.h"

@interface BasicGraphicsVC ()

@property (weak, nonatomic) IBOutlet UILabel *textLbl;

@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end

@implementation BasicGraphicsVC

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)valueChange:(UISlider *)sender {
    
    JGLog(@"%f", sender.value);
    
    self.textLbl.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.progressView.progress = sender.value;
    
    
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
