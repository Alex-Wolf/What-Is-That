//
//  SecondViewController.m
//  What Is That?
//
//  Created by Alex Wolf on 4/7/13.
//  Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import "DrawViewController.h"

@interface DrawViewController ()

@end

@implementation DrawViewController

@synthesize brush;
@synthesize opacity;
@synthesize red;
@synthesize green;
@synthesize blue;


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
        self.title = NSLocalizedString(@"Draw", @"Draw");
        self.tabBarItem.image = [UIImage imageNamed:@"drawIcon30"];
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
    
    self.pencils = @[self.blackPencil, self.greyPencil, self.redPencil, self.bluePencil, self.darkGreenPencil, self.lightBluePencil, self.lightGreenPencil, self.brownPencil, self.darkOrangePencil, self.yellowPencil, self.eraser];
    
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 10.0;
    opacity = 1.0;
    
    self.settingsMenu.hidden = YES;
    self.settingsBox.hidden = YES;
    
    self.brushLabel.hidden = YES;
    self.opacityLabel.hidden = YES;
    self.brushSlider.hidden = YES;
    self.opacitySlider.hidden = YES;
    self.brushValueLabel.hidden = YES;
    self.opacityValueLabel.hidden = YES;
    self.brushPreview.hidden = YES;
    //self.opacityPreview.hidden = YES;
    
    self.rgbText.hidden = YES;
    self.rgbSlider1.hidden = YES;
    self.rgbSlider2.hidden = YES;
    self.rgbSlider3.hidden = YES;
    self.redLabel.hidden = YES;
    self.greenLabel.hidden = YES;
    self.blueLabel.hidden = YES;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
 *  Name: sliderChanged
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: sliders change brush size, opacity, and rgb color
 *  Purpose: allows the user to have more control over the drawing tool
 */
- (IBAction)sliderChanged:(id)sender {
    
    UISlider * changedSlider = (UISlider*)sender;
    
    if(changedSlider == self.brushSlider) {
        
        self.brush = self.brushSlider.value;
        self.brushValueLabel.text = [NSString stringWithFormat:@"%.1f", self.brush];
        
    }
    else if(changedSlider == self.opacitySlider) {
        
        self.opacity = self.opacitySlider.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f", self.opacity];
    }
    else if(changedSlider == self.rgbSlider1) {
        
        self.red = self.rgbSlider1.value/255.0;
        self.redLabel.text = [NSString stringWithFormat:@"R: %d", (int)self.rgbSlider1.value];
        
    }
    else if(changedSlider == self.rgbSlider2){
        
        self.green = self.rgbSlider2.value/255.0;
        self.greenLabel.text = [NSString stringWithFormat:@"G: %d", (int)self.rgbSlider2.value];
    }
    else if (changedSlider == self.rgbSlider3){
        
        self.blue = self.rgbSlider3.value/255.0;
        self.blueLabel.text = [NSString stringWithFormat:@"B: %d", (int)self.rgbSlider3.value];
    }
    
    UIGraphicsBeginImageContext(self.brushPreview.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(),self.brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green, self.blue, self.opacity);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.brushPreview.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

/**
 *  Name: pencilPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: current rgb values are drawn to the tempImage
 *  Purpose: allows the user to actually draw on the screen
 */
- (IBAction)pencilPressed:(id)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
        case 0:
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 255.0/255.0;
            break;
        case 1:
            red = 105.0/255.0;
            green = 105.0/255.0;
            blue = 105.0/255.0;
            break;
        case 2:
            red = 255.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 3:
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 255.0/255.0;
            break;
        case 4:
            red = 102.0/255.0;
            green = 204.0/255.0;
            blue = 0.0/255.0;
            break;
        case 5:
            red = 102.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
        case 6:
            red = 51.0/255.0;
            green = 204.0/255.0;
            blue = 255.0/255.0;
            break;
        case 7:
            red = 160.0/255.0;
            green = 82.0/255.0;
            blue = 45.0/255.0;
            break;
        case 8:
            red = 255.0/255.0;
            green = 102.0/255.0;
            blue = 0.0/255.0;
            break;
        case 9:
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
    }
}

