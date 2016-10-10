//
//  GraphView.m
//  Graphs
//
//  Created by Logan on 8/11/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "GraphGrid.h"
#import "ClientMetric.h"
#import "UIColor+DefaultThemeColors.h"

#define GOAL_DASH_LENTH 5
#define GOAL_DASH_SPACE 5

#define LINE_LABEL_FONT_SIZE 8
#define LABEL_SPACING 5


@implementation GraphGrid {
    CGSize _graphSize;
    CGContextRef _context;
    NSMutableArray<UILabel *>* _verticalLabels;
    NSMutableArray<UILabel *>* _horizontalLabels;
}

- (void)drawRect:(CGRect)rect {
    
    _context = UIGraphicsGetCurrentContext();
    _graphSize = CGSizeMake(rect.size.width-(GRAPH_MARGIN_LEFT*2), rect.size.height-(GRAPH_MARGIN_TOP*2));
    
    CGContextSaveGState(_context);
    CGContextTranslateCTM(_context, 0.0, _graphSize.height + GRAPH_MARGIN_TOP*2);
    CGContextScaleCTM(_context, 1.0, -1.0);
    
    
    [self _drawHorizontalLines];
    [self _drawVerticalLines];
    [self _drawGoalLine];
    
    [self _drawVerticalLabels];
    [self _drawHorizontalLabels];
    
    [self _drawLinesBetweenPoints];
    [self _drawPoints];
    CGContextRestoreGState(_context);
    
}

-(void)_drawHorizontalLines {
    NSNumber *horizontalLinesCount = self.numberOfHorizontalLinesOnGraph;
    
    CGFloat horizontalLinesSpacing = (_graphSize.height) / (horizontalLinesCount.floatValue-1);
    
    for (int i = 0; i < horizontalLinesCount.integerValue; i++) {
        UIBezierPath *horizontalLinePath = [UIBezierPath bezierPath];
        [_horizontalLineColor setStroke];
        [horizontalLinePath setLineWidth:0.5];
        [horizontalLinePath moveToPoint:CGPointMake(GRAPH_MARGIN_LEFT, i*horizontalLinesSpacing + GRAPH_MARGIN_TOP)];
        [horizontalLinePath addLineToPoint:CGPointMake(_graphSize.width + GRAPH_MARGIN_LEFT, i*horizontalLinesSpacing + GRAPH_MARGIN_TOP)];
        [horizontalLinePath stroke];
        [horizontalLinePath closePath];
    }
}

-(void)_drawVerticalLines {
    NSNumber *verticalLinesCount = self.numberOfVerticalLinesOnGraph;
    
    CGFloat verticalLinesSpacing = (_graphSize.width) / (verticalLinesCount.integerValue-1);
    
    for (int i = 0; i < verticalLinesCount.integerValue; i++) {
        UIBezierPath *verticalLinePath = [UIBezierPath bezierPath];
        [_verticalLineColor setStroke];
        [verticalLinePath setLineWidth:0.5];
        [verticalLinePath moveToPoint:CGPointMake(i*verticalLinesSpacing + GRAPH_MARGIN_LEFT, GRAPH_MARGIN_TOP)];
        [verticalLinePath addLineToPoint:CGPointMake(i*verticalLinesSpacing + GRAPH_MARGIN_LEFT, _graphSize.height + GRAPH_MARGIN_TOP)];
        [verticalLinePath stroke];
        [verticalLinePath closePath];
    }
}

-(void)_drawGoalLine {
    GraphPoint *goalPoint = [[GraphPoint alloc] initWithXValue:0 AndYValue:_metric.metricGoal];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [_goalLineColor setStroke];
    [linePath setLineWidth:0.5];
    CGFloat dashes[] = {GOAL_DASH_LENTH,GOAL_DASH_SPACE};
    [linePath setLineDash:dashes count:2 phase:0];
    [linePath moveToPoint:CGPointMake(GRAPH_MARGIN_LEFT,[self convertPointToScale:goalPoint].y.doubleValue + GRAPH_MARGIN_TOP)];
    [linePath addLineToPoint:CGPointMake(_graphSize.width + GRAPH_MARGIN_LEFT,[self convertPointToScale:goalPoint].y.doubleValue + GRAPH_MARGIN_TOP)];
    [linePath stroke];
    [linePath closePath];
}

