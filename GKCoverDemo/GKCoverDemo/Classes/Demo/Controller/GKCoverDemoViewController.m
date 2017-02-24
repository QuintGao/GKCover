//
//  GKCoverDemoViewController.m
//  GKCoverDemo
//
//  Created by 高坤 on 2016/11/5.
//  Copyright © 2016年 高坤. All rights reserved.
//

#import "GKCoverDemoViewController.h"

@interface GKCoverDemoViewController ()

@end

@implementation GKCoverDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.translucent = NO;
}

- (IBAction)topClick:(id)sender {
    
    UIImage *topImage = [UIImage imageNamed:@"top1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:topImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * topImage.size.height / topImage.size.width);
    
    __block UIView *view = [UIView new];
    view.frame = CGRectMake(0, 64, KScreenW, KScreenH - 64);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    [GKCover coverFrom:view contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleTop animStyle:GKCoverAnimStyleTop notClick:NO showBlock:^{
        NSLog(@"遮罩显示了");
    } hideBlock:^{
        NSLog(@"遮罩隐藏了");
        [view removeFromSuperview];
        view = nil;
    }];
}

- (IBAction)centerClick:(id)sender {
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter animStyle:GKCoverAnimStyleTop notClick:NO];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}

- (IBAction)bottomClick:(id)sender {
    
    UIImage *bottomImage = [UIImage imageNamed:@"share1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bottomImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * bottomImage.size.height / bottomImage.size.width);
    
    [GKCover coverFrom:self.view contentView:imgView style:GKCoverStyleBlur showStyle:GKCoverShowStyleBottom animStyle:GKCoverAnimStyleBottom notClick:NO];
}

- (void)imgClick
{
    [GKCover hideView];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}

@end
