//
//  customView.m
//  搜图必备
//
//  Created by tareba on 16/1/27.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import "customView.h"

@implementation customView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 3;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    
    [path moveToPoint:CGPointMake(5, 10)];
    [path addLineToPoint:CGPointMake(30, 10)];
    [path moveToPoint:CGPointMake(5, 20)];
    [path addLineToPoint:CGPointMake(30, 20)];
    [path moveToPoint:CGPointMake(5, 30)];
    [path addLineToPoint:CGPointMake(30, 30)];
    [[UIColor colorWithRed:118/255 green:211/255 blue:251/255 alpha:0.8] setStroke];
    [path stroke];
}


@end
