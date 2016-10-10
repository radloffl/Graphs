//
//  ClientTableViewCell.m
//  Graphs
//
//  Created by Logan on 9/18/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "ClientTableViewCell.h"
#import "UIColor+DefaultThemeColors.h"

@implementation ClientTableViewCell {
    UIView *_spacingView;
    UIImageView *_clientImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor primaryBackgroudColor];
        
        _spacingView = [UIView new];
        _spacingView.backgroundColor = [UIColor secondaryBackgroudColor];
        _spacingView.layer.borderWidth = 0.5;
        _spacingView.layer.borderColor = [UIColor grayColor].CGColor;
        _spacingView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_spacingView];
        
        //Client Image Drawing
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 50), NO, [UIScreen mainScreen].scale);
        
        UIBezierPath *clientBodyPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 22, 30, 40) cornerRadius:5];
        UIBezierPath *clientHeadPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(15, 4, 20, 20)];
        
        [[UIColor primaryIconColor] setFill];
        [clientBodyPath fill];
        [clientHeadPath fill];
        UIImage *clientImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        //
        
        _clientImageView = [[UIImageView alloc] initWithImage:clientImage];
        _clientImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _clientImageView.layer.borderWidth = 2.0;
        _clientImageView.layer.borderColor = [UIColor primaryIconColor].CGColor;
        _clientImageView.layer.cornerRadius = 8.0;
        [_spacingView addSubview:_clientImageView];
        
        _clientNameLabel = [UILabel new];
        _clientNameLabel.text = @"Test Client";
        _clientNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_spacingView addSubview:_clientNameLabel];
        
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_clientNameLabel, _clientImageView, _spacingView);
    
    NSArray *horizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_clientNameLabel]-[_clientImageView(50)]-|"
                                                                        options:NSLayoutFormatAlignAllCenterY
                                                                        metrics:nil
                                                                          views:views];
    NSArray *verticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_clientNameLabel]-|"
                                                                      options:NSLayoutFormatAlignAllTop
                                                                      metrics:nil
                                                                        views:views];
    NSArray *clientImageVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_clientImageView(50)]-|"
                                                                      options:NSLayoutFormatAlignAllTop
                                                                      metrics:nil
                                                                        views:views];
    
    [_spacingView addConstraints:horizontalLayout];
    [_spacingView addConstraints:verticalLayout];
    [_spacingView addConstraints:clientImageVerticalLayout];
    
    NSArray *spacingViewHorizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(8)-[_spacingView]-(8)-|"
                                                                                   options:NSLayoutFormatAlignAllTop
                                                                                   metrics:nil
                                                                                     views:views];
    NSArray *spacingViewVertialLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(4)-[_spacingView]-(4)-|"
                                                                                options:NSLayoutFormatAlignAllTop
                                                                                metrics:nil
                                                                                  views:views];
    
    [self.contentView addConstraints:spacingViewHorizontalLayout];
    [self.contentView addConstraints:spacingViewVertialLayout];
    
    [super updateConstraints];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        _spacingView.backgroundColor = [UIColor primaryAccentColor];
    } else {
        _spacingView.backgroundColor = [UIColor secondaryBackgroudColor];
    }
}

@end
