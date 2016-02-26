//
//  CustomView.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

/**
 *  自定义 view  用来制作 scrollview 下面的按钮-'/
 */

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width LabelString:(id)labelString collor:(UIColor *)collor;

- (void)setTitle:(id)title;
- (void)setColor:(UIColor *)color;
@end
