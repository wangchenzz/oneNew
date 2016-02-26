//
//  ContentView.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomView;
@class EveryDayModel;
#import "animationFlashLabel.h"

#import "pageView.h"

@interface ContentView : UIView
/**
 *  明显就是 scrollview 下面用来介绍的一块 view
 */

@property (nonatomic, strong) BlurImageView *imageView;

@property (nonatomic, strong) animationFlashLabel *titleLabel;

@property (nonatomic, strong) animationFlashLabel *littleLabel;

@property (nonatomic, strong) animationFlashLabel *descripLabel;

@property (nonatomic, strong) UIView *lineView;

/**
 *  zz
 */
@property (nonatomic,retain) pageView *pageview;

@property (nonatomic,assign) NSInteger currentIndex;

@property (nonatomic, strong) CustomView *collectionCustom;

@property (nonatomic, strong) CustomView *shareCustom;

@property (nonatomic, strong) CustomView *cacheCustom;

@property (nonatomic, strong) CustomView *replyCustom;

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EveryDayModel *)model collor:(UIColor *)collor;

- (void)setData:(EveryDayModel *)model;

@end
