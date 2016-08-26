//
//  GKCover.h
//  GKCoverDemo
//
//  Created by 高坤 on 16/8/24.
//  Copyright © 2016年 高坤. All rights reserved.
//  GKCover-一个简单的遮罩视图，让你的弹窗更easy，支持自定义遮罩弹窗

#import <UIKit/UIKit.h>

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

typedef void(^showBlock)();
typedef void(^hideBlock)();

@interface GKCover : UIView

+ (instancetype)cover;

#pragma makr - 自定义遮罩- (可实现固定遮罩的效果)
/**
 *  半透明遮罩构造方法
 */
+ (instancetype)translucentCoverWithTarget:(id)target action:(SEL)action;

/**
 *  全透明遮罩构造方法
 */
+ (instancetype)transparentCoverWithTarget:(id)target action:(SEL)action;


#pragma mark - 固定遮罩-屏幕底部弹窗
/**
 *  半透明遮罩，默认黑色，0.5
 */
+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated;

+ (void)translucentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated showBlock:(showBlock)show hideBlock:(hideBlock)hide;

/**
 *  改变透明度(仅用于半透明遮罩)
 */
+ (void)changeAlpha:(CGFloat)alpha;

/**
 *  全透明遮罩
 */
+ (void)transparentCoverFrom:(UIView *)fromView content:(UIView *)contentView animated:(BOOL)animated;

#pragma mark - 固定遮罩-屏幕中间弹窗
/**
 *  半透明遮罩，默认黑色，0.5
 *
 *  @param contentView 弹出的内容视图
 *  @param animated    是否动画
 */
+ (void)translucentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated;

/**
 *  全透明遮罩
 *
 *  @param contentView 弹出的内容视图
 *  @param animated    是否动画
 */
+ (void)transparentWindowCenterCoverContent:(UIView *)contentView animated:(BOOL)animated;

@end
