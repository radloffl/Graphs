//
//  GraphsTableViewController.h
//  Graphs
//
//  Created by Logan on 8/21/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"
#import "ClientHeaderView.h"
#import "Client.h"

@interface ClientStatisticsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property ClientHeaderView *clientHeader;
@property Client *client;
@property UITableView *tableView;

@end
