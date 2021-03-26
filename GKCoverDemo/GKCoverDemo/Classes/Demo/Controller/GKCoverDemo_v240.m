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
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

- (IBAction)top01:(id)sender {
    UIImage *topImage = [UIImage imageNamed:@"top1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:topImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * topImage.size.height / topImage.size.width);
    
    __block UIView *view = [UIView new];
    view.frame = CGRectMake(0, 64, KScreenW, KScreenH - 64);
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    [GKCover coverFrom:view
           contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleTop
         showAnimStyle:GKCoverShowAnimStyleTop
         hideAnimStyle:GKCoverHideAnimStyleTop
              notClick:NO
             showBlock:nil
             hideBlock:^{
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
    
    [GKCover coverFrom:view
           contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleTop
         showAnimStyle:GKCoverShowAnimStyleTop
         hideAnimStyle:GKCoverHideAnimStyleNone
              notClick:NO
             showBlock:nil
             hideBlock:^{
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
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow
           contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleCenter
         showAnimStyle:GKCoverShowAnimStyleTop
         hideAnimStyle:GKCoverHideAnimStyleBottom
              notClick:YES showBlock:^{
                  NSLog(@"遮罩显示了。。。");
              } hideBlock:^{
                  NSLog(@"遮罩消失了。。。");
              }];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else {
        NSLog(@"遮罩不存在");
    }
    
//    [GKCover coverHideStatusBarWithContentView:imgView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleBottom showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleBottom notClick:YES showBlock:nil hideBlock:nil];
    
}

- (IBAction)center02:(id)sender {
    
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow
           contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleCenter
         showAnimStyle:GKCoverShowAnimStyleBottom
         hideAnimStyle:GKCoverHideAnimStyleTop
              notClick:YES];
    
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
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow
           contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleCenter
         showAnimStyle:GKCoverShowAnimStyleCenter
         hideAnimStyle:GKCoverHideAnimStyleCenter
              notClick:YES];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
    
    [GKCover changeCoverBgColor:[UIColor greenColor]];
}
- (IBAction)center04:(id)sender {
    
    UIImage *centerImage = [UIImage imageNamed:@"share2"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:centerImage];
    imgView.gk_size = CGSizeMake(300, 340);
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)]];
    
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:imgView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleCenter
         showAnimStyle:GKCoverShowAnimStyleBottom
         hideAnimStyle:GKCoverHideAnimStyleNone
              notClick:YES];
    
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
    
    UIView *contentView = [UIView new];
    [contentView addSubview:imgView];
    contentView.gk_size = CGSizeMake(imgView.gk_width, imgView.gk_height + 34.0f);
    
    [GKCover coverFrom:self.view
           contentView:contentView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleBottom
         showAnimStyle:GKCoverShowAnimStyleBottom
         hideAnimStyle:GKCoverHideAnimStyleBottom
              notClick:NO];
}
- (IBAction)bottom02:(id)sender {
    UIImage *bottomImage = [UIImage imageNamed:@"share1"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bottomImage];
    imgView.gk_size = CGSizeMake(KScreenW, KScreenW * bottomImage.size.height / bottomImage.size.width);
    
    [GKCover coverFrom:self.view
           contentView:imgView
                 style:GKCoverStyleBlur
             showStyle:GKCoverShowStyleBottom
         showAnimStyle:GKCoverShowAnimStyleBottom
         hideAnimStyle:GKCoverHideAnimStyleNone
              notClick:NO];
}
- (IBAction)bottom03:(id)sender {
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.gk_size = CGSizeMake(KScreenW, 160.0f);
    [blueView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bottom03ViewClick:)]];
    
    [GKCover coverFrom:self.view
           contentView:blueView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleBottom
         showAnimStyle:GKCoverShowAnimStyleBottom
         hideAnimStyle:GKCoverHideAnimStyleBottom
              notClick:YES];
}

- (IBAction)left:(id)sender {
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.gk_size = CGSizeMake(120, KScreenH);
    
    [GKCover coverFrom:self.view
           contentView:redView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleLeft
         showAnimStyle:GKCoverShowAnimStyleLeft
         hideAnimStyle:GKCoverHideAnimStyleLeft
              notClick:NO];
}

- (IBAction)right:(id)sender {
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.gk_size = CGSizeMake(120, KScreenH);
    
    [GKCover coverFrom:self.view
           contentView:redView
                 style:GKCoverStyleTranslucent
             showStyle:GKCoverShowStyleRight
         showAnimStyle:GKCoverShowAnimStyleRight
         hideAnimStyle:GKCoverHideAnimStyleRight
              notClick:NO];
}

- (IBAction)customAnim:(id)sender {
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = UIColor.whiteColor;
    contentView.layer.cornerRadius = 10;
    contentView.layer.masksToBounds = YES;
    contentView.gk_size = CGSizeMake(300, 100);
    
    [GKCover showAlertViewFrom:self.view contentView:contentView style:GKCoverStyleTranslucent animation:popAnimation notClick:NO];
}

- (void)bottom03ViewClick:(id)sender {
    [GKCover hideCover];
    
    // 这里需要延迟弹窗，防止动画冲突
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self bottom02:nil];
    });
}

- (void)imgClick
{
    [GKCover hideCoverWithHideBlock:^{
        NSLog(@"隐藏block。。。。。");
    }];
    
    if ([GKCover hasCover]) {
        NSLog(@"遮罩已存在");
    }else{
        NSLog(@"遮罩不存在");
    }
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
