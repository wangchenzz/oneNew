//
//  EveryDayTableViewController.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class rilegouleView;

@interface EveryDayTableViewController : UITableViewController

/**
 *  masaka 这是主视图控制器, 最重要的/./
 */

@property (nonatomic, strong) rilegouleView *rilegoule;

@property (nonatomic, strong) UIImageView *BlurredView;

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;


@end