/**
 *  Name: eraserPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: color is drawn on screen to match background color,
 *            effectively erasing other colors
 *  Purpose: allows the user to erase things on the screen
 */
- (IBAction)eraserPressed:(id)sender {
    
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    opacity = 1.0;
}

/**
 *  Name: showOptions
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: causes an action sheet to come up, giving the user
 *           multiple options including clearing the drawing and
 *           saving their picture to the camera roll, among others
 */
- (IBAction)showOptions:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Send to a friend", @"Save to camera roll", @"Clear drawing", @"Cancel", nil];
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}

/**
 *  Name: showSettings
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: causes the menu to pop up that shows the brush size,
 *           opacity, and rgb values, and the corresponding sliders.
 *           Hides this menu if it is already showing.
 */
- (IBAction)showSettings:(id)sender {
    
    if (self.settingsBox.hidden == NO){
        self.settingsMenu.hidden = YES;
        self.settingsBox.hidden = YES;
        self.brushLabel.hidden = YES;
        self.opacityLabel.hidden = YES;
        self.brushSlider.hidden = YES;
        self.opacitySlider.hidden = YES;
        self.brushValueLabel.hidden = YES;
        self.opacityValueLabel.hidden = YES;
        self.brushPreview.hidden = YES;
        //self.opacityPreview.hidden = YES;
        self.rgbText.hidden = YES;
        self.rgbSlider1.hidden = YES;
        self.rgbSlider2.hidden = YES;
        self.rgbSlider3.hidden = YES;
        self.redLabel.hidden = YES;
        self.greenLabel.hidden = YES;
        self.blueLabel.hidden = YES;
        for (int i = 0; i < [self.pencils count]; i++){
            UIButton *button = [self.pencils objectAtIndex:i];
            button.hidden = NO;
        }
        self.brush = self.brushSlider.value;
        self.opacity = self.opacitySlider.value;
    }
    else {
        
        int redIntValue = self.red * 255.0;
        self.rgbSlider1.value = redIntValue;
        [self sliderChanged:self.rgbSlider1];
        self.redLabel.text = [NSString stringWithFormat:@"R: %d", redIntValue];
        
        int greenIntValue = self.green * 255.0;
        self.rgbSlider2.value = greenIntValue;
        [self sliderChanged:self.rgbSlider2];
        self.greenLabel.text = [NSString stringWithFormat:@"G: %d", greenIntValue];
        
        int blueIntValue = self.blue * 255.0;
        self.rgbSlider3.value = blueIntValue;
        [self sliderChanged:self.rgbSlider3];
        self.blueLabel.text = [NSString stringWithFormat:@"B: %d", blueIntValue];
        
        self.brushSlider.value = self.brush;
        [self sliderChanged:self.brushSlider];
        
        self.opacitySlider.value = self.opacity;
        [self sliderChanged:self.opacitySlider];
        
        [self.RGBButt setTitle: @"RGB" forState:UIControlStateNormal];
        
        self.settingsMenu.hidden = NO;
        self.settingsBox.hidden = NO;
        self.brushLabel.hidden = NO;
        self.opacityLabel.hidden = NO;
        self.brushSlider.hidden = NO;
        self.opacitySlider.hidden = NO;
        self.brushValueLabel.hidden = NO;
        self.opacityValueLabel.hidden = NO;
        self.brushPreview.hidden = NO;
        //self.opacityPreview.hidden = NO;
        self.rgbText.hidden = YES;
        self.rgbSlider1.hidden = YES;
        self.rgbSlider2.hidden = YES;
        self.rgbSlider3.hidden = YES;
        self.redLabel.hidden = YES;
        self.greenLabel.hidden = YES;
        self.blueLabel.hidden = YES;
        
        for (int i = 0; i < [self.pencils count]; i++){
            UIButton *button = [self.pencils objectAtIndex:i];
            button.hidden = YES;
        }
    }
}

