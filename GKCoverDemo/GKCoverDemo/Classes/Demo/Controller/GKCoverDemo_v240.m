//
//  GKCoverDemo_v240.m
//  GKCoverDemo
//
//  Created by 高坤 on 2017/2/24.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKCoverDemo_v240.h"
#import "GKCover.h"

@interface GKCoverDemo_v240 ()

@end

@implementation GKCoverDemo_v240

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)top01:(id)sender {
    UIImage *topImage = [UIImage imageNamed:@"top1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:topImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * topImage.size.height / topImage.size.width);
    
    __block UIView *view = [UIView new];
    view.frame = CGRectMake(0, 64, KScreenW, KScreenH - 64);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    [GKCover coverFrom:view contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleTop showAnimStyle:GKCoverShowAnimStyleTop hideAnimStyle:GKCoverHideAnimStyleTop notClick:NO showBlock:nil hideBlock:^{
        [view removeFromSuperview];
        view = nil;
    }];
}

- (IBAction)top02:(id)sender {
    UIImage *topImage = [UIImage imageNamed:@"top1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:topImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * topImage.size.height / topImage.size.width);
    
    __block UIView *view = [UIView new];
    view.frame = CGRectMake(0, 64, KScreenW, KScreenH - 64);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    [GKCover coverFrom:view contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleTop showAnimStyle:GKCoverShowAnimStyleTop hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO showBlock:nil hideBlock:^{
        [view removeFromSuperview];
        view = nil;
    }];
}
- (IBAction)center01:(id)sender {
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
//    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleTop hideAnimStyle:GKCoverHideAnimStyleBottom notClick:YES];
//    
//    if ([GKCover hasCover]) {
//        NSLog(@"遮罩已存在");
//    }else{
//        NSLog(@"遮罩不存在");
//    }
    
    [GKCover coverHideStatusBarWithContentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleCenter hideAnimStyle:GKCoverHideAnimStyleCenter notClick:YES showBlock:nil hideBlock:nil];
    
    
}
- (IBAction)center02:(id)sender {
    
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleTop notClick:YES];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}
- (IBAction)center03:(id)sender {
    
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleCenter hideAnimStyle:GKCoverHideAnimStyleCenter notClick:YES];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}
- (IBAction)center04:(id)sender {
    
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleNone notClick:YES];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}
- (IBAction)bottom01:(id)sender {
    UIImage *bottomImage = [UIImage imageNamed:@"share1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bottomImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * bottomImage.size.height / bottomImage.size.width);
    
    [GKCover coverFrom:self.view contentView:imgView style:GKCoverStyleBlur showStyle:GKCoverShowStyleBottom showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleBottom notClick:NO];
}
- (IBAction)bottom02:(id)sender {
    UIImage *bottomImage = [UIImage imageNamed:@"share1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bottomImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * bottomImage.size.height / bottomImage.size.width);
    
    [GKCover coverFrom:self.view contentView:imgView style:GKCoverStyleBlur showStyle:GKCoverShowStyleBottom showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO];
}

- (void)imgClick
{
    [GKCover hideCover];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