-(void)_drawVerticalLabels {
    [_verticalLabels makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_verticalLabels removeAllObjects];
    
    NSNumber *domain = [NSNumber numberWithInteger:[self findMaxValueForAxis:@"x"].doubleValue - [self findMinValueForAxis:@"x"].doubleValue];
    
    NSNumber *verticalLinesCount = self.numberOfVerticalLinesOnGraph;
    
    NSNumber *domainSpace = [NSNumber numberWithDouble:domain.doubleValue/(verticalLinesCount.doubleValue-1)];
    
    for (int i = 0; i < verticalLinesCount.intValue; i++) {
            
        CGFloat verticalLinesSpacing = (_graphSize.width) / (verticalLinesCount.intValue-1);
        
        UILabel *verticalLineLabel = [UILabel new];
        verticalLineLabel.textColor = [UIColor primaryTextColor];
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterShortStyle];
        verticalLineLabel.text = [df stringFromDate:[NSDate dateWithTimeIntervalSince1970:domainSpace.doubleValue*i+[self findMinValueForAxis:@"x"].doubleValue]];
        
        verticalLineLabel.font = [UIFont systemFontOfSize:LINE_LABEL_FONT_SIZE];
        verticalLineLabel.adjustsFontSizeToFitWidth = YES;
        [verticalLineLabel sizeToFit];
        CGFloat width = verticalLineLabel.frame.size.width > verticalLinesSpacing ? verticalLinesSpacing : verticalLineLabel.frame.size.width;
        verticalLineLabel.frame = CGRectMake(verticalLinesSpacing*i - (verticalLineLabel.frame.size.width/2) + GRAPH_MARGIN_LEFT,
                                             _graphSize.height+LABEL_SPACING + GRAPH_MARGIN_TOP,
                                             width,
                                             verticalLineLabel.frame.size.height);
        [_verticalLabels addObject:verticalLineLabel];
        [self addSubview:verticalLineLabel];
        
    }
}

-(void)_drawHorizontalLabels {
    [_horizontalLabels makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_horizontalLabels removeAllObjects];
    
    NSNumber *range = [NSNumber numberWithDouble:[self findMaxValueForAxis:@"y"].doubleValue - [self findMinValueForAxis:@"y"].doubleValue];
    NSNumber *horizontalLinesCount = self.numberOfHorizontalLinesOnGraph;
    
    NSNumber *rangeSpace = [NSNumber numberWithDouble:range.doubleValue/(horizontalLinesCount.doubleValue-1)];
    
    for (NSInteger i = 0; i < horizontalLinesCount.integerValue; i++) {
        CGFloat horizontalLinesSpacing = (_graphSize.height) / (horizontalLinesCount.integerValue-1);
        
        UILabel *horizontalLineLabel = [UILabel new];
        horizontalLineLabel.textColor = [UIColor primaryTextColor];

        NSNumberFormatter *nf = [NSNumberFormatter new];
        [nf setNumberStyle:NSNumberFormatterDecimalStyle];
        [nf setMaximumFractionDigits:1];
        horizontalLineLabel.text = [nf stringFromNumber:[NSNumber numberWithDouble:rangeSpace.doubleValue*i]];
        
        horizontalLineLabel.font = [UIFont systemFontOfSize:LINE_LABEL_FONT_SIZE];
        [horizontalLineLabel sizeToFit];
        horizontalLineLabel.frame = CGRectMake(-horizontalLineLabel.frame.size.width-LABEL_SPACING + GRAPH_MARGIN_LEFT,
                                               horizontalLinesSpacing*(horizontalLinesCount.integerValue - 1 - i) - (horizontalLineLabel.frame.size.height/2) + GRAPH_MARGIN_TOP,
                                               horizontalLineLabel.frame.size.width,
                                               horizontalLineLabel.frame.size.height);
        [_horizontalLabels addObject:horizontalLineLabel];
        [self addSubview:horizontalLineLabel];
    }
}

