//
//  GraphPoint.h
//  Graphs
//
//  Created by Logan on 8/18/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GraphPoint : NSObject

@property NSNumber *x;
@property NSNumber *y;
@property UIColor* color;
@property NSInteger radius;

-(instancetype)initWithXValue: (NSNumber *)x AndYValue: (NSNumber *)y;

@end
