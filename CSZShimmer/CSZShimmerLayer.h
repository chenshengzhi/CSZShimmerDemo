//
//  CSZShimmerLayer.h
//  TTShimmer
//
//  Created by 陈圣治 on 15/6/12.
//  Copyright (c) 2015年 陈圣治. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CSZShimmerLayer : CALayer

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

- (void)start;

- (void)stop;

@end
