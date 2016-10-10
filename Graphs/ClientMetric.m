//
//  ClientMetric.m
//  Graphs
//
//  Created by Logan on 8/29/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "ClientMetric.h"

@implementation ClientMetric

- (instancetype)init
{
    self = [super init];
    if (self) {
        _metricGoal = [NSNumber numberWithInt:INT_MIN];
    }
    return self;
}

@end
