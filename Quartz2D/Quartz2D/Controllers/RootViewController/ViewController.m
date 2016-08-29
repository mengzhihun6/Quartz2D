//
//  ViewController.m
//  Quartz2D
//
//  Created by stkcctv on 16/8/28.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "ViewController.h"
#import "BasicGraphicsVC.h"
#import "BorderClipVC.h"
#import "PictureClipVC.h"
#import "PictureEraseVC.h"
#import "UnlockVC.h"
#import "DrawingBoardVC.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)NSArray *dataArrM;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSArray *)dataArrM {
    
    if (!_dataArrM) {
        _dataArrM = @[@"BasicGraphicsVC", //基本用法
                      @"BorderClipVC",   //边框裁剪
                      @"PictureClipVC", //图片裁剪
                      @"PictureEraseVC", //图片擦除
                      @"UnlockVC",       //手势解锁
                      @"DrawingBoardVC"  //画板
                      ];
    }
    return _dataArrM;
}


#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [_dataArrM objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        BasicGraphicsVC *basicVC = [[BasicGraphicsVC alloc] init];
        [self.navigationController pushViewController:basicVC animated:YES];
    } if (indexPath.row == 1) {
        
        BorderClipVC *clipVC = [[BorderClipVC alloc] init];
        [self.navigationController pushViewController:clipVC animated:YES];
    }if (indexPath.row == 2) {
        
        PictureClipVC *pcClicpVC = [[PictureClipVC alloc] init];
        [self.navigationController pushViewController:pcClicpVC animated:YES];
    }else if (indexPath.row == 3) {
        
        PictureEraseVC *eraseVC = [[PictureEraseVC alloc] init];
        [self.navigationController pushViewController:eraseVC animated:YES];
    }else if (indexPath.row == 4) {
        
        UnlockVC *lockVC = [[UnlockVC alloc] init];
        [self.navigationController pushViewController:lockVC animated:YES];
    }else if (indexPath.row == 5) {
        
        DrawingBoardVC *drawVC = [[DrawingBoardVC alloc] init];
        [self.navigationController pushViewController:drawVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
