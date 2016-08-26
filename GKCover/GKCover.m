//
//  GKCover.m
//  GKCoverDemo
//
//  Created by 高坤 on 16/8/24.
//  Copyright © 2016年 高坤. All rights reserved.
//  GKCover-一个简单的遮罩视图，让你的弹窗更easy，支持自定义遮罩弹窗

#import "GKCover.h"
#import "UIView+GKExtension.h"

@implementation GKCover

static GKCover *_cover;
static UIView  *_contentView;
static BOOL     _animted;
static hideBlock _hide;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 自动伸缩
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _animted = NO;
    }
    return self;
}

+ (instancetype)cover
{
    return [[self alloc] init];
}

#pragma makr - 自定义遮罩 - (可实现固定遮罩的效果)
/**
 *  半透明遮罩构造方法
 */
+ (instancetype)translucentCoverWithTarget:(id)target action:(SEL)action
{
    GKCover *cover = [self cover];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    
    return cover;
}

/**
 *  全透明遮罩构造方法
 */
+ (instancetype)transparentCoverWithTarget:(id)target action:(SEL)action
{
    GKCover *cover = [self cover];
    cover.backgroundColor = [UIColor clearColor];
    
    UIImageView *bgView = [UIImageView new];
    bgView.gk_size = CGSizeMake(KScreenW, KScreenH);
    bgView.image = [UIImage imageNamed:@"transparent_bg"];
    bgView.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    [cover addSubview:bgView];
    
    return cover;
}


#pragma mark - 固定遮罩-屏幕底部弹窗

+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated
{
    GKCover *cover = [self cover];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    cover.frame = fromView.bounds;
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:cover action:@selector(hidden)]];
    [fromView addSubview:cover];
    _cover = cover;
    
    [fromView addSubview:contentView];
    _contentView = contentView;
    
    _animted = animated;
    if (animated) {
        contentView.gk_y = KScreenH;
        [UIView animateWithDuration:0.25 animations:^{
            contentView.gk_y = KScreenH - contentView.gk_height;
        }];
    }else{
        contentView.gk_y = KScreenH - contentView.gk_height;
    }
}

+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide
{
    GKCover *cover = [self cover];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    cover.frame = fromView.bounds;
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:cover action:@selector(hidden)]];
    [fromView addSubview:cover];
    _cover = cover;
    
    [fromView addSubview:contentView];
    _contentView = contentView;
    
    _animted = animated;
    _hide = hide;
    
    !show ? : show();
    
    if (animated) {
        contentView.gk_y = KScreenH;
        [UIView animateWithDuration:0.25 animations:^{
            contentView.gk_y = KScreenH - contentView.gk_height;
        }];
    }else{
        contentView.gk_y = KScreenH - contentView.gk_height;
    }
}

+ (void)changeAlpha:(CGFloat)alpha
{
    _cover.alpha = alpha;
}

+ (UIImageView *)transparentBgView
{
    UIImageView *bgView = [UIImageView new];
    bgView.gk_size = CGSizeMake(KScreenW, KScreenH);
    bgView.image = [UIImage imageNamed:@"transparent_bg"];
    bgView.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:_cover action:@selector(hidden)]];
    return bgView;
}

+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated
{
    GKCover *cover = [self cover];
    cover.frame = fromView.bounds;
    cover.backgroundColor = [UIColor clearColor];
    [fromView addSubview:cover];
    _cover = cover;
    
    [cover addSubview:[self transparentBgView]];
    
    [fromView addSubview:contentView];
    _contentView = contentView;
    
    _animted = animated;
    if (animated) {
        contentView.gk_y = KScreenH;
        [UIView animateWithDuration:0.25 animations:^{
            contentView.gk_y = KScreenH - contentView.gk_height;
        }];
    }else{
        contentView.gk_y = KScreenH - contentView.gk_height;
    }
}

#pragma mark - 固定遮罩-屏幕中间弹窗

+ (void)translucentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    GKCover *cover = [self cover];
    cover.frame = window.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.1;
    [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:cover action:@selector(hidden)]];
    [window addSubview:cover];
    _cover = cover;
    
    contentView.center = window.center;
    [window addSubview:contentView];
    _contentView = contentView;
    
    if (animated) {
        [self animationAlert:contentView];
    }
}

+ (void)transparentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    GKCover *cover = [self cover];
    cover.frame = window.bounds;
    cover.backgroundColor = [UIColor clearColor];
    [window addSubview:cover];
    _cover = cover;
    
    [cover addSubview:[self transparentBgView]];
    
    contentView.center = window.center;
    [window addSubview:contentView];
    _contentView = contentView;
    
    if (animated) {
        [self animationAlert:contentView];
    }
}

+ (void)animationAlert:(UIView*)view{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
}

/**
 *  隐藏
 */
- (void)hidden{
    if (_animted) {
        [UIView animateWithDuration:0.25 animations:^{
            _contentView.gk_y = KScreenH;
        }completion:^(BOOL finished) {
            [_cover removeFromSuperview];
            [_contentView removeFromSuperview];
            !_hide ? : _hide();
        }];
    }else{
        [_cover removeFromSuperview];
        [_contentView removeFromSuperview];
        !_hide ? : _hide();
    }
}


@end
