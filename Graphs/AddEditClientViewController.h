//
//  AddClientViewController.h
//  Graphs
//
//  Created by Logan on 10/3/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"

@interface AddEditClientViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource>

@property UITextField *firstName;
@property UITextField *lastName;
@property UITextField *dateOfBirth;
@property UITextField *height;
@property UIImageView *clientImageView;

@property UIPickerView *heightPicker;
@property UIDatePicker *dateOfBirthPicker;

@property Client *client;
@end
