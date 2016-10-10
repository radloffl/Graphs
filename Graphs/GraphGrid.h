//
//  GraphView.h
//  Graphs
//
//  Created by Logan on 8/11/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphPoint.h"
#import "ClientMetric.h"

#define DEFAULT_NUMBER_OF_VERTICAL_LINES 12
#define DEFAULT_NUMBER_OF_HORIZONTAL_LINES 5
#define GRAPH_MARGIN_TOP 15
#define GRAPH_MARGIN_LEFT 25

@interface GraphGrid : UIView

@property ClientMetric *metric;
@property NSNumber* numberOfHorizontalLinesOnGraph;
@property NSNumber* numberOfVerticalLinesOnGraph;
@property (nonatomic) UIColor *horizontalLineColor;
@property (nonatomic) UIColor *verticalLineColor;
@property (nonatomic) UIColor *goalLineColor;

@end
