//
//  GraphsTableViewController.m
//  Graphs
//
//  Created by Logan on 8/21/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "ClientStatisticsViewController.h"
#import "GraphTableViewCell.h"
#import "ClientMetric.h"
#import "AddDataTableViewController.h"
#import "EditDataTableViewController.h"
#import "UIColor+DefaultThemeColors.h"

@interface ClientStatisticsViewController ()

@end

@implementation ClientStatisticsViewController {
    NSMutableArray<ClientMetric *> *_metrics;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSDateFormatter *df = [NSDateFormatter new];
        [df setDateStyle:NSDateFormatterShortStyle];
        NSNumber * x1 = [NSNumber numberWithInteger:[[df dateFromString:@"9/12/16"] timeIntervalSince1970]];
        NSNumber * x2 = [NSNumber numberWithInteger:[[df dateFromString:@"9/19/16"] timeIntervalSince1970]];
        NSNumber * x3 = [NSNumber numberWithInteger:[[df dateFromString:@"9/26/16"] timeIntervalSince1970]];
        NSNumber * x4 = [NSNumber numberWithInteger:[[df dateFromString:@"10/3/16"] timeIntervalSince1970]];
        NSNumber * x5 = [NSNumber numberWithInteger:[[df dateFromString:@"10/10/16"] timeIntervalSince1970]];
        NSNumber * x6 = [NSNumber numberWithInteger:[[df dateFromString:@"10/17/16"] timeIntervalSince1970]];
        NSNumber * x7 = [NSNumber numberWithInteger:[[df dateFromString:@"10/24/16"] timeIntervalSince1970]];
        NSNumber * x8 = [NSNumber numberWithInteger:[[df dateFromString:@"9/12/15"] timeIntervalSince1970]];
        NSNumber * x9 = [NSNumber numberWithInteger:[[df dateFromString:@"9/19/15"] timeIntervalSince1970]];
        NSNumber * x10 = [NSNumber numberWithInteger:[[df dateFromString:@"9/26/15"] timeIntervalSince1970]];
        NSNumber * x11 = [NSNumber numberWithInteger:[[df dateFromString:@"10/3/15"] timeIntervalSince1970]];
        NSNumber * x12 = [NSNumber numberWithInteger:[[df dateFromString:@"10/10/15"] timeIntervalSince1970]];
        NSNumber * x13 = [NSNumber numberWithInteger:[[df dateFromString:@"10/17/15"] timeIntervalSince1970]];
        NSNumber * x14 = [NSNumber numberWithInteger:[[df dateFromString:@"10/24/15"] timeIntervalSince1970]];
        NSNumber * x15 = [NSNumber numberWithInteger:[[df dateFromString:@"10/31/15"] timeIntervalSince1970]];
        
        GraphPoint *p1 = [[GraphPoint alloc] initWithXValue:x1  AndYValue: @135];
        GraphPoint *p2 = [[GraphPoint alloc] initWithXValue:x2 AndYValue:@100];
        GraphPoint *p3 = [[GraphPoint alloc] initWithXValue:x3 AndYValue:@80];
        GraphPoint *p4 = [[GraphPoint alloc] initWithXValue:x4 AndYValue:@53];
        GraphPoint *p5 = [[GraphPoint alloc] initWithXValue:x5 AndYValue:@45];
        GraphPoint *p6 = [[GraphPoint alloc] initWithXValue:x6 AndYValue:@31];
        GraphPoint *p7 = [[GraphPoint alloc] initWithXValue:x7 AndYValue:@40];
        p7.color = [UIColor mostRecentColor];
        
        ClientMetric *cm1 = [ClientMetric new];
        cm1.dataPoints = [NSMutableArray arrayWithArray:@[p1,p2,p3,p4,p5,p6,p7]];
        cm1.metricName = @"Weight";
        cm1.metricVerticalAxisLabel = @"Pounds";
        cm1.metricHorizontalAxisLabel = @"Date";
        cm1.metricGoal = @32;
        
        GraphPoint *p8 = [[GraphPoint alloc] initWithXValue:x8 AndYValue: @175];
        GraphPoint *p9 = [[GraphPoint alloc] initWithXValue:x9 AndYValue:@170];
        GraphPoint *p10 = [[GraphPoint alloc] initWithXValue:x10 AndYValue:@172];
        GraphPoint *p11 = [[GraphPoint alloc] initWithXValue:x11 AndYValue:@169];
        GraphPoint *p12 = [[GraphPoint alloc] initWithXValue:x12 AndYValue:@165];
        GraphPoint *p13 = [[GraphPoint alloc] initWithXValue:x13 AndYValue:@162];
        GraphPoint *p14 = [[GraphPoint alloc] initWithXValue:x14 AndYValue:@159];
        GraphPoint *p15 = [[GraphPoint alloc] initWithXValue:x15 AndYValue:@155];
        p15.color = [UIColor mostRecentColor];
                          
        ClientMetric *cm2 = [ClientMetric new];
        cm2.dataPoints = [NSMutableArray arrayWithArray:@[p8,p9,p10,p11,p12,p13,p14,p15]];
        cm2.metricName = @"Client Metric 2";
        cm2.metricVerticalAxisLabel = @"Vertical Label";
        cm2.metricHorizontalAxisLabel = @"Horizontal Label";
        cm2.metricGoal = @155;
        
        _metrics = [NSMutableArray new];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
        [_metrics addObject:cm2];
        [_metrics addObject:cm1];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    self.view.backgroundColor = [UIColor primaryAccentColor];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.estimatedRowHeight = 600;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor primaryBackgroudColor];
    [_tableView registerClass:[GraphTableViewCell class] forCellReuseIdentifier:@"graph"];
    [self.view addSubview:_tableView];
    
    _clientHeader = [[ClientHeaderView alloc] init];
    _clientHeader.translatesAutoresizingMaskIntoConstraints = NO;
    [_clientHeader.addDataButton addTarget:self action:@selector(_presentAddDataView) forControlEvents:UIControlEventTouchUpInside];
    [_clientHeader.editDataButton addTarget:self action:@selector(_presentEditDataView) forControlEvents:UIControlEventTouchUpInside];
    _clientHeader.clientName.text = [NSString stringWithFormat:@"%@ %@",_client.firstName,_client.lastName];
    
    NSDate* now = [NSDate date];
    NSDateFormatter* DoBFormatter = [[NSDateFormatter alloc] init];
    DoBFormatter.dateStyle = NSDateFormatterShortStyle;
    NSDate *DoB = [DoBFormatter dateFromString:_client.dateOfBirth];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:DoB
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    _clientHeader.ageValueLabel.text = [NSString stringWithFormat:@"%ld",(long)age];
    _clientHeader.heightValueLabel.text = _client.height;
    [self.view addSubview:_clientHeader];

}

