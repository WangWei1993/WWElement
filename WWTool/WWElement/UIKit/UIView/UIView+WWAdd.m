//
//  UIView+Rock.m
//  WWTool
//
//  Created by 王伟 on 2017/11/14.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "UIView+WWAdd.h"

@implementation UIView (WWAdd)

- (UIImage *)ww_snapshotImage {
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        
        UIScrollView *scrollView = (UIScrollView *)self;
        
        // 保存scrollView的基本属性
        CGRect saveFrame = scrollView.frame;
        CGPoint saveOrigin = scrollView.contentOffset;
        
        scrollView.frame = CGRectMake(0, scrollView.frame.origin.y, scrollView.contentSize.width, scrollView.contentSize.height);
        
        
        // 开启位图上下层（scrollView.contentSize这样才不会失真）
        UIGraphicsBeginImageContext(scrollView.contentSize);
        
        // 获取位图上下层
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 将tableView渲染到上下层中
        [scrollView.layer renderInContext:ctx];
        
        // 从上下层中获取图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.frame = saveFrame;
        scrollView.contentOffset = saveOrigin;
        
        return image;
        
    } else {
        
        // 开启位图上下层
        UIGraphicsBeginImageContext(self.frame.size);
        
        // 获取位图上下层
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 将tableView渲染到上下层中
        [self.layer renderInContext:ctx];
        
        // 从上下层中获取图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        return image;
    }
}


- (nullable NSData *)ww_snapshotImagePNG {
    
    // 获取截图
    UIImage *image = [self ww_snapshotImage];
    
    // 将image转成NSData
    NSData *imageData = UIImagePNGRepresentation(image);
    
    return imageData;
}


- (nullable NSData *)ww_snapshotImageJPGWithCompressionQuality:(CGFloat)compressionQuality {
    
    // 获取截图
    UIImage *image = [self ww_snapshotImage];
    
    // 将image转成NSData
    NSData *imageData = UIImageJPEGRepresentation(image, compressionQuality);
    
    return imageData;
}


- (NSData *)ww_snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData *data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (CGFloat)visibleAlpha {
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;// UIView是否为空
    CGFloat alpha = 1;
    UIView *v = self;
    while (v) {
        // 检测它的父控件
        if (v.hidden) {
            alpha = 0;
            break;
        }
        alpha *= v.alpha;
        v = v.superview;
    }
    return alpha;
}

- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;// 阴影的颜色
    self.layer.shadowOffset = offset;// 阴影的偏移量
    self.layer.shadowRadius = radius;// 阴影的圆角
    self.layer.shadowOpacity = 1;// 阴影的透明度
    self.layer.shouldRasterize = YES;// 可以提升UI界面的流畅度（提高性能）
    // http://www.jianshu.com/p/2a01e5e2141f
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setshadowPath {
    [self setLayerShadow:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1] offset:CGSizeMake(0,0) radius:3.0f];
}


- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


+ (BOOL)rect:(CGRect)rect1 containsRect2:(CGRect)rect2 {
    return CGRectContainsRect(rect1, rect2);
}


+ (BOOL)rect:(CGRect)rect containsPoint:(CGPoint)point {
    return CGRectContainsPoint(rect, point);
}


+ (BOOL)rect:(CGRect)rect1 intersectsRect2:(CGRect)rect2 {
    return CGRectIntersectsRect(rect1, rect2);
}


- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)midX{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY{
    return CGRectGetMidY(self.frame);
}



@end
