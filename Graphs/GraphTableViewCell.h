//
//  GraphTableViewCell.h
//  Graphs
//
//  Created by Logan on 8/21/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface GraphTableViewCell : UITableViewCell

@property GraphView *graph;

@property UILabel *mostRecentLabel;
@property UILabel *mostRecentValueLabel;

@property UILabel *goalLabel;
@property UILabel *goalValueLabel;

@property UILabel *startLabel;
@property UILabel *startValueLabel;

@end
