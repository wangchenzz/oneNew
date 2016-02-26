//
//  ImageContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import "ImageContentView.h"
#import "ContentView.h"
#import "EveryDayModel.h"

@implementation ImageContentView
- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EveryDayModel *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 1.7)];
        _picture.contentMode = UIViewContentModeScaleAspectFill;
        [self setBackgroundColor:[UIColor redColor]];
        [self addSubview:_picture];
    }
    return self;
}


/**
 */
- (void)imageOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:nil];
    
    CGFloat centerX = CGRectGetMidX(centerToWindow);
    
    CGPoint windowCenter = self.window.center;

    CGFloat cellOffsetX = centerX - windowCenter.x;

    CGFloat offsetDig =  cellOffsetX / self.window.frame.size.height *2;

    CGAffineTransform transX = CGAffineTransformMakeTranslation(-offsetDig * kWidth * 0.4, 0);
    
    NSLog(@"%f",-offsetDig * kWidth * 0.4);

    self.picture.transform = transX;
}


@end
