//
//  GraphPoint.m
//  Graphs
//
//  Created by Logan on 8/18/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "GraphPoint.h"

#define DEFAULT_RADIUS 2.5

@implementation GraphPoint

-(instancetype)initWithXValue: (NSNumber *)x AndYValue: (NSNumber *)y {
    self = [super init];
    
    if (self) {
        _x = x;
        _y = y;
        
        _color = [UIColor blackColor];
        _radius = DEFAULT_RADIUS;
    }
    return self;
}

@end
