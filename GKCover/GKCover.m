//
//  GKCover.m
//  GKCoverDemo
//
//  Created by 高坤 on 16/8/24.
//  Copyright © 2016年 高坤. All rights reserved.
//  GKCover-一个简单的遮罩视图，让你的弹窗更easy，支持自定义遮罩弹窗
//  github:https://github.com/QuintGao/GKCover

#import "GKCover.h"
#import "UIView+GKExtension.h"

@implementation GKCover

static GKCover   *_cover;
static UIView    *_fromView;
static UIView    *_contentView;
static BOOL      _animated;
static showBlock _showBlock;
static hideBlock _hideBlock;
static BOOL      _notclick;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 自动伸缩
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _animated = NO;
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
    [self translucentCoverFrom:fromView content:contentView animated:animated notClick:NO];
}

+ (void)changeAlpha:(CGFloat)alpha
{
    _cover.alpha = alpha;
}

+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated
{
    [self transparentCoverFrom:fromView content:contentView animated:animated notClick:NO];
}

#pragma mark - 固定遮罩-屏幕中间弹窗

+ (void)translucentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated
{
    [self translucentWindowCenterCoverContent:contentView animated:animated notClick:NO];
}

+ (void)transparentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated
{
    [self transparentWindowCenterCoverContent:contentView animated:animated notClick:NO];
}

#pragma mark - v1.0.5 新增功能
#pragma makr - 新增弹窗显示和隐藏时的block

/**
 *  半透明遮罩-底部弹窗，添加显示和隐藏的block
 */
+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide
{
    [self translucentCoverFrom:fromView content:contentView animated:animated notClick:NO showBlock:show hideBlock:hide];
}

/**
 *  全透明遮罩-底部弹窗，添加显示和隐藏的block
 */
+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide
{
    [self transparentCoverFrom:fromView content:contentView animated:animated notClick:NO showBlock:show hideBlock:hide];
}

/**
 *  半透明遮罩-中间弹窗，添加显示和隐藏的block
 */
+ (void)translucentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide
{
    UIWindow *window = [self getKeyWindow];
    
    [self translucentCoverFrom:window content:contentView animated:animated notClick:NO showBlock:show hideBlock:hide];
}

/**
 *  全透明遮罩-中间弹窗，添加显示和隐藏的block
 */
+ (void)transparentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide
{
    UIWindow *window = [self getKeyWindow];
    
    [self transparentCoverFrom:window content:contentView animated:animated notClick:NO showBlock:show hideBlock:hide];
}

#pragma mark - v2.0.2新增方法,使用更加方便
#pragma makr - 新增功能：增加点击遮罩时是否消失的判断,canClick是否可以点击，默认是YES

+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)click
{
    [self translucentCoverFrom:fromView content:contentView animated:animated notClick:click showBlock:nil hideBlock:nil];
}

+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)click
{
    [self transparentCoverFrom:fromView content:contentView animated:animated notClick:click showBlock:nil hideBlock:nil];
}

+ (void)translucentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)click
{
    UIWindow *window = [self getKeyWindow];

    [self translucentCoverFrom:window content:contentView animated:animated notClick:click showBlock:nil hideBlock:nil];
}

+ (void)transparentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)click
{
    UIWindow *window = [self getKeyWindow];
    
    [self transparentCoverFrom:window content:contentView animated:animated notClick:click showBlock:nil hideBlock:nil];
}

#pragma mark - v2.1.0
#pragma mark - 新增毛玻璃遮罩效果

+ (void)blurCoverFrom:(UIView *)fromView contentView:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)notClick style:(UIBlurEffectStyle)style
{
    [self blurCoverFrom:fromView contentView:contentView animated:animated notClick:notClick style:style showBlock:nil hideBlock:nil];
}

+ (void)blurCoverFrom:(UIView *)fromView contentView:(UIView *)contentView animated:(BOOL)animated style:(UIBlurEffectStyle)style showBlock:(showBlock)showBlock hideBlock:(hideBlock)hideBlock
{
    [self blurCoverFrom:fromView contentView:contentView animated:animated notClick:NO style:style showBlock:showBlock hideBlock:hideBlock];
}

+ (void)blurWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)notClick style:(UIBlurEffectStyle)style
{
    UIWindow *window = [self getKeyWindow];
    
    [self blurCoverFrom:window contentView:contentView animated:animated notClick:notClick style:style showBlock:nil hideBlock:nil];
}

+ (void)blurWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated style:(UIBlurEffectStyle)style showBlock:(showBlock)showBlock hideBlock:(hideBlock)hideBlock
{
    UIWindow *window = [self getKeyWindow];
    
    [self translucentCoverFrom:window content:contentView animated:animated notClick:NO showBlock:showBlock hideBlock:hideBlock];
}


#pragma mark - 私有方法
#pragma mark - 增加内部私有方法，v2.0.0新增
/**
 *  显示一个半透明遮罩
 *
 *  @param fromView          显示在此view上
 *  @param contentView       遮罩上面显示的内容view
 *  @param animated          是否有动画 ：默认是NO
 *  @param notClick          是否不能点击：默认是NO，即能点击
 *  @param show              显示时的block
 *  @param transparentBgView 隐藏时的block
 */
