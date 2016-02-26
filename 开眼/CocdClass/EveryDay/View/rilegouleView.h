//
//  rilegouleView.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContentView;
@class ContentScrollView;
@class EveryDayTableViewCell;
@interface rilegouleView : UIView

/**
 *  用于介绍的 view
 */
@property (nonatomic, strong) ContentView *contentView;

/**
 *  scrollview ; 创建时候回顺便创建里面的内容
 */
@property (nonatomic, strong) ContentScrollView *scrollView;

/**
 *  cell
 */
@property (nonatomic, strong)  EveryDayTableViewCell *animationView;

/**
 *  ??
 */
@property (nonatomic ,strong) UIImageView *playView;

/**
 *  当前 index
 */
@property (nonatomic ,assign) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index;


/**
 *  决定完成后的位子
 */
@property (nonatomic ,assign) CGFloat offsetY;

/**
 *  图片的动画
 */
@property (nonatomic ,assign) CGAffineTransform animationTrans;


- (void)aminmationShow;

- (void)animationDismissUsingCompeteBlock:(void (^)(void))complete;

//- (vo)

@end
