//
//  ClientMetric.h
//  Graphs
//
//  Created by Logan on 8/29/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientMetric : NSObject

@property NSString *metricName;
@property NSString *metricHorizontalAxisLabel;
@property NSString *metricVerticalAxisLabel;
@property NSNumber *metricGoal;
@property NSMutableArray *dataPoints;

@end
