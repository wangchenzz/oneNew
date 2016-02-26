//
//  EveryDayModel.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  数据模型.存放数据源
 */

@interface EveryDayModel : NSObject

@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSNumber *collectionCount;

@property (nonatomic, strong) NSNumber *replyCount;

@property (nonatomic, strong) NSNumber *shareCount;

@property (nonatomic, strong) NSString *coverBlurred;

@property (nonatomic, strong) NSString *coverForDetail;

@property (nonatomic, strong) NSString *descrip;

@property (nonatomic, strong) NSString *ID;

@property (nonatomic, strong) NSString *duration;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *playUrl;
@end
