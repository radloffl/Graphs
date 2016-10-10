//
//  GraphView.m
//  Graphs
//
//  Created by Logan on 8/11/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "GraphView.h"
#import "GraphGrid.h"
#import "UIColor+DefaultThemeColors.h"

#define LINE_LABEL_FONT_SIZE 8
#define LABEL_SPACING 2

#define GRAPH_LABEL_FONT_SIZE 20
#define AXIS_LABEL_FONT_SIZE 12

@implementation GraphView {
    GraphGrid *_grid;
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _grid = [GraphGrid new];
        _grid.translatesAutoresizingMaskIntoConstraints = NO;
        [_grid setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_grid layoutIfNeeded];
        _grid.goalLineColor = [UIColor goalColor];
        _grid.horizontalLineColor = GRID_COLOR;
        _grid.verticalLineColor = GRID_COLOR;
        [self addSubview:_grid];
        
        _graphLabel = [UILabel new];
        _graphLabel.font = [UIFont boldSystemFontOfSize:GRAPH_LABEL_FONT_SIZE];
        _graphLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _graphLabel.textColor = [UIColor primaryTextColor];
        [self addSubview:_graphLabel];
        
        _graphSegment = [[UISegmentedControl alloc] initWithItems:@[@"All", @"Year", @"Month", @"Week"]];
        _graphSegment.selectedSegmentIndex = _graphSegment.numberOfSegments - 1;
        _graphSegment.translatesAutoresizingMaskIntoConstraints = NO;
        _graphSegment.tintColor = [UIColor primaryAccentColor];
        [self addSubview:_graphSegment];
        
        _horizontalAxisLabel = [UILabel new];
        _horizontalAxisLabel.font = [UIFont boldSystemFontOfSize:AXIS_LABEL_FONT_SIZE];
        _horizontalAxisLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _horizontalAxisLabel.textColor = [UIColor primaryTextColor];
        [self addSubview:_horizontalAxisLabel];
        
        _verticalAxisLabel = [UILabel new];
        _verticalAxisLabel.numberOfLines = 0;
        _verticalAxisLabel.textAlignment = NSTextAlignmentCenter;
        _verticalAxisLabel.font = [UIFont boldSystemFontOfSize:AXIS_LABEL_FONT_SIZE];
        _verticalAxisLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _verticalAxisLabel.textColor = [UIColor primaryTextColor];
        [self addSubview:_verticalAxisLabel];
        
    }
    return self;
}

-(void)setNeedsDisplay {
    [super setNeedsDisplay];
    [_grid setNeedsDisplay];
}

-(void)updateConstraints {
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_grid,_graphLabel,_horizontalAxisLabel,_verticalAxisLabel, _graphSegment);
    
    NSArray *gridHorizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_verticalAxisLabel(15)][_grid]-|"
                                                                        options:NSLayoutFormatAlignAllCenterY
                                                                        metrics:nil
                                                                          views:views];

    NSArray *gridVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_graphLabel]-(2)-[_graphSegment]-(1)-[_grid]-(2)-[_horizontalAxisLabel]-(2)-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views];
    
    [self addConstraints:gridHorizontalLayout];
    [self addConstraints:gridVerticalLayout];
    
    [super updateConstraints];
}

-(ClientMetric *)metric {
    return _grid.metric;
}

-(void)setMetric:(ClientMetric *)metric {
    _graphLabel.text = metric.metricName;
    NSMutableString *vertLabel = [NSMutableString new];
    for (NSUInteger i = 0; i < metric.metricVerticalAxisLabel.length; i++) {
        [vertLabel appendString:[NSString stringWithFormat:@"%@\n", [metric.metricVerticalAxisLabel substringWithRange:NSMakeRange(i, 1)]]];
    }
    _verticalAxisLabel.text = vertLabel;
    _horizontalAxisLabel.text = metric.metricHorizontalAxisLabel;
    _grid.metric = metric;
    _grid.numberOfVerticalLinesOnGraph = [NSNumber numberWithInteger:metric.dataPoints.count];
}

@end