/**
 *  Name: RGBOpSwitch
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: switches the menu currently showing
 *  Purpose: if the brush size and opacity menu is showing, it changes
 *           to the rgb menu, and vice versa
 */
- (IBAction)RGBOpSwitch:(id)sender {
    if ([[self.RGBButt titleLabel].text isEqualToString:@"RGB"])
    {
        
        [self.RGBButt setTitle: @"Brush" forState:UIControlStateNormal];
        self.brushLabel.hidden = YES;
        self.opacityLabel.hidden = YES;
        self.brushSlider.hidden = YES;
        self.opacitySlider.hidden = YES;
        self.brushValueLabel.hidden = YES;
        self.opacityValueLabel.hidden = YES;
        self.rgbText.hidden = NO;
        self.rgbSlider1.hidden = NO;
        self.rgbSlider2.hidden = NO;
        self.rgbSlider3.hidden = NO;
        self.redLabel.hidden = NO;
        self.greenLabel.hidden = NO;
        self.blueLabel.hidden = NO;
        
        
    }
    else if ([[self.RGBButt titleLabel].text isEqualToString:@"Brush"])
    {
        
        [self.RGBButt setTitle: @"RGB" forState:UIControlStateNormal];
        self.brushLabel.hidden = NO;
        self.opacityLabel.hidden = NO;
        self.brushSlider.hidden = NO;
        self.opacitySlider.hidden = NO;
        self.brushValueLabel.hidden = NO;
        self.opacityValueLabel.hidden = NO;
        self.rgbText.hidden = YES;
        self.rgbSlider1.hidden = YES;
        self.rgbSlider2.hidden = YES;
        self.rgbSlider3.hidden = YES;
        self.redLabel.hidden = YES;
        self.greenLabel.hidden = YES;
        self.blueLabel.hidden = YES;
        
        
    }
}

/**
 *  Name: actionSheet: clickedButtonAtIndex:
 *  Parameters: UIActionSheet *actionSheet, NSInteger buttonIndex
 *  Return: none
 *  Modified: creates a new action sheet
 *  Purpose: creates a new action sheet with multiple options for the user
 */
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Sending!"
                              message:@"Your image is sending to a friend!"
                              delegate:nil
                              cancelButtonTitle:@"Awesome!"
                              otherButtonTitles:nil];
        [alert show];
    }
    else if (buttonIndex == 1){
        UIGraphicsBeginImageContextWithOptions(self.mainImage.bounds.size, YES,0.0);
        [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height)];
        UIImage *SaveImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(SaveImage, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    else if (buttonIndex == 2){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Reset!"
                              message:@"Your image has been reset!"
                              delegate:nil
                              cancelButtonTitle:@"Thanks!"
                              otherButtonTitles:nil];
        [alert show];
        
        self.mainImage.image = nil;
    }
}

/**
 *  Name: image: didFinishSavingWithError: contextInfo:
 *  Parameters: UIImage *image, NSError *error, void *contextInfo
 *  Return: none
 *  Modified: none
 *  Purpose: creates an alert to show whether the picture was successfully
 *           saved to the camera roll or not
 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image could not be saved. Please try again"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was successfully saved in photo album"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    }
}

/**
 *  Name: touchesBegan: withEvent:
 *  Parameters: NSSet *touches, UIEvent *event
 *  Return: none
 *  Modified: mouseSwiped, lastPoint
 *  Purpose: modifies the mouseSwiped and lastPoint properties
 *           to mark where the user began drawing on the screen
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

/**
 *  Name: touchesMoved: withEvent:
 *  Parameters: NSSet *touches, UIEvent *event
 *  Return: none
 *  Modified: mouseSwiped, lastPoint
 *  Purpose: draws on the screen as the user moves their finger
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

/**
 *  Name: touchesEnded: withEvent:
 *  Parameters: NSSet *touches UIEvent *event
 *  Return: none
 *  Modified: mainImage, tempImage
 *  Purpose: moves the current drawing from the tempImage to the mainImage,
 *           along with the alpha values associated witht the line drawn
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}


@end
