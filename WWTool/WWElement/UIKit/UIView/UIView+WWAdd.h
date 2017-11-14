//
//  UIView+Rock.h
//  WWTool
//
//  Created by 王伟 on 2017/11/14.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma clang diagnostic ignored "-Wdocumentation"//去掉参数配置不恰当的警告
#pragma clang diagnostic ignored "-Wdeprecated-declarations"// 去掉弃用的警告
#pragma clang diagnostic ignored "-Warc-retain-cycles"  // 循环引用警告

@interface UIView (WWAdd)

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
@property (assign, nonatomic, readonly) CGFloat midX;
@property (assign, nonatomic, readonly) CGFloat midY;
@property (assign, nonatomic, readonly) CGFloat maxX;
@property (assign, nonatomic, readonly) CGFloat maxY;


/*!
 @method
 @abstract 获取View的截图image
 @result   UIImage
 */
- (nullable UIImage *)ww_snapshotImage;

/*!
 @method
 @abstract 获取View的截图PNG
 @result   NSData
 */
- (nullable NSData *)ww_snapshotImagePNG;

/*!
 @method
 @abstract 获取View的截图JPEG
 @result   NSData
 */
- (nullable NSData *)ww_snapshotImageJPGWithCompressionQuality:(CGFloat)compressionQuality;

/*!
 @method
 @abstract 获取View的截图PDF
 @result   NSData
 */
- (NSData *)ww_snapshotPDF;


/**
 清除所有的子控件
 */
- (void)removeAllSubviews;


/**
 获取这个View所在的controller
 */
- (UIViewController *)viewController;


/**
 当前控件是否可见
 */
@property (nonatomic, readonly) CGFloat visibleAlpha;

/**
 将给定视图或窗口的坐标系中的点转换为view上的点
 @param point 在局部坐标系（边界）中指定的点。
 @param view  在此视图坐标系中有点
 如果视图为空，则此方法将从窗坐标系转换而来。
 @return 将点转换为接收器的本地坐标系（边界）。
 */
- (CGPoint)convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;

/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;

/**
 rect1和rect2是否有重叠
 @param rect1
 @param rect2
 @return yes or no
 */
+ (BOOL)rect:(CGRect)rect1 containsRect2:(CGRect)rect2;

/**
 rect中是否包含point点
 @param rect
 @param point
 @return yes or no
 */
+ (BOOL)rect:(CGRect)rect containsPoint:(CGPoint)point;

/**
 rect1中是否包含rect2
 @param rect
 @param rect2
 @return yes or no
 */
+ (BOOL)rect:(CGRect)rect1 intersectsRect2:(CGRect)rect2;


/*!
 @method
 @abstract 设置view.layer阴影
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)ww_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/*!
 @method
 @abstract 快速给一个View设置阴影
 
 color : [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1]
 offset: CGSizeMake(0,0)
 radius: 3.0f
 shadowOpacity : 1
 shouldRasterize : yes
 
 */
- (void)ww_setshadowPath;


/**
 *  设置圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

- (UIViewController *)ww_viewController;

/**
 *  设置边框
 */
- (void)setLayerBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;



@end

NS_ASSUME_NONNULL_END
