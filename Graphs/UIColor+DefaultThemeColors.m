//
//  UIColor+DefaultThemeColors.m
//  Graphs
//
//  Created by Logan on 9/8/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "UIColor+DefaultThemeColors.h"

@implementation UIColor (DefaultThemeColors)

+(UIColor *)goalColor {
    return [UIColor colorWithRed:40.0/255.0 green:210.0/255.0 blue:150.0/255.0 alpha:1.0];
}

+(UIColor *)mostRecentColor {
    return [UIColor colorWithRed:50.0/255.0 green:100.0/255.0 blue:210.0/255.0 alpha:1.0];
}

+(UIColor *)primaryBackgroudColor {
    return [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1.0];
}

+(UIColor *)secondaryBackgroudColor {
    return [UIColor whiteColor];
}

+(UIColor *)primaryAccentColor {
    return [UIColor colorWithRed:100.0/255.0 green:170.0/255.0 blue:250.0/255.0 alpha:1.0];
}

+(UIColor *)primaryTextColor {
    return [UIColor blackColor];
}

+(UIColor *)primaryIconColor {
    return [UIColor blackColor];
}
@end
