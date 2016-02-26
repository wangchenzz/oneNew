//
//  ContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import "ContentView.h"
#import "EveryDayModel.h"
#import "CustomView.h"

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EveryDayModel *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;

        _imageView = [[BlurImageView alloc] initWithFrame:self.bounds];

        [self addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _titleLabel = [[animationFlashLabel alloc]initWithFrame:CGRectMake(5, 5, kWidth, 30)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = collor;
        [self addSubview:_titleLabel];
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(5, 35, 200, 1)];
        _lineView.backgroundColor = collor;
        [self addSubview:_lineView];
        
        _littleLabel = [[animationFlashLabel alloc]initWithFrame:CGRectMake(5, 46, kWidth, 20)];
        _littleLabel.textColor = collor;
        _littleLabel.font = [UIFont systemFontOfSize:14];
//        _littleLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_littleLabel];
        
        _descripLabel = [[animationFlashLabel alloc]initWithFrame:CGRectMake(5, 80, kWidth - 10, 90)];
        _descripLabel.font = [UIFont systemFontOfSize:14];
//        _descripLabel.backgroundColor = [UIColor redColor];
        _descripLabel.numberOfLines = 0;
        _descripLabel.textColor = collor;
        [self addSubview:_descripLabel];
        
        CGFloat y = _descripLabel.frame.size.height + 90;
        _collectionCustom = [[CustomView alloc]initWithFrame:CGRectMake(5, y, (kWidth - 10) / 4, 30) Width:width LabelString:model.collectionCount collor:collor];
        [self addSubview:_collectionCustom];
        
        _shareCustom = [[CustomView alloc]initWithFrame:CGRectMake((kWidth - 10) / 4 + 5, y, (kWidth - 10) / 4, 30) Width:width LabelString:model.shareCount collor:collor];
        [self addSubview:_shareCustom];
        _cacheCustom = [[CustomView alloc]initWithFrame:CGRectMake(_shareCustom.frame.origin.x + _shareCustom.frame.size.width, y, (kWidth - 10) / 4, 30) Width:width LabelString:@"缓存" collor:collor];
        [self addSubview:_cacheCustom];
        _replyCustom = [[CustomView alloc]initWithFrame:CGRectMake(_cacheCustom.frame.origin.x + _cacheCustom.frame.size.width, y, (kWidth - 10) / 4, 30) Width:width LabelString:model.replyCount collor:collor];
        [self addSubview:_replyCustom];

//        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.coverForDetail]];

        
        CGRect pageviewrect = CGRectMake(0, self.frame.size.height - 102, self.frame.size.width, 38);
        self.pageview = [[pageView alloc] initWithFrame:pageviewrect];
        
        self.pageview.numberOfPages = 5;
        
        [self addSubview:self.pageview];
        
        [self setData:model];
        
    }
    return self;
}

- (void)setData:(EveryDayModel *)model {

    self.titleLabel.willShowText = model.title;
    self.descripLabel.willShowText = model.descrip;
    [self.shareCustom setTitle:model.shareCount];
    
    [self.replyCustom setTitle:model.replyCount];
    [self.collectionCustom setTitle:model.collectionCount];
    
    self.descripLabel.verticalAlignment = VerticalAlignmentTop;

    NSInteger time = [model.duration integerValue];
    NSString *timeString = [NSString stringWithFormat:@"%02ld'%02ld''",time/60,time% 60];//显示的是音乐的总时间
    NSString *string = [NSString stringWithFormat:@"#%@ / %@",model.category, timeString];
    self.littleLabel.willShowText = string;

    
    
    

    __weak typeof(self) weakSelf = self;

//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverBlurred]];

    [self.titleLabel showAnimation:1.0f completion:nil];
    [self.littleLabel showAnimation:1.0f completion:nil];
    [self.descripLabel showAnimation:1.0f completion:nil];
    
    
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.coverBlurred] options:(SDWebImageRetryFailed) progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {

        
#warning  - - animation;   这就是最弱的,
        
        if (image) {
            CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
            contentsAnimation.duration = 1.0f;
            contentsAnimation.fromValue = self.imageView.image ;
            contentsAnimation.toValue = image;

            contentsAnimation.removedOnCompletion = YES;
            contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [weakSelf.imageView.layer addAnimation:contentsAnimation forKey:nil];
            
            

            _imageView.image = image;
            
            [_imageView setBackgroundColor:[UIColor redColor]];
            
        }

    }];
}

-(void)setCurrentIndex:(NSInteger)currentIndex{

    _currentIndex = currentIndex;
    
    self.pageview.currentPage = _currentIndex;


}

@end
