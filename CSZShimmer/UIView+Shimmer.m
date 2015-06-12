//
//  UIView+Shimmer.m
//  TTShimmer
//
//  Created by 陈圣治 on 15/6/12.
//  Copyright (c) 2015年 陈圣治. All rights reserved.
//

#import "UIView+Shimmer.h"
#import "CSZShimmerLayer.h"

@implementation UIView (Shimmer)

- (void)startShimmer
{
    if (self.layer.mask && [self.layer.mask isKindOfClass:[CSZShimmerLayer class]]) {
        CSZShimmerLayer *shimmerLayer = (CSZShimmerLayer *)self.layer.mask;
        [shimmerLayer start];
    }
    else
    {
        if (self.layer.mask) {
            NSLog(@"Warnning: previous self.layer.mask will be remove");
        }
        
        self.layer.mask = nil;
        
        CSZShimmerLayer *shimmerLayer = [[CSZShimmerLayer alloc] init];
        shimmerLayer.bounds = self.bounds;
        self.layer.mask = shimmerLayer;
        [shimmerLayer start];
    }
}

- (void)stopShimmer
{
    if (self.layer.mask && [self.layer.mask isKindOfClass:[CSZShimmerLayer class]]) {
        CSZShimmerLayer *shimmerLayer = (CSZShimmerLayer *)self.layer.mask;
        [shimmerLayer stop];
    }
}

@end
