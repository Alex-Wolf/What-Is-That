//
// GFSWViewController.h
// Record
//
// Created by lab on 4/7/13.
// Copyright (c) 2013 Team GFSW. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface RecordViewController : UIViewController
<AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    UIButton *playButton;
    UIButton *recordButton;
    BOOL soundRecorded;
    
    NSTimer *timer;
    float   testProgress ;
    int     progressDir ;
}

/*********************Properties******************************/

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIProgressView *audioReplay;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

/*************************************************************/

/**
 *  Name: recordAudio
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: progressDir set to 1, changes color of progress bar, and
 *            sets the audioRecorder to record
 *  Purpose: sets up everything needed to record sound and records up to
 *           5 seconds of audio
 */
-(IBAction) recordAudio:(id)sender;

/**
 *  Name: playAudio
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: plays the recorded audio back to the user
 */
-(IBAction) playAudio:(id)sender;

/**
 *  Name: sendSound
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert telling the user the sound has been
 *           sent if they recorded a sound, or if they haven't, tells
 *           them that they didn't record a sound
 */
-(IBAction) sendSound:(id)sender;

/**
 *  Name: stop
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: enables the record and play buttons
 *  Purpose: stops recording if the user is currently recording,
 *           or stops playback if the user is currently playing
 *           their recorded sound back to themselves
 */
-(void)stop:(id)sender;

/**
 *  Name: updateProgress
 *  Parameters: sender -- id object that sent the request
 *  Return: none
 *  Modified: updates the value of testProgress
 *  Purpose: repeatedly called while recording or playing back
 *           a sound, and updates the progress bar accordingly
 */
- (void)updateProgress:(id)sender;

@end
