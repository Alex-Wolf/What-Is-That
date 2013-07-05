//
//  SecondViewController.h
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawViewController : UIViewController <UIActionSheetDelegate> {
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

/*********************Properties******************************/

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (weak, nonatomic) IBOutlet UIView *settingsMenu;
@property (weak, nonatomic) IBOutlet UIView *settingsBox;
@property (weak, nonatomic) IBOutlet UIButton *RGBButt;

@property CGFloat brush;
@property CGFloat opacity;

@property (weak, nonatomic) IBOutlet UILabel *brushLabel;
@property (weak, nonatomic) IBOutlet UILabel *opacityLabel;
@property (weak, nonatomic) IBOutlet UISlider *brushSlider;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;

@property (weak, nonatomic) IBOutlet UILabel *rgbText;
@property (weak, nonatomic) IBOutlet UISlider *rgbSlider1;
@property (weak, nonatomic) IBOutlet UISlider *rgbSlider2;
@property (weak, nonatomic) IBOutlet UISlider *rgbSlider3;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;


@property (weak, nonatomic) IBOutlet UIButton *blackPencil;
@property (weak, nonatomic) IBOutlet UIButton *greyPencil;
@property (weak, nonatomic) IBOutlet UIButton *redPencil;
@property (weak, nonatomic) IBOutlet UIButton *bluePencil;
@property (weak, nonatomic) IBOutlet UIButton *darkGreenPencil;
@property (weak, nonatomic) IBOutlet UIButton *lightGreenPencil;
@property (weak, nonatomic) IBOutlet UIButton *lightBluePencil;
@property (weak, nonatomic) IBOutlet UIButton *brownPencil;
@property (weak, nonatomic) IBOutlet UIButton *darkOrangePencil;
@property (weak, nonatomic) IBOutlet UIButton *yellowPencil;
@property (weak, nonatomic) IBOutlet UIButton *eraser;

@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;

@property (strong, nonatomic) NSArray *pencils;

/*************************************************************/

/**
 *  Name: sliderChanged
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: sliders change brush size, opacity, and rgb color
 *  Purpose: allows the user to have more control over the drawing tool
 */
- (IBAction)sliderChanged:(id)sender;

/**
 *  Name: pencilPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: current rgb values are drawn to the tempImage
 *  Purpose: allows the user to actually draw on the screen
 */
- (IBAction)pencilPressed:(id)sender;

/**
 *  Name: eraserPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: color is drawn on screen to match background color,
 *            effectively erasing other colors
 *  Purpose: allows the user to erase things on the screen
 */
- (IBAction)eraserPressed:(id)sender;

/**
 *  Name: showOptions
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: causes an action sheet to come up, giving the user
 *           multiple options including clearing the drawing and
 *           saving their picture to the camera roll, among others
 */
- (IBAction)showOptions:(id)sender;

/**
 *  Name: showSettings
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: causes the menu to pop up that shows the brush size,
 *           opacity, and rgb values, and the corresponding sliders.
 *           Hides this menu if it is already showing.
 */
- (IBAction)showSettings:(id)sender;

/**
 *  Name: RGBOpSwitch
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: switches the menu currently showing
 *  Purpose: if the brush size and opacity menu is showing, it changes
 *           to the rgb menu, and vice versa
 */
- (IBAction)RGBOpSwitch:(id)sender;


@end
