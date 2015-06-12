//
//  ViewController.m
//  CSZShimmerDemo
//
//  Created by 陈圣治 on 15/6/12.
//  Copyright (c) 2015年 陈圣治. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Shimmer.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 60)];
    _label.text = @"chenshengzhi";
    _label.font = [UIFont systemFontOfSize:50];
    _label.textColor = [UIColor whiteColor];
    [_label sizeToFit];
    
    [self.view addSubview:_label];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_label startShimmer];
}


@end
