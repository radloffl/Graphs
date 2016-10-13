//
//  ClientTableViewController.m
//  Graphs
//
//  Created by Logan on 8/28/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "ClientTableViewController.h"
#import "ClientTableViewCell.h"
#import "UIColor+DefaultThemeColors.h"
#import "ClientStatisticsViewController.h"
#import "AddEditClientViewController.h"
#import "EditClientTableViewController.h"

@interface ClientTableViewController ()

@end

@implementation ClientTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _clients = [[NSMutableArray alloc] init];
        for (int i = 0; i < 2; i++) {
            Client *temp = [[Client alloc] init];
            temp.firstName = [NSString stringWithFormat:@"Client %d", i+1];
            temp.lastName = [NSString stringWithFormat:@"Test"];
            temp.height = [NSString stringWithFormat:@"%@'%d\"", @5, i+6];
            temp.dateOfBirth = [NSString stringWithFormat:@"%d/%d/%d", i+3, i+20,i+86];
            [_clients addObject:temp];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    //Edit Data Button Image Drawing
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, [UIScreen mainScreen].scale);
    CGFloat pencilTipSize = 7.5;
    CGFloat pencilSpacing = 1.5;
    CGFloat pencilLength = 20;
    CGFloat pencilEraserLength = 5;
    CGAffineTransform space = CGAffineTransformMakeTranslation(pencilSpacing, -pencilSpacing);
    
    UIBezierPath *editBackground = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2, 2, 46, 46) cornerRadius:8.0];
    UIBezierPath *editPencilTip = [UIBezierPath bezierPath];
    UIBezierPath *editPencilShaft = [UIBezierPath bezierPath];
    UIBezierPath *editPencilEraser = [UIBezierPath bezierPath];
    
    [editPencilTip moveToPoint:CGPointMake(pencilTipSize, 50-pencilTipSize*2)];
    [editPencilTip addLineToPoint:CGPointMake(pencilTipSize,50-pencilTipSize)];
    [editPencilTip addLineToPoint:CGPointMake(pencilTipSize*2, 50-pencilTipSize)];
    [editPencilTip closePath];
    
    [editPencilShaft moveToPoint:CGPointMake(pencilTipSize, 50-pencilTipSize*2)];
    [editPencilShaft addLineToPoint:CGPointMake(pencilTipSize*2, 50-pencilTipSize)];
    [editPencilShaft addLineToPoint:CGPointMake(pencilTipSize*2+pencilLength, 50-pencilTipSize-pencilLength)];
    [editPencilShaft addLineToPoint:CGPointMake(pencilTipSize+pencilLength, 50-pencilTipSize*2-pencilLength)];
    [editPencilShaft closePath];
    [editPencilShaft applyTransform:space];
    
    [editPencilEraser moveToPoint:CGPointMake(pencilTipSize*2+pencilLength, 50-pencilTipSize-pencilLength)];
    [editPencilEraser addLineToPoint:CGPointMake(pencilTipSize+pencilLength, 50-pencilTipSize*2-pencilLength)];
    [editPencilEraser addLineToPoint:CGPointMake(pencilTipSize+pencilLength+pencilEraserLength, 50-pencilTipSize*2-pencilLength-pencilEraserLength)];
    [editPencilEraser addLineToPoint:CGPointMake(pencilTipSize*2+pencilLength+pencilEraserLength, 50-pencilTipSize-pencilLength-pencilEraserLength)];
    [editPencilEraser closePath];
    [editPencilEraser applyTransform:space];
    [editPencilEraser applyTransform:space];
    
    [[UIColor primaryIconColor] setStroke];
    [[UIColor primaryIconColor] setFill];
    [editBackground setLineWidth:3.0];
    [editBackground stroke];
    [editPencilTip fill];
    [editPencilShaft fill];
    [editPencilEraser fill];
    UIImage *editBarButtonImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    //

    //Add Data Button Image Drawing
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *addDataBackground = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2, 2, 46, 46) cornerRadius:8.0];
    UIBezierPath *horizontalLine = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(25-1.5, 10, 3, 30) cornerRadius:1.5];
    UIBezierPath *verticleLine = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 25-1.5, 30, 3) cornerRadius:1.5];
    
    [[UIColor primaryIconColor] setStroke];
    [addDataBackground setLineWidth:3.0];
    [addDataBackground stroke];
    [[UIColor primaryIconColor] setFill];
    [horizontalLine fill];
    [verticleLine fill];
    UIImage *addBarButtonImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    //

    
    self.navigationItem.title = @"Clients";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor primaryTextColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor primaryAccentColor];
    self.navigationController.navigationBar.tintColor = [UIColor primaryIconColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithCGImage:[editBarButtonImage CGImage]
                                                                                                           scale:(editBarButtonImage.scale * 1.5625)
                                                                                                     orientation:(editBarButtonImage.imageOrientation)]
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(_editClientButtonPressed)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithCGImage:[addBarButtonImage CGImage]
                                                                                                       scale:(addBarButtonImage.scale * 1.5625)
                                                                                                 orientation:(addBarButtonImage.imageOrientation)]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(_addClientButtonPressed)];

    
    [[UITabBar appearance] setTintColor:[UIColor primaryAccentColor]];
    [[UITabBar appearance] setTranslucent:NO];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor primaryBackgroudColor];
    [self.tableView registerClass:[ClientTableViewCell class] forCellReuseIdentifier:@"client"];
    
    //UISearchController *sc = [[UISearchController alloc] initWithSearchResultsController:nil];
    //sc.dimsBackgroundDuringPresentation = NO;
    //[sc.searchBar sizeToFit];
    //self.tableView.tableHeaderView = sc.searchBar;
}

- (void)_addClientButtonPressed {
    AddEditClientViewController *addClientVC = [[AddEditClientViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:addClientVC];
    nvc.modalPresentationStyle = UIModalPresentationPopover;
    nvc.preferredContentSize = CGSizeMake(400, 240);
    nvc.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    nvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)_editClientButtonPressed {
    EditClientTableViewController *editClientVC = [[EditClientTableViewController alloc] init];
    editClientVC.clients = _clients;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:editClientVC];
    nvc.modalPresentationStyle = UIModalPresentationPopover;
    nvc.preferredContentSize = CGSizeMake(400, 500);
    nvc.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    nvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _clients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClientTableViewCell *cell = (ClientTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"client" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.clientNameLabel.text = [NSString stringWithFormat:@"%@ %@",_clients[indexPath.row].firstName, _clients[indexPath.row].lastName];
    [cell updateConstraints];
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ClientTableViewCell *cell = (ClientTableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:YES animated:YES];
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ClientStatisticsViewController *clientViewController = [ClientStatisticsViewController new];
    clientViewController.client = _clients[indexPath.row];
    
    [self.splitViewController showDetailViewController:clientViewController sender:self];
    
}


@end
