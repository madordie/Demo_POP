//
//  UIButton+KTJAnimation.h
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/20.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KTJAnimation)

/**
 *  自动放大。默认为NO。YES时当按钮出现点击时候会出现一个放大的动画，松开会缩小的动画。
 */
@property (nonatomic, assign) BOOL ktj_autoEnlarge; //  Default NO.

@end