+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)notClick showBlock:(showBlock)showBlock hideBlock:(hideBlock)hideBlock
{
    // 创建遮罩
    GKCover *cover = [self cover];
    // 设置大小和颜色
    cover.frame = fromView.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    // 添加遮罩
    [fromView addSubview:cover];
    _cover = cover;
    
    // 如果遮罩能点
    if (!notClick) {
        [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
    
    // 赋值
    _fromView  = fromView;
    _contentView = contentView;
    _animated  = animated;
    _notclick  = notClick;
    _showBlock = showBlock;
    _hideBlock = hideBlock;
    
    // 显示内容view
    [self showContentView];
}

/**
 *  全透明遮罩
 *
 *  @param fromView    显示在此view上
 *  @param contentView 遮罩上面显示的内容view
 *  @param animated    是否有显示动画
 *  @param notClick    是否不能点击，默认是NO，即能点击
 *  @param showBlock   显示时的block
 *  @param hideBlock   隐藏时的block
 */
+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)notClick showBlock:(showBlock)showBlock hideBlock:(hideBlock)hideBlock
{
    // 创建遮罩
    GKCover *cover = [self cover];
    cover.frame = fromView.bounds;
    cover.backgroundColor = [UIColor clearColor];
    [fromView addSubview:cover];
    _cover = cover;
    
    // 赋值
    _fromView  = fromView;
    _contentView = contentView;
    _animated  = animated;
    _notclick  = notClick;
    _showBlock = showBlock;
    _hideBlock = hideBlock;
    // 添加透明背景
    [cover addSubview:[self transparentBgView]];
    
    // 显示内容view
    [self showContentView];
}

+ (void)blurCoverFrom:(UIView *)fromView contentView:(UIView *)contentView animated:(BOOL)animated notClick:(BOOL)notClick style:(UIBlurEffectStyle)style showBlock:(showBlock)showBlock hideBlock:(hideBlock)hideBlock
{
    // 创建遮罩
    GKCover *cover = [self cover];
    cover.frame = fromView.bounds;
    cover.backgroundColor = [UIColor clearColor];
    [fromView addSubview:cover];
    _cover = cover;
    
    // 添加手势
    if (!notClick) {
        [cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
    
    // 添加高斯模糊效果,添加毛玻璃效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = cover.bounds;
    
    [cover addSubview:effectview];
    
    // 赋值
    _fromView    = fromView;
    _contentView = contentView;
    _animated    = animated;
    _notclick    = notClick;
    _showBlock   = showBlock;
    _hideBlock   = hideBlock;
    
    // 显示内容view
    [self showContentView];
}


/**
 *  透明图片
 */
+ (UIImageView *)transparentBgView
{
    UIImageView *bgView = [UIImageView new];
    bgView.gk_size = _cover.gk_size;
    bgView.image = [UIImage imageNamed:@"transparent_bg"];
    bgView.userInteractionEnabled = YES;
    if (!_notclick) {
        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
    return bgView;
}

+ (UIImageView *)blurBgView
{
    UIImageView *bgView = [UIImageView new];
    bgView.gk_size = _cover.gk_size;
    [bgView setImageToBlur:[UIImage imageNamed:@"transparent_bg"] completionBlock:nil];
    if (!_notclick) {
        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
    return bgView;
}

+ (UIWindow *)getKeyWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

+ (void)showContentView
{
    if ([_fromView isKindOfClass:[UIWindow class]]) {
        _contentView.center = _fromView.center;
        [_fromView addSubview:_contentView];
        if (_animated) {
            [self animationAlert:_contentView];
        }
    }else{
        [_fromView addSubview:_contentView];
        
        [self show];
    }
}

/**
 *  中间弹窗动画
 */
+ (void)animationAlert:(UIView*)view{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    animation.delegate = _cover;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    
    [view.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    !_showBlock ? : _showBlock();
}

/**
 *  显示
 */
+ (void)show
{
    if (_animated) {
        _contentView.gk_y = KScreenH;
        [UIView animateWithDuration:0.25 animations:^{
            _contentView.gk_y = KScreenH - _contentView.gk_height;
        }completion:^(BOOL finished) {
            !_showBlock ? : _showBlock();
        }];
    }else{
        !_showBlock ? : _showBlock();
        _contentView.gk_y = KScreenH - _contentView.gk_height;
    }
}
/**
 *  隐藏
 */
+ (void)hide{
    if (_animated && ![_fromView isKindOfClass:[UIWindow class]]) {
        
        [UIView animateWithDuration:0.25 animations:^{
            _contentView.gk_y = KScreenH;
        }completion:^(BOOL finished) {
            [_cover removeFromSuperview];
            [_contentView removeFromSuperview];
            !_hideBlock ? : _hideBlock();
        }];
    }else{
        [_cover removeFromSuperview];
        [_contentView removeFromSuperview];
        !_hideBlock ? : _hideBlock();
    }
}


@end
