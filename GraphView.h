//
//  GraphView.h
//  Graphs
//
//  Created by Logan on 8/11/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphPoint.h"
#import "GraphGrid.h"

#define GRID_COLOR [UIColor grayColor]

@interface GraphView : UIView

@property ClientMetric *metric;

@property UILabel *graphLabel;
@property UISegmentedControl *graphSegment;

@property UILabel *horizontalAxisLabel;
@property UILabel *verticalAxisLabel;

@end
