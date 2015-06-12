//
//  CSZShimmerLayer.m
//  TTShimmer
//
//  Created by 陈圣治 on 15/6/12.
//  Copyright (c) 2015年 陈圣治. All rights reserved.
//

#import "CSZShimmerLayer.h"
@import UIKit;

NSString * const kShimmerAnimationKey = @"kShimmerAnimationKey";

@implementation CSZShimmerLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gradientLayer = [CAGradientLayer layer];
        [self addSublayer:_gradientLayer];
        
        UIColor *maskedColor = [UIColor colorWithWhite:1.0 alpha:0];
        UIColor *unmaskedColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        _gradientLayer.colors = @[(__bridge id)maskedColor.CGColor, (__bridge id)unmaskedColor.CGColor, (__bridge id)maskedColor.CGColor];
        _gradientLayer.locations = @[@0, @0.5, @1];
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1, 0.5);
        _gradientLayer.anchorPoint = CGPointZero;
        
        self.anchorPoint = CGPointZero;
        self.backgroundColor = [UIColor whiteColor].CGColor;
        [self addSublayer:_gradientLayer];
    }
    return self;
}

- (void)layoutSublayers
{
    [super layoutSublayers];
    CGRect r = self.bounds;
    _gradientLayer.bounds = r;
    _gradientLayer.position = CGPointZero;
}

- (void)start
{
    CABasicAnimation *animation = (CABasicAnimation *)[_gradientLayer animationForKey:kShimmerAnimationKey];
    if (!animation)
    {
        self.backgroundColor = [UIColor clearColor].CGColor;
        
        animation = [CABasicAnimation animationWithKeyPath:@"position"];
        animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-self.bounds.size.width, 0)];
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width*2, 0)];
        animation.duration = 2;
        animation.repeatCount = HUGE_VALF;
        [_gradientLayer addAnimation:animation forKey:kShimmerAnimationKey];
    }
}

- (void)stop
{
    [_gradientLayer removeAnimationForKey:kShimmerAnimationKey];
    
    self.backgroundColor = [UIColor whiteColor].CGColor;
}

@end
