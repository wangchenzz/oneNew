//
//  pageView.h
//  开眼
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 谢旭峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pageView : UIView

@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

@end
