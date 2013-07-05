//
//  ExploreViewController.h
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreViewController : UIViewController

/*********************Properties******************************/

@property (weak, nonatomic) IBOutlet UIButton *rateButton1;
@property (weak, nonatomic) IBOutlet UIButton *rateButton2;

/*************************************************************/

/**
 *  Name: ratePicture
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert allowing the user to rate the
 *           corresponding picture with 1, 2, or 3 stars
 */
- (IBAction)ratePicture:(id)sender;

@end
