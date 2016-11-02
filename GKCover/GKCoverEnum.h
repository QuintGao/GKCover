//
//  GKCoverEnum.h
//  GKCoverDemo
//
//  Created by 高坤 on 2016/11/2.
//  Copyright © 2016年 高坤. All rights reserved.
//

#ifndef GKCoverEnum_h
#define GKCoverEnum_h

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height
/** 默认动画时间 */
#define kAnimDuration 0.25
/** 默认透明度 */
#define kAlpha 0.5

/** 遮罩类型 */
typedef NS_ENUM(NSUInteger, GKCoverStyle) {
    GKCoverStyleTranslucent,  // 半透明
    GKCoverStyleTransparent,  // 全透明
    GKCoverStyleBlur          // 高斯模糊
};

/** 视图显示类型 */
typedef NS_ENUM(NSUInteger, GKCoverShowStyle) {
    GKCoverShowStyleTop,     // 显示在上面
    GKCoverShowStyleCenter,  // 显示在中间
    GKCoverShowStyleBottom   // 显示在底部
};

/** 动画类型 */
typedef NS_ENUM(NSUInteger, GKCoverAnimStyle) {
    GKCoverAnimStyleTop,      // 从上弹出 (上，中可用)
    GKCoverAnimStyleCenter,   // 中间弹出 (中可用)
    GKCoverAnimStyleBottom,   // 底部弹出,底部消失 (中，下可用)
    GKCoverAnimStyleNone      // 无动画
};

#endif /* GKCoverEnum_h */
