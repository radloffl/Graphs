//
//  SplitViewNavigationController.m
//  Graphs
//
//  Created by Logan on 10/8/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "SplitViewNavigationController.h"

@interface SplitViewNavigationController ()

@end

@implementation SplitViewNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.splitViewController.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
