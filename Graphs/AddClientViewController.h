//
//  AddClientViewController.h
//  Graphs
//
//  Created by Logan on 10/3/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddClientViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource>

@property UITextField *firstName;
@property UITextField *lastName;
@property UITextField *dateOfBirth;
@property UITextField *height;

@property UIPickerView *heightPicker;
@property UIDatePicker *dateOfBirthPicker;
@end
