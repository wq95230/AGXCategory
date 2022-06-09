//
//  UIButton+AG.h
//  BaseDemo
//
//  Created by 刘剑锋 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (AG)


/// 添加点击事件 - UIControlEventTouchUpInside
/// @param target target description
/// @param action action description
- (void)ag_addTarget:(nullable id)target action:(SEL)action;

/// 增加按钮点击区域 上下左右延长范围
/// @param top top description
/// @param right right description
/// @param bottom bottom description
/// @param left left description
- (void)ag_enlargeEdgeWithTop:(CGFloat)top
                         left:(CGFloat)left
                       bottom:(CGFloat)bottom
                        right:(CGFloat)right;

@end

NS_ASSUME_NONNULL_END
