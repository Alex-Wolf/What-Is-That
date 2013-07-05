//
//  AppDelegate.m
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import "AppDelegate.h"

#import "MainMenuViewController.h"

#import "DrawViewController.h"

#import "RecordViewController.h"

#import "ExploreViewController.h"

@implementation AppDelegate

/**
 *  Name: application: didFinishLaunchingWithOptions:
 *  Parameters: UIApplication *application, NSDictionary *launchOptions
 *  Return: BOOL
 *  Modified: initializes window and tabBarController
 *  Purpose: initializes class
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[MainMenuViewController alloc] initWithNibName:@"MainMenuViewController" bundle:nil];
    UIViewController *viewController2 = [[DrawViewController alloc] initWithNibName:@"DrawViewController" bundle:nil];
    UIViewController *viewController3 = [[RecordViewController alloc] initWithNibName:@"RecordViewController" bundle:nil];
    UIViewController *viewController4 = [[ExploreViewController alloc] initWithNibName:@"ExploreViewController" bundle:nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1, viewController2, viewController3, viewController4];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  Name: applicationWillResignActive
 *  Parameters: UIApplication *application
 *  Return: none
 *  Modified: none
 *  Purpose: none
 */
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

/**
 *  Name: applicationDidEnterBackground
 *  Parameters: UIApplication *application
 *  Return: none
 *  Modified: none
 *  Purpose: none
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

/**
 *  Name: applicationWillEnterForeground
 *  Parameters: UIApplication *application
 *  Return: none
 *  Modified: none
 *  Purpose: none
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

/**
 *  Name: applicationDidBecomeActive
 *  Parameters: UIApplication *application
 *  Return: none
 *  Modified: none
 *  Purpose: none
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

/**
 *  Name: applicationWillTerminate
 *  Parameters: UIApplication *application
 *  Return: none
 *  Modified: none
 *  Purpose: none
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
