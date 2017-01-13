//
//  UIImage+ZJNImage.h
//  ZJNBanTangHomeNavigationDemo
//
//  Created by 朱佳男 on 2017/1/10.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZJNImage)
/**
 根据颜色和尺寸生成图片
 
 @param color 颜色
 @param size 输出图片大小
 @return 图片大小
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)transformWidth:(CGFloat)width height:(CGFloat)height;
// 等比压缩图片到targetsize
- (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
// 压缩图片小于length字节
- (NSData *)compressImageBelow:(NSInteger)length;
- (UIImage *)squareImage;

@end
