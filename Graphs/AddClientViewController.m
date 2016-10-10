//
//  AddClientViewController.m
//  Graphs
//
//  Created by Logan on 10/3/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "AddClientViewController.h"

@interface AddClientViewController ()

@end

@implementation AddClientViewController {
    NSMutableArray<NSString *>* _addPrompts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"client add prompt"];
    
    _addPrompts = [[NSMutableArray alloc] init];
    [_addPrompts addObject:@"First Name"];
    [_addPrompts addObject:@"Last Name"];
    [_addPrompts addObject:@"Age"];
    [_addPrompts addObject:@"Height"];
    [_addPrompts addObject:@"Client Image"];
    
    
    self.navigationItem.title = @"Add Client";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(_dimiss)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(_save)];
}

-(void)_dimiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)_save {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _addPrompts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"client add prompt" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == 0) {
        _firstName = [UITextField new];
        _firstName.placeholder = @"First Name";
        _firstName.autocorrectionType = UITextAutocorrectionTypeNo;
        _firstName.translatesAutoresizingMaskIntoConstraints = NO;
        [_firstName setClearButtonMode:UITextFieldViewModeWhileEditing];
        [cell addSubview:_firstName];
        NSArray *firstNameConstraintHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_firstName]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_firstName": _firstName}];
        NSArray *firstNameConstraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_firstName]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_firstName": _firstName}];

        [cell addConstraints:firstNameConstraintHorizontal];
        [cell addConstraints:firstNameConstraintVertical];
        
        
    } else if (indexPath.row == 1) {
        _lastName = [UITextField new];
        _lastName.placeholder = @"Last Name";
        _lastName.autocorrectionType = UITextAutocorrectionTypeNo;
        _lastName.translatesAutoresizingMaskIntoConstraints = NO;
        [_lastName setClearButtonMode:UITextFieldViewModeWhileEditing];
        [cell.contentView addSubview:_lastName];
        NSArray *lastNameConstraintHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_lastName]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_lastName": _lastName}];
        NSArray *lastNameConstraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_lastName]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_lastName": _lastName}];
        
        [cell.contentView addConstraints:lastNameConstraintHorizontal];
        [cell.contentView addConstraints:lastNameConstraintVertical];
        
    } else if (indexPath.row == 2) {
        _dateOfBirth = [UITextField new];
        _dateOfBirth.placeholder = @"Date of Birth";
        _dateOfBirth.autocorrectionType = UITextAutocorrectionTypeNo;
        _dateOfBirth.translatesAutoresizingMaskIntoConstraints = NO;
        [_dateOfBirth setClearButtonMode:UITextFieldViewModeWhileEditing];
        
        _dateOfBirthPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        _dateOfBirthPicker.datePickerMode = UIDatePickerModeDate;
        _dateOfBirth.inputView = _dateOfBirthPicker;
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        toolBar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dateOfBirthDoneTouched:)];
        
        [toolBar setItems:[NSArray arrayWithObjects:doneButton, nil]];
        _dateOfBirth.inputAccessoryView = toolBar;
        
        [cell.contentView addSubview:_dateOfBirth];
        NSArray *ageConstraintHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_dateOfBirth]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_dateOfBirth": _dateOfBirth}];
        NSArray *ageNameConstraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_dateOfBirth]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_dateOfBirth": _dateOfBirth}];
        
        [cell.contentView addConstraints:ageConstraintHorizontal];
        [cell.contentView addConstraints:ageNameConstraintVertical];
        
    } else if (indexPath.row == 3) {
        _height = [UITextField new];
        _height.placeholder = @"Height";
        _height.translatesAutoresizingMaskIntoConstraints = NO;
        _heightPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        [_heightPicker setDataSource: self];
        [_heightPicker setDelegate: self];
        _heightPicker.showsSelectionIndicator = YES;
        [_heightPicker selectRow:4 inComponent:0 animated:NO];
        [_heightPicker selectRow:6 inComponent:1 animated:NO];
        _height.inputView = _heightPicker;
        
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        toolBar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(heightDoneTouched:)];
        
        [toolBar setItems:[NSArray arrayWithObjects:doneButton, nil]];
        _height.inputAccessoryView = toolBar;
        
        [cell.contentView addSubview:_height];
        NSArray *heightConstraintHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_height]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_height": _height}];
        NSArray *heightNameConstraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_height]|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_height": _height}];
        
        [cell.contentView addConstraints:heightConstraintHorizontal];
        [cell.contentView addConstraints:heightNameConstraintVertical];
    } else if (indexPath.row == 4) {
        cell.textLabel.text = _addPrompts[indexPath.row];
        
        CGRect rect = CGRectMake(0, 0, 100, 100);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextFillRect(context, rect);
        UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _clientImageView = [[UIImageView alloc] initWithImage:blank];
        _clientImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [cell.contentView addSubview:_clientImageView];
        
        NSArray *heightConstraintHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=0)-[_clientImageView]|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_clientImageView": _clientImageView}];
        NSArray *heightNameConstraintVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_clientImageView]-|" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"_clientImageView": _clientImageView}];
        NSLayoutConstraint *squareConstraint = [NSLayoutConstraint constraintWithItem:_clientImageView
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:_clientImageView
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0
                                                                             constant:0];
        [cell.contentView addConstraints:heightConstraintHorizontal];
        [cell.contentView addConstraints:heightNameConstraintVertical];
        [cell.contentView addConstraint:squareConstraint];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        CGFloat height;
        height = 60;
        return height;
    } else {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 4) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.modalPresentationStyle = UIModalPresentationPopover;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.delegate = self;
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            
            UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
            
            UIPopoverPresentationController *imagePickerPresentationController = imagePicker.popoverPresentationController;
            imagePickerPresentationController.sourceRect = CGRectMake(cell.frame.size.width, cell.frame.size.height/2, 0, 0);
            imagePickerPresentationController.sourceView = cell;
            //imagePickerPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
            imagePickerPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
            
            [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
            
        }
    }
}

- (void)heightDoneTouched:(UIBarButtonItem *)sender {
    _height.text = [NSString stringWithFormat:@"%@ %@", [self pickerView:_heightPicker titleForRow:[_heightPicker selectedRowInComponent:0] forComponent:0], [self pickerView:_heightPicker titleForRow:[_heightPicker selectedRowInComponent:1] forComponent:1]];
    [_height resignFirstResponder];
}

- (void)dateOfBirthDoneTouched:(UIBarButtonItem *) sender {
    NSDate *dateOfBirth = _dateOfBirthPicker.date;
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    _dateOfBirth.text = [df stringFromDate:dateOfBirth];
    [_dateOfBirth resignFirstResponder];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 7;
    } else {
    return 12;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [NSString stringWithFormat:@"%ld'", row + 1];
    } else {
        return [NSString stringWithFormat:@"%ld\"", row];
    }
}

@end
