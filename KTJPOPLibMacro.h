//
//  KTJPOPLibMacro.h
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/19.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#ifndef KTJPOPLibMacro_h
#define KTJPOPLibMacro_h

#ifndef KTJChangeIMP
#define KTJChangeIMP(JOriginalSEL, JSwizzledSEL)  \
    {   \
        Class class = [self class]; \
        SEL originalSelector = (JOriginalSEL);  \
        SEL swizzledSelector = (JSwizzledSEL);  \
        Method originalMethod = class_getInstanceMethod(class, originalSelector);   \
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);   \
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)); \
        if (didAddMethod){  \
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod)); \
        } else {    \
            method_exchangeImplementations(originalMethod, swizzledMethod); \
        }   \
    }
#endif

#ifndef KTJWeak
#define KTJWeak(JSelf) __weak __typeof(JSelf)weak##JSelf = JSelf
#endif


#ifndef KTJExBlock
#define KTJExBlock(JError, JFunc, ...) ((JFunc)?(JFunc(__VA_ARGS__)):(JError))
#endif




#endif /* KTJPOPLibMacro_h */
