//
//  pageView.m
//  开眼
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 谢旭峰. All rights reserved.
//

#import "pageView.h"

@interface pageView ()


/**
 *  显示的 view;
 */
@property (nonatomic,retain) UIView *backRoundView;

@property (nonatomic,retain) UIView *containView;

@end

@implementation pageView

-(void)setNumberOfPages:(NSInteger)numberOfPages{
//    self.backRoundView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width / numberOfPages)*self.currentPage , 0, (self.frame.size.width / numberOfPages), self.frame.size.height)];
    
    _numberOfPages = numberOfPages;
    
    self.containView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 38)];
    
    self.containView.backgroundColor = [UIColor clearColor];

    self.backRoundView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width / _numberOfPages) * 0, 0, (self.frame.size.width / _numberOfPages), 38)];
    
    [self addSubview:self.backRoundView];
    
    self.backRoundView.clipsToBounds = YES;
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-3, self.frame.size.width, 3)];
    
    [lineView setBackgroundColor:[UIColor whiteColor]];
    
    [self.containView addSubview:lineView];

    for (int i = 0;  i < numberOfPages; i ++) {
     
        UILabel *label = [[UILabel alloc] init];
        
        [label setText:[NSString stringWithFormat:@"%d - %ld",i+1,numberOfPages]];
        
        [label setFont:[UIFont fontWithName:@"Snell Roundhand" size:24]];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label setTextColor:[UIColor whiteColor]];
        
        [label setBackgroundColor:[UIColor clearColor]];
        
        CGRect recc = CGRectMake((self.frame.size.width / numberOfPages)*(i) , 9,(self.frame.size.width / numberOfPages), 20);
        
        [label setFrame:recc];
    
        [self.containView addSubview:label];
    }
    [self.backRoundView addSubview:self.containView];
}

-(void)setCurrentPage:(NSInteger)currentPage{
    
    if (_currentPage != currentPage) {
        _currentPage = currentPage;
        
        [UIView animateWithDuration:0.5 animations:^{
                    self.backRoundView.transform = CGAffineTransformMakeTranslation((self.frame.size.width / _numberOfPages)*(_currentPage-1), 0);
            
            [self.containView setFrame:CGRectMake(-(self.frame.size.width / _numberOfPages)*(_currentPage-1), 0, (self.frame.size.width / _numberOfPages), 38)];
        }];

        
    }


}

@end
