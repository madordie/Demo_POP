//
//  UIView+KTJAnimation.m
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/19.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIView+KTJAnimation.h"
#import <POP.h>
#import "KTJPOPLibMacro.h"

/**
 *  摩擦力
 */
CGFloat KTJDynamicsFriction = 5;
/**
 *  弹力
 */
CGFloat KTJSpringBounciness = 20;

@implementation UIView (KTJAnimation)

/**
 *  上下抖动
 *
 *  @param distance 抖动距离
 */
- (void)ktj_shakeUpDown:(CGFloat)distance {
    [self ktj_shakeFrame:CGRectMake(self.frame.origin.x,
                                    self.frame.origin.y -distance,
                                    self.frame.size.width,
                                    self.frame.size.height)
                 toFrame:self.frame];
}
/**
 *  左右抖动
 *
 *  @param distance 抖动距离
 */
- (void)ktj_shakeLeftRight:(CGFloat)distance {
    [self ktj_shakeFrame:CGRectMake(self.frame.origin.x -distance,
                                    self.frame.origin.y,
                                    self.frame.size.width,
                                    self.frame.size.height)
                 toFrame:self.frame];
}
/**
 *  弹性动画
 *
 *  @param frame   弹性动画起始位置
 *  @param toFrame 弹性动画结束位置
 */
- (void)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame {
    [UIView ktj_shakeFrame:frame toFrame:toFrame forLayer:self.layer];
}
/**
 *  做一个弹性动画
 *
 *  @param frame   起始frame
 *  @param toFrame 目的frame
 *  @param layer   动画的layer
 */
+ (void)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame forLayer:(CALayer *)layer {
    [self ktj_shakeFrame:frame toFrame:toFrame forLayer:layer continuity:YES];
}
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
+ (NSString *)ktj_shakeFrame:(CGRect)frame toFrame:(CGRect)toFrame forLayer:(CALayer *)layer continuity:(BOOL)isContinuity {
    POPSpringAnimation *anim = [POPSpringAnimation animation];
    anim.springBounciness = KTJSpringBounciness;
    anim.dynamicsFriction = KTJDynamicsFriction;
    anim.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    anim.fromValue = [NSValue valueWithCGRect:frame];
    if (isContinuity) {
        POPSpringAnimation *oldAinm = [layer pop_animationForKey:anim.property.name];
        if ([oldAinm isKindOfClass:[POPSpringAnimation class]]) {
            anim.toValue = oldAinm.toValue;
        }
    } else {
        KTJWeak(anim);
        [anim setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
            layer.frame = [weakanim.toValue CGRectValue];
        }];
    }
    if (!anim.toValue) {
        anim.toValue = [NSValue valueWithCGRect:toFrame];
    }
    
    [layer pop_addAnimation:anim forKey:anim.property.name];
    
    return anim.property.name;
}

@end
