//
//  UIButton+KTJAnimation.m
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/20.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIButton+KTJAnimation.h"
#import "KTJPOPLibMacro.h"
#import <objc/runtime.h>
#import "UIView+KTJAnimation.h"
#import <POP.h>

static void * ktj_buttonFrame = &ktj_buttonFrame;

@implementation UIButton (KTJAnimation)

- (void)ktj_setupForEnlarge:(BOOL)isUse {
    if (isUse) {
        [self addTarget:self action:@selector(ktj_buttonDownAction) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(ktj_buttonUpAction)   forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(ktj_buttonUpAction)   forControlEvents:UIControlEventTouchUpOutside];
    } else {
        [self removeTarget:self action:@selector(ktj_buttonDownAction) forControlEvents:UIControlEventTouchDown];
        [self removeTarget:self action:@selector(ktj_buttonUpAction)   forControlEvents:UIControlEventTouchUpInside];
        [self removeTarget:self action:@selector(ktj_buttonUpAction)   forControlEvents:UIControlEventTouchUpOutside];
    }
}

- (void)ktj_buttonDownAction {
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0.95f, 0.95f);
    }];
}
- (void)ktj_buttonUpAction {
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
}

#pragma mark - getter/setter
- (void)setKtj_autoEnlarge:(BOOL)ktj_autoEnlarge {
    [self ktj_setupForEnlarge:ktj_autoEnlarge];
    objc_setAssociatedObject(self, @selector(ktj_autoEnlarge), @(ktj_autoEnlarge), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)ktj_autoEnlarge {
    return [objc_getAssociatedObject(self, @selector(ktj_autoEnlarge)) boolValue];
}

@end
