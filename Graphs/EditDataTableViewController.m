//
//  EditDataTableViewController.m
//  Graphs
//
//  Created by Logan on 9/15/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "EditDataTableViewController.h"

@interface EditDataTableViewController ()

@end

@implementation EditDataTableViewController {
    NSMutableArray<NSString *>* _editDataPrompts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"edit data prompt"];
    
    _editDataPrompts = [[NSMutableArray alloc] init];
    [_editDataPrompts addObject:@"Metric"];
    [_editDataPrompts addObject:@"Date"];
    [_editDataPrompts addObject:@"Value"];
    
    self.navigationItem.title = @"Edit Data";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(_dimiss)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(_save)];
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
    return _editDataPrompts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"edit data prompt" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _editDataPrompts[indexPath.row];
    return cell;
}

@end
