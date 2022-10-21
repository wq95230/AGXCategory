//
//  UIView+AG.m
//  BaseDemo
//
//  Created by 刘剑锋 on 2022/6/9.
//

#import "UIView+AG.h"

@implementation UIView (AG)

- (CGFloat)ag_x
{
    return self.frame.origin.x;
}

-(CGFloat)ag_y
{
    return self.frame.origin.y;
}

-(CGFloat)ag_centerX
{
    return self.center.x;
}

-(CGFloat)ag_centerY
{
    return self.center.y;
}

-(CGFloat)ag_width
{
    return self.frame.size.width;
}

-(CGFloat)ag_height
{
    return self.frame.size.height;
}

- (CGSize)ag_size
{
    return self.frame.size;
}

- (CGPoint)ag_point
{
    return self.frame.origin;
}

- (CGFloat)ag_maxX
{
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)ag_maxY
{
    return self.frame.size.height + self.frame.origin.y;
}

#pragma mark  ———— 🥬🔸🍎 set
- (void)setAg_x:(CGFloat)ag_x
{
    CGRect frame = self.frame;
    frame.origin.x = ag_x;
    self.frame = frame;
}

-(void)setAg_y:(CGFloat)ag_y
{
    CGRect frame = self.frame;
    frame.origin.y = ag_y;
    self.frame = frame;
}

- (void)setAg_centerX:(CGFloat)ag_centerX
{
    CGPoint center = self.center;
    center.x = ag_centerX;
    self.center = center;
}

-(void)setAg_centerY:(CGFloat)ag_centerY
{
    CGPoint center = self.center;
    center.y = ag_centerY;
    self.center = center;
}

-(void)setAg_width:(CGFloat)ag_width
{
    CGRect frame = self.frame;
    frame.size.width = ag_width;
    self.frame = frame;
}

-(void)setAg_height:(CGFloat)ag_height
{
    CGRect frame = self.frame;
    frame.size.height = ag_height;
    self.frame = frame;
}

-(void)setAg_size:(CGSize)ag_size
{
    CGRect frame = self.frame;
    frame.size = ag_size;
    self.frame = frame;
}

-(void)setAg_point:(CGPoint)ag_point
{
    CGRect frame = self.frame;
    frame.origin = ag_point;
    self.frame = frame;
}

-(void)setAg_maxX:(CGFloat)ag_maxX
{
    CGRect frame = self.frame;
    frame.size.width = ag_maxX - frame.origin.x;
    self.frame = frame;
}

-(void)setAg_maxY:(CGFloat)ag_maxY
{
    CGRect frame = self.frame;
    frame.size.height = ag_maxY - frame.origin.y;
    self.frame = frame;
}

#pragma mark  ———— 🥬🔸🍎 公共方法
/// 设置圆角
/// @param radius 圆角尺寸
/// @param corner 圆角位置
- (void)ag_radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner
{
    
    if (@available(iOS 11.0, *))
    {
        self.layer.cornerRadius = radius;
        
        self.layer.maskedCorners = (CACornerMask)corner;
        self.layer.masksToBounds = YES;
    } else {
        //这边好像会出问题 corner kCALayerMaxXMinYCorner
        //UIRectCorner corner = UIRectCornerTopRight | UIRectCornerBottomRight; // 右上和右下进行圆角
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}

/// 设置圆角
/// @param radius 圆角尺寸
- (void)ag_radiusAllCornerWithRadius:(CGFloat)radius
{
    if (@available(iOS 11.0, *))
    {
        //适用页面圆角少的情况
        self.layer.cornerRadius = radius;
        self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
        self.layer.masksToBounds = YES;
    } else
    {
        //经过各个iOS开发者的实践测试，用这种方式对性能的损耗甚至超过了第一种方式，这种吃力不好讨好的事情，我们拒绝使用它！
//        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = self.bounds;
//        maskLayer.path = path.CGPath;
//        self.layer.mask = maskLayer;
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
}

/// 圆角加阴影
/// @param shadowColor 阴影颜色
/// @param shadowOpacity 阴影透明度，默认0
/// @param shadowRadius 阴影半径，默认3
/// @param shadowPathSide 设置哪一侧的阴影
/// @param shadowPathWidth  阴影的宽度
/// @param rectCorner 圆角位置
-(void)ag_shadowPathWith:(UIColor *)shadowColor
           shadowOpacity:(CGFloat)shadowOpacity
            shadowRadius:(CGFloat)shadowRadius
              shadowSide:(AGShadowPathSide)shadowPathSide
         shadowPathWidth:(CGFloat)shadowPathWidth
          radiusLocation:(UIRectCorner)rectCorner
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (@available(iOS 11.0,*)) {
            self.layer.cornerRadius = shadowRadius;
            self.layer.maskedCorners = (CACornerMask)rectCorner;
        }else{
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(shadowRadius, shadowRadius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
            self.frame = self.bounds;
            maskLayer.path = path.CGPath;
            self.layer.mask = maskLayer;
        }
        self.layer.masksToBounds = NO;
        self.clipsToBounds = NO;
        self.layer.shadowColor = shadowColor.CGColor;
        self.layer.shadowOpacity = shadowOpacity;
        //设置抗锯齿边缘
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        self.layer.shadowOffset = CGSizeZero;
        CGRect shadowRect;
        CGFloat originX = 0;
        CGFloat originY = 0;
        CGFloat originW = self.bounds.size.width;
        CGFloat originH = self.bounds.size.height;
        switch (shadowPathSide) {
            case AGShadowPathTop:
                shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
                break;
            case AGShadowPathBottom:
                shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
                break;
            case AGShadowPathLeft:
                shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
                break;
            case AGShadowPathRight:
                shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
                break;
            case AGShadowPathNoTop:
                shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
                break;
            case AGShadowPathAllSide:
                shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
                break;
        }
        UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
        self.layer.shadowPath = path.CGPath;
    });
}

+ (instancetype)ag_viewWithFrame:(CGRect)frame backgroundColor:(nullable UIColor *)backgroundColor
{
    UIView *xxView = [[UIView alloc]initWithFrame:frame];
    if (backgroundColor) {
        xxView.backgroundColor = backgroundColor;
    }else{
        xxView.backgroundColor = UIColor.clearColor;
    }
    return xxView;
}

+ (instancetype)ag_viewWithBackgroundColor:(nullable UIColor *)backgroundColor
{
    UIView *xxView = [[UIView alloc]init];
    if (backgroundColor) {
        xxView.backgroundColor = backgroundColor;
    }else{
        xxView.backgroundColor = UIColor.clearColor;
    }
    return xxView;
}

/// 添加线
/// @param frame 位置
- (void)ag_addLineViewFrame:(CGRect)frame
{
    CALayer *CALine = CALayer.new;
    CALine.frame = frame;
    CALine.backgroundColor = UIColor.blackColor.CGColor;
    [self.layer addSublayer:CALine];
}

//整个view转成图片
- (UIImage *)ag_convertToImage
{
    CGSize viewSize = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(viewSize, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//左右抖动动画
- (void)ag_shakeAnimation
{
    CALayer* layer = [self layer];
    CGPoint position = [layer position];
    CGPoint y = CGPointMake(position.x - 8.0f, position.y);
    CGPoint x = CGPointMake(position.x + 8.0f, position.y);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08f];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}

@end
