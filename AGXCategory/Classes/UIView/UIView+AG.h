//
//  UIView+AG.h
//  BaseDemo
//
//  Created by 刘剑锋 on 2022/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AG)

/**  起点x坐标  */
@property (nonatomic, assign) CGFloat ag_x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat ag_y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat ag_centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat ag_centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat ag_width;
/**  高度  */
@property (nonatomic, assign) CGFloat ag_height;

/**  size  */
@property (nonatomic, assign) CGSize ag_size;

/**  origin */
@property (nonatomic, assign) CGPoint ag_point;

/// 最右边值
@property(nonatomic, assign) CGFloat ag_maxY;

///最大的x值
@property(nonatomic, assign) CGFloat ag_maxX;

#pragma mark  ———— 🥬🔸🍎 公共方法

/// 设置圆角
/// @param radius 圆角尺寸
/// @param corner 圆角位置
- (void)ag_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;

/// 设置圆角
/// @param radius 圆角尺寸
- (void)ag_radiusAllCornerWithRadius:(CGFloat)radius;

/// 初始化View
/// @param frame frame description
/// @param backgroundColor backgroundColor description
+ (instancetype)ag_viewWithFrame:(CGRect)frame backgroundColor:(nullable UIColor*)backgroundColor;


/// 初始化颜色
/// @param backgroundColor backgroundColor description
+ (instancetype)ag_viewWithBackgroundColor:(nullable UIColor *)backgroundColor;

/// 添加线
/// @param frame 位置
- (void)ag_addLineViewFrame:(CGRect)frame;

//整个view转成图片
- (UIImage *)ag_convertToImage;

//左右抖动动画
- (void)ag_shakeAnimation;

@end

NS_ASSUME_NONNULL_END