-(void)_drawPoints {
    for (GraphPoint *point in _metric.dataPoints) {
        UIBezierPath *pointPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake([self convertPointToScale:point].x.doubleValue - point.radius + GRAPH_MARGIN_LEFT,
                                                                                     [self convertPointToScale:point].y.doubleValue - point.radius + GRAPH_MARGIN_TOP,
                                                                                     point.radius*2,
                                                                                     point.radius*2)
                                                             cornerRadius:point.radius/2];
//        UIBezierPath *pointPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake([self convertPointToScale:point].x.doubleValue - point.radius + GRAPH_MARGIN_LEFT,
//                                                                                    [self convertPointToScale:point].y.doubleValue - point.radius + GRAPH_MARGIN_TOP,
//                                                                                    point.radius*2,
//                                                                                    point.radius*2)];
        [point.color setFill];
        [pointPath fill];
        [pointPath closePath];
    }
}

-(void)_drawLinesBetweenPoints {
    [[UIColor blackColor] setStroke];
    for (int i = 1; i < _metric.dataPoints.count; i++) {
        GraphPoint *p1 = (GraphPoint *) _metric.dataPoints[i-1];
        GraphPoint *p2 = (GraphPoint *) _metric.dataPoints[i];
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath setLineWidth:1.0];
        [linePath moveToPoint:CGPointMake([self convertPointToScale:p1].x.doubleValue + GRAPH_MARGIN_LEFT, [self convertPointToScale:p1].y.doubleValue + GRAPH_MARGIN_TOP)];
        [linePath addLineToPoint:CGPointMake([self convertPointToScale:p2].x.doubleValue + GRAPH_MARGIN_LEFT, [self convertPointToScale:p2].y.doubleValue + GRAPH_MARGIN_TOP)];
        [linePath stroke];
    }
}

-(GraphPoint *)convertPointToScale:(GraphPoint *)point {
    NSNumber *maxX = [self findMaxValueForAxis:@"x"];
    NSNumber *minX = [self findMinValueForAxis:@"x"];
    NSNumber *maxY = [self findMaxValueForAxis:@"y"];
    NSNumber *minY = [self findMinValueForAxis:@"y"];
    NSNumber *domain = [NSNumber numberWithDouble:maxX.doubleValue - minX.doubleValue];
    NSNumber *range = [NSNumber numberWithDouble:maxY.doubleValue - minY.doubleValue];
    NSNumber *newX = [NSNumber numberWithDouble:((point.x.doubleValue/domain.doubleValue)-(minX.doubleValue/domain.doubleValue))*_graphSize.width];
    NSNumber *newY = [NSNumber numberWithDouble:((point.y.doubleValue/range.doubleValue)-(minY.doubleValue/range.doubleValue))*_graphSize.height];
    GraphPoint *scaledPoint = [[GraphPoint alloc] initWithXValue:newX AndYValue:newY];
    return scaledPoint;
}

-(NSNumber *)findMaxValueForAxis:(NSString *)axis {
    NSNumber *max = [NSNumber numberWithInt:INT_MIN];
    if ([axis isEqualToString:@"x"]) {
        
        for (GraphPoint *p in _metric.dataPoints) {
            if (p.x.doubleValue > max.doubleValue) {
                max = p.x;
            }
        }
    } else if ([axis isEqualToString:@"y"]) {
        
        for (GraphPoint *p in _metric.dataPoints) {
            if (p.y.doubleValue > max.doubleValue) {
                max = p.y;
            }
        }
    }
    return max;
}

-(NSNumber *)findMinValueForAxis:(NSString *)axis {
    NSNumber *min = [NSNumber numberWithInt:INT_MAX];
    if ([axis isEqualToString:@"x"]) {
        
        for (GraphPoint *p in _metric.dataPoints) {
            if (p.x.doubleValue < min.doubleValue) {
                min = p.x;
            }
        }
    } else if ([axis isEqualToString:@"y"]) {
        min = @0;
//        for (GraphPoint *p in _metric.dataPoints) {
//            if (p.y.doubleValue < min.doubleValue) {
//                min = p.y;
//            }
//        }
    }
    return min;
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _horizontalLineColor = [UIColor blackColor];
        _verticalLineColor = [UIColor blackColor];
        _goalLineColor = [UIColor greenColor];
        
        _verticalLabels = [NSMutableArray new];
        _horizontalLabels = [NSMutableArray new];
        
        _numberOfVerticalLinesOnGraph = @12;
        _numberOfHorizontalLinesOnGraph = @5;
    }
    
    return self;
}


@end
