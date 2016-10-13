//
//  EditClientViewController.m
//  Graphs
//
//  Created by Logan on 10/3/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "EditClientTableViewController.h"
#import "AddEditClientViewController.h"

@interface EditClientTableViewController ()

@end

@implementation EditClientTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"client edit prompt"];
    
    self.navigationItem.title = @"Select client to edit";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(_dimiss)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_dimiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)_save {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _clients.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"client edit prompt" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",_clients[indexPath.row].firstName, _clients[indexPath.row].lastName];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddEditClientViewController *editVC = [[AddEditClientViewController alloc] init];
    editVC.client = _clients[indexPath.row];
    [self.navigationController pushViewController:editVC animated:YES];
}

@end
