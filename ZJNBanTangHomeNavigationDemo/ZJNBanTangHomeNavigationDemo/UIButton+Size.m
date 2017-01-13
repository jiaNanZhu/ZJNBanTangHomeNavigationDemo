//
//  UIButton+Size.m
//  ZJNBanTangHomeNavigationDemo
//
//  Created by 朱佳男 on 2017/1/10.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "UIButton+Size.h"

@implementation UIButton (Size)
+(CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str{
    //    创建一个label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    //    label 的文字
    label.text = str;
    //    label 的行数
    label.numberOfLines = 0;
    //    label的字体大小
    label.font = [UIFont systemFontOfSize:fontSize];
    //    让label通过文字设置size
    [label sizeToFit];
    //    获取label 的size
    CGSize size = label.frame.size;
    //    返回出去
    return size;
    
}

@end
