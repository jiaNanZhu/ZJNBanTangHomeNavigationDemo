//
//  UIButton+Size.h
//  ZJNBanTangHomeNavigationDemo
//
//  Created by 朱佳男 on 2017/1/10.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Size)
/**
 *  通过字体来设置button的frame
 *
 *  @param width    宽
 *  @param fontSize 字体大小
 *  @param str      title
 *
 *  @return <#return value description#>
 */
+(CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str;

@end
