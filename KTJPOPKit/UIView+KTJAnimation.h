//
//  UIView+KTJAnimation.h
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/19.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  摩擦力
 */
extern CGFloat KTJDynamicsFriction;
/**
 *  弹力
 */
extern CGFloat KTJSpringBounciness;

@interface UIView (KTJAnimation)

/**
 *  上下抖动    ⚠️：只可用于frame设置完毕。
 *
 *  @param distance 抖动距离
 */
- (void)ktj_shakeUpDown:(CGFloat)distance;
/**
 *  左右抖动    ⚠️：只可用于frame设置完毕。
 *
 *  @param distance 抖动距离
 */
- (void)ktj_shakeLeftRight:(CGFloat)distance;

/**
 *  弹性动画    ⚠️：默认多次延用上一个终点
 *
 *  @param frame   弹性动画起始位置
 *  @param toFrame 弹性动画结束位置
 */
- (void)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame;

/**
 *  做一个弹性动画    ⚠️：默认多次延用上一个终点
 *
 *  @param frame   起始frame
 *  @param toFrame 目的frame
 *  @param layer   动画的layer
 */
+ (void)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame forLayer:(CALayer *)layer;

/**
 *  做一个弹性动画
 *
 *  @param frame   起始frame
 *  @param toFrame 目的frame
 *  @param layer   动画的layer
 *  @param isContinuity 是否可以连续动画。（YES：继续上次动画的终点。NO：强制使用toFrame作为重点。
 *
 *  @return 当前动画的KEY
 */
+ (NSString *)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame forLayer:(CALayer *)layer continuity:(BOOL)isContinuity;

@end
