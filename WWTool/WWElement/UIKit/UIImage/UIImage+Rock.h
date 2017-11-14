//
//  UIImage+RockAdd.h
//  WWTool
//
//  Created by 王伟 on 2017/11/13.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma clang diagnostic ignored "-Wdocumentation"//去掉参数配置不恰当的警告
#pragma clang diagnostic ignored "-Wdeprecated-declarations"// 去掉弃用的警告
#pragma clang diagnostic ignored "-Warc-retain-cycles"  // 循环引用警告

NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    ImageWaterMarkCenterPosition_Bottom,
    ImageWaterMarkLeftPosition_Bottom,
    ImageWaterMarkRightPosition_Bottom,
} ImageWaterMarkPosition;;

@interface UIImage (Rock)

/*!
 @method
 @abstract 制作水印
 @discussion
 @param image 需要制作水印的图片
 @param message 水印的内容
 @param position 水印的位置
 @param attributes 水印messgae的attributes
 @result 无返回
 */
+ (UIImage *)imageWaterMarkWithMessage:(NSString *)message
                                 image:(UIImage *)image
                              position:(ImageWaterMarkPosition)position
                            attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs;


/*!
 @method
 @abstract 将图片剪切为圆形图片
 @discussion
 @param image image
 @result 圆形图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image;

/*!
 @method
 @abstract 带边框的圆形图片
 @discussion
 @param image image
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @result 圆形图片
 */
+ (UIImage *)imageClipRoundWithImage:(UIImage *)image
                         borderWidth:(CGFloat)borderWidth
                         borderColor:(UIColor *)borderColor;

/*!
 @method
 @abstract 带边框的矩形图片
 @discussion
 @param image image
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param cornerRadius 边框圆角的半径
 @result 圆形图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor
                          cornerRadius:(CGFloat)cornerRadius;

/*!
 @method
 @abstract 圆角图片
 @discussion
 @param image image
 @param cornerRadius 边框圆角的半径
 @result 圆形图片
 */
+ (UIImage *)imageRoundedRectWithImage:(UIImage *)image
                          cornerRadius:(CGFloat)cornerRadius;


/*!
 @method
 @abstract 设置image不被渲染
 @discussion
 @param imageName 图片的名字
 @result 图片的UIimage
 */
+ (UIImage *)imageOriginalWithName:(NSString *)imageName;


@end

NS_ASSUME_NONNULL_END
