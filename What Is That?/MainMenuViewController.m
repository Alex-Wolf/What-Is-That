//
//  FirstViewController.m
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import "MainMenuViewController.h"

#import "Social/Social.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController


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
        self.title = NSLocalizedString(@"Main", @"Main");
        self.tabBarItem.image = [UIImage imageNamed:@"homeIcon30"];
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
	// Do any additional setup after loading the view, typically from a nib.
}

/**
 *  Name: loadView
 *  Parameters: none
 *  Return: none
 *  Modified: adds a scroll view to the main page view
 *  Purpose: creates the scroll view for the main page
 */
- (void)loadView
{
    [super loadView];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.scrollEnabled = YES;
    scroll.contentSize = CGSizeMake(320, 800);
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aboutScreen.png"]];
    [theView addSubview:imageView];
    [scroll addSubview:theView];
    [self.view addSubview:scroll];
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

@end
