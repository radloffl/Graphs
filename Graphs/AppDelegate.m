//
//  AppDelegate.m
//  Graphs
//
//  Created by Logan on 8/11/16.
//  Copyright © 2016 Logan Radloff. All rights reserved.
//

#import "AppDelegate.h"
#import "ClientStatisticsViewController.h"
#import "ClientTableViewController.h"
#import "UIColor+DefaultThemeColors.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
    UIViewController *dashBoardViewController = [[UIViewController alloc] init];
    
    ClientTableViewController *tvc = [[ClientTableViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:tvc];
    
    NSArray *controllersForSplitView = @[nvc];
    splitViewController.viewControllers = controllersForSplitView;
    splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    
    tabBarController.viewControllers = @[splitViewController, dashBoardViewController];
    
    //ClientTabBarImage
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *clientTabBarBodyPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(3, 11.5, 10, 12.5) cornerRadius:2];
    UIBezierPath *clientTabBarHeadPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(4.5, 5, 7.5, 7.5)];
    
    UIBezierPath *clientTabBarBodyPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(15, 7.5, 8, 10.5) cornerRadius:2];
    UIBezierPath *clientTabBarHeadPath2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(16, 1.5, 6.5, 6.5)];
    
    [[UIColor primaryIconColor] setFill];
    [clientTabBarHeadPath fill];
    [clientTabBarBodyPath fill];
    [clientTabBarHeadPath2 fill];
    [clientTabBarBodyPath2 fill];
    UIImage *clientTabBarImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [[UIColor primaryIconColor] setFill];
    [clientTabBarHeadPath fill];
    [clientTabBarBodyPath fill];
    [clientTabBarHeadPath2 fill];
    [clientTabBarBodyPath2 fill];
    UIImage *clientTabBarImageSelected = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    //
    
    splitViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Clients" image:clientTabBarImage selectedImage:clientTabBarImageSelected];
    
    //DashboardTabBarImage
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(25, 25), NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *dashBoardMeterBackground = [UIBezierPath bezierPathWithArcCenter:CGPointMake(12.5, 20) radius:12.5 startAngle:(M_PI*140)/180.0 endAngle:(M_PI*40)/180.0 clockwise:YES];
    UIBezierPath *dashBoardMeterDialCirlce = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 17.5, 5, 5)];
    UIBezierPath *dashBoardMeterLine = [UIBezierPath bezierPath];
    [dashBoardMeterLine moveToPoint:CGPointMake(12.5, 20)];
    [dashBoardMeterLine addLineToPoint:CGPointMake(10, 10)];
    
    [[UIColor primaryIconColor] setFill];
    [dashBoardMeterBackground fill];
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    [dashBoardMeterDialCirlce fill];
    [dashBoardMeterLine stroke];
    UIImage *dashBoardTabBarImage = UIGraphicsGetImageFromCurrentImageContext();
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    [[UIColor primaryIconColor] setFill];
    [dashBoardMeterBackground fill];
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    [dashBoardMeterDialCirlce fill];
    [dashBoardMeterLine stroke];
    UIImage *dashBoardTabBarImageSelected = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    //
    
    dashBoardViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Dashboard" image:dashBoardTabBarImage selectedImage:dashBoardTabBarImageSelected];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