-(void)_presentAddDataView {
    AddDataTableViewController *addDataVC = [[AddDataTableViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:addDataVC];
    nvc.modalPresentationStyle = UIModalPresentationPopover;
    nvc.preferredContentSize = CGSizeMake(400, 500);
    nvc.popoverPresentationController.sourceView = _clientHeader.addDataButton;
    nvc.popoverPresentationController.sourceRect = CGRectMake(_clientHeader.addDataButton.frame.size.height/2, _clientHeader.addDataButton.frame.size.height, 0, 0);
    nvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:nvc animated:YES completion:nil];
}

-(void)_presentEditDataView {
    EditDataTableViewController *editDataVC = [[EditDataTableViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:editDataVC];
    nvc.modalPresentationStyle = UIModalPresentationPopover;
    nvc.preferredContentSize = CGSizeMake(400, 500);
    nvc.popoverPresentationController.sourceView = _clientHeader.editDataButton;
    nvc.popoverPresentationController.sourceRect = CGRectMake(_clientHeader.editDataButton.frame.size.height/2, _clientHeader.editDataButton.frame.size.height, 0, 0);
    nvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:nvc animated:YES completion:nil];
}

-(void)updateViewConstraints {
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_tableView, _clientHeader);
   
    NSArray *horizontalHeaderLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_clientHeader]|"
                                                                        options:NSLayoutFormatAlignAllTop
                                                                        metrics:nil
                                                                          views:views];
    
    NSArray *horizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|"
                                                                        options:NSLayoutFormatAlignAllTop
                                                                        metrics:nil
                                                                          views:views];
    
    NSNumber *statusBarPadding = [UIApplication sharedApplication].isStatusBarHidden ? @0 : @20;
    statusBarPadding = self.splitViewController.isCollapsed ? @4 : statusBarPadding;
    
    NSDictionary *m = @{@"height":[NSNumber numberWithFloat: ((UINavigationController *)self.splitViewController.viewControllers[0]).navigationBar.frame.size.height+statusBarPadding.floatValue]};
    NSArray *verticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_clientHeader(height)][_tableView]|"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:m
                                                                        views:views];
    [self.view addConstraints:horizontalHeaderLayout];
    [self.view addConstraints:horizontalLayout];
    [self.view addConstraints:verticalLayout];
    
    [super updateViewConstraints];
}

-(void)viewWillLayoutSubviews {
    [self updateViewConstraints];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _metrics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GraphTableViewCell *cell = (GraphTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"graph" forIndexPath:indexPath];
    ClientMetric *metric = _metrics[indexPath.row];
    // Configure the cell...
    GraphPoint *mostRecentPoint = (GraphPoint *) metric.dataPoints.lastObject;
    cell.mostRecentValueLabel.text = [NSString stringWithFormat:@"%ld", mostRecentPoint.y.integerValue];
    
    cell.goalValueLabel.text = metric.metricGoal.stringValue;
    
    GraphPoint *firstPoint = (GraphPoint *) _metrics[indexPath.row].dataPoints.firstObject;
    cell.startValueLabel.text = [NSString stringWithFormat:@"%ld", firstPoint.y.integerValue];
    
    cell.graph.metric = metric;
    
    [cell updateConstraints];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
