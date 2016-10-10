//
//  GraphTableViewCell.m
//  Graphs
//
//  Created by Logan on 8/21/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "GraphTableViewCell.h"
#import "UIColor+DefaultThemeColors.h"

@implementation GraphTableViewCell {
    UIStackView *_valueStack;
    UIView *_spacingView;
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
        
        _valueStack = [[UIStackView alloc] initWithArrangedSubviews:@[]];
        _valueStack.translatesAutoresizingMaskIntoConstraints = NO;
        _valueStack.axis = UILayoutConstraintAxisVertical;
        _valueStack.distribution = UIStackViewDistributionEqualSpacing;
        [_spacingView addSubview:_valueStack];
        
        _mostRecentLabel = [UILabel new];
        _mostRecentLabel.text = @"Most Recent";
        _mostRecentLabel.font = [UIFont systemFontOfSize:12];
        _mostRecentLabel.textColor = [UIColor mostRecentColor];
        
        _mostRecentValueLabel = [UILabel new];
        _mostRecentValueLabel.font = [UIFont systemFontOfSize:48];
        _mostRecentValueLabel.textColor = [UIColor mostRecentColor];
        
        UIStackView *mostRecentStack = [[UIStackView alloc] initWithArrangedSubviews:@[_mostRecentLabel, _mostRecentValueLabel]];
        mostRecentStack.axis = UILayoutConstraintAxisVertical;
        mostRecentStack.distribution = UIStackViewDistributionFillProportionally;
        
        _goalLabel = [UILabel new];
        _goalLabel.text = @"Goal";
        _goalLabel.font = [UIFont systemFontOfSize:12];
        _goalLabel.textColor = [UIColor goalColor];
        
        _goalValueLabel = [UILabel new];
        _goalValueLabel.font = [UIFont systemFontOfSize:36];
        _goalValueLabel.textColor = [UIColor goalColor];
        
        UIStackView *goalStack = [[UIStackView alloc] initWithArrangedSubviews:@[_goalLabel, _goalValueLabel]];
        goalStack.axis = UILayoutConstraintAxisVertical;
        goalStack.distribution = UIStackViewDistributionFillProportionally;
        
        _startLabel = [UILabel new];
        _startLabel.text = @"Start";
        _startLabel.font = [UIFont systemFontOfSize:12];
        _startLabel.textColor = [UIColor primaryTextColor];
        
        
        _startValueLabel = [UILabel new];
        _startValueLabel.font = [UIFont systemFontOfSize:24];
        _startValueLabel.textColor = [UIColor primaryTextColor];
        
        UIStackView *startStack = [[UIStackView alloc] initWithArrangedSubviews:@[_startLabel, _startValueLabel]];
        startStack.axis = UILayoutConstraintAxisVertical;
        startStack.distribution = UIStackViewDistributionFillProportionally;
        
        [_valueStack insertArrangedSubview:mostRecentStack atIndex:0];
        [_valueStack insertArrangedSubview:goalStack atIndex:1];
        [_valueStack insertArrangedSubview:startStack atIndex:2];

        _graph = [GraphView new];
        _graph.translatesAutoresizingMaskIntoConstraints = NO;
        [_graph setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_spacingView addSubview:_graph];
        
        [self updateConstraints];
    }
    return self;
}

-(void)updateConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_graph, _valueStack, _spacingView);
    
    NSArray *horizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_valueStack]-(2)-[_graph]-(2)-|"
                                                                        options:NSLayoutFormatAlignAllCenterY
                                                                        metrics:nil
                                                                          views:views];
    NSArray *verticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_graph(>=250,<=600)]-|"
                                                                      options:NSLayoutFormatAlignAllTop
                                                                      metrics:nil
                                                                        views:views];
    
    [_spacingView addConstraints:horizontalLayout];
    [_spacingView addConstraints:verticalLayout];
    
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
    
    [_graph setNeedsDisplay];
    
    [super updateConstraints];
}


@end
