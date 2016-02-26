//
//  BlurImageView.m
//  WXMusic
//
//  Created by 漫步人生路 on 15/8/31.
//  Copyright (c) 2015年 漫步人生路. All rights reserved.
//



/**
 这个类根本就没有使用.. 坑人,
 
 - returns: 坑
 */
#import "BlurImageView.h"

@implementation BlurImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        //设置图片
        self.image = [UIImage imageNamed:@""];
        //创建模糊视图
        UIVisualEffectView *backVisual = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        //将模糊视图的大小等同于自身
        backVisual.frame = self.bounds;
        //设置模糊视图的透明度
        backVisual.alpha = 1;
        [self addSubview:backVisual];

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
