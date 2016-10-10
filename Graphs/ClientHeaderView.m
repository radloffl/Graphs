//
//  ClientHeaderView.m
//  Graphs
//
//  Created by Logan on 8/24/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "ClientHeaderView.h"
#import "UIColor+DefaultThemeColors.h"

@implementation ClientHeaderView {
    UIView *_spacingView;
    UIStackView *_heightStackView;
    UIStackView *_ageStackView;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        
        _spacingView = [UIView new];
        _spacingView.translatesAutoresizingMaskIntoConstraints = NO;
        _spacingView.backgroundColor = [UIColor primaryAccentColor];
        [self addSubview:_spacingView];
        
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
        
        _clientName = [UILabel new];
        _clientName.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
        _clientName.text = @"Test Client";
        _clientName.translatesAutoresizingMaskIntoConstraints = NO;
        _clientName.textColor = [UIColor primaryTextColor];
        [_spacingView addSubview:_clientName];
        
        UILabel *_heightLabel = [UILabel new];
        _heightLabel.font = [UIFont systemFontOfSize:8.0 weight:UIFontWeightBold];
        _heightLabel.textAlignment = NSTextAlignmentRight;
        _heightLabel.text = @"Height";
        _heightLabel.textColor = [UIColor primaryTextColor];
        
        _heightValueLabel= [UILabel new];
        _heightValueLabel.font = [UIFont systemFontOfSize:20];
        _heightValueLabel.text = @"5'8\"";
        _heightValueLabel.textColor = [UIColor primaryTextColor];
        
        _heightStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_heightLabel, _heightValueLabel]];
        _heightStackView.axis = UILayoutConstraintAxisVertical;
        _heightStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [_heightStackView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_spacingView addSubview:_heightStackView];
        
        UILabel *_ageLabel = [UILabel new];
        _ageLabel.font = [UIFont systemFontOfSize:8.0 weight:UIFontWeightBold];
        _ageLabel.textAlignment = NSTextAlignmentRight;
        _ageLabel.text = @"Age";
        _ageLabel.textColor = [UIColor primaryTextColor];
        
        _ageValueLabel = [UILabel new];
        _ageValueLabel.font = [UIFont systemFontOfSize:20];
        _ageValueLabel.text = @"26";
        _ageValueLabel.textColor = [UIColor primaryTextColor];
        
        _ageStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_ageLabel, _ageValueLabel]];
        _ageStackView.axis = UILayoutConstraintAxisVertical;
        _ageStackView.translatesAutoresizingMaskIntoConstraints = NO;
        [_ageStackView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_spacingView addSubview:_ageStackView];
        
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
        UIImage *editDataImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        //
        
        _editDataButton = [UIButton new];
        [_editDataButton setBackgroundImage:editDataImage forState:UIControlStateNormal];
        _editDataButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_editDataButton setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_spacingView addSubview:_editDataButton];
        
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
        UIImage *addDataImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        //
        
        _addDataButton = [UIButton new];
        [_addDataButton setBackgroundImage:addDataImage forState:UIControlStateNormal];
        _addDataButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_addDataButton setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_spacingView addSubview:_addDataButton];

    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGSize barSize = [self sizeThatFits:CGSizeMake(self.bounds.size.width, 0)];
    _spacingView.frame = CGRectMake(0, 0, barSize.width, barSize.height);
}

-(void)updateConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_clientName, _clientImageView, _heightStackView, _ageStackView, _editDataButton, _addDataButton, _spacingView);
    
    
    NSArray *horizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_clientImageView(32)]-[_clientName]-[_heightStackView]-[_ageStackView]-[_editDataButton(32)]-(10)-[_addDataButton(32)]-|"
                                                                            options:NSLayoutFormatAlignAllCenterY
                                                                            metrics:nil
                                                                              views:views];
    
    NSArray *verticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_clientName(==_clientImageView)]-|"
                                                                          options:NSLayoutFormatAlignAllCenterX
                                                                          metrics:nil
                                                                            views:views];
    NSArray *clientImageVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_clientImageView(32)]-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views];
    
    NSArray *addDataButtonVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_addDataButton(32)]-|"
                                                                                   options:NSLayoutFormatAlignAllCenterX
                                                                                   metrics:nil
                                                                                     views:views];
    NSArray *editDataButtonVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_editDataButton(32)]-|"
                                                                                   options:NSLayoutFormatAlignAllCenterX
                                                                                   metrics:nil
                                                                                     views:views];
    
    [_spacingView addConstraints:horizontalLayout];
    [_spacingView addConstraints:verticalLayout];
    [_spacingView addConstraints:clientImageVerticalLayout];
    [_spacingView addConstraints:addDataButtonVerticalLayout];
    [_spacingView addConstraints:editDataButtonVerticalLayout];
    
    NSArray *spacingViewHorizontalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_spacingView]|"
                                                                                   options:NSLayoutFormatAlignAllLeft
                                                                                   metrics:nil
                                                                                     views:views];
    NSArray *spacingViewVerticalLayout = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_spacingView]|"
                                                                                   options:NSLayoutFormatAlignAllLeft
                                                                                   metrics:nil
                                                                                     views:views];
    [self addConstraints:spacingViewHorizontalLayout];
    [self addConstraints:spacingViewVerticalLayout];
    
    [super updateConstraints];

}

@end
