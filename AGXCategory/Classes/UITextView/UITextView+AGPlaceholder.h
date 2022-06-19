//
//  UITextView+AGPlaceholder.h
//  AGXCategory_Example
//
//  Created by 刘剑锋 on 2022/6/1.
//  Copyright © 2022 952303557@qq.com. All rights reserved.
// 来源 https://github.com/devxoul/UITextView-Placeholder 避免文件名重复 新建了个类

/*
 添加ag_开头 好像被改废了  不能用就用上面的吧
 */

#if __has_feature(modules)
@import UIKit;
#else
#import <UIKit/UIKit.h>
#endif

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (AGPlaceholder)

@property (nonatomic, readonly) UITextView *placeholderTextView NS_SWIFT_NAME(placeholderTextView);

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end

NS_ASSUME_NONNULL_END
