//
//  ExploreViewController.m
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController


/**
 *  Name: initWithNibName
 *  Parameters: NSString* nibName, NSBundle* nibBundle
 *  Return: id
 *  Modified: initializes class
 *  Purpose: initializes class
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Explore", @"Explore");
        self.tabBarItem.image = [UIImage imageNamed:@"exploreIcon30"];
    }
    return self;
}

/**
 *  Name: viewDidLoad
 *  Parameters: none
 *  Return: none
 *  Modified: none
 *  Purpose: calls super viewDidLoad on load
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 *  Name: didReceiveMemoryWarning
 *  Parameters: none
 *  Return: none
 *  Modified: none
 *  Purpose: call super didReceiveMemoryWarning
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: ratePicture
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert allowing the user to rate the
 *           corresponding picture with 1, 2, or 3 stars
 */
- (IBAction)ratePicture:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Rate It!"
                          message:@"Click a button to rate the drawing!"
                          delegate:nil
                          cancelButtonTitle:@"No Rating"
                          otherButtonTitles:@"3 Stars", @"2 Stars", @"1 Star", nil];
    [alert show];
    
}
@end
