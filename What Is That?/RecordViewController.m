//
// GFSWViewController.m
// Record
//
// Created by lab on 4/7/13.
// Copyright (c) 2013 Team GFSW. All rights reserved.
//

#import "RecordViewController.h"


@interface RecordViewController ()
@end

@implementation RecordViewController

@synthesize playButton, recordButton;


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
        self.title = NSLocalizedString(@"Record", @"Record");
        self.tabBarItem.image = [UIImage imageNamed:@"recordIcon30"];
    }
    return self;
}

/**
 *  Name: viewDidLoad
 *  Parameters: none
 *  Return: none
 *  Modified: enables playButton and sets progress bar color, as well as
 *            setting up the audioRecorder
 *  Purpose: sets up all the functionality for the recording view
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    soundRecorded = NO;
    
    self.playButton.enabled = YES;
    self.playButton.hidden = NO;
    //self.stopButton.enabled = NO;
    
    self.progressBar.trackTintColor = [UIColor darkGrayColor];
    self.progressBar.progressTintColor = [UIColor lightGrayColor];
    
    
    NSArray *dirPaths;
    NSString *docsDir;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.05f target: self selector: @selector(updateProgress:) userInfo: nil repeats: YES];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"sound.caf"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    self->audioRecorder = [[AVAudioRecorder alloc]
                           initWithURL:soundFileURL
                           settings:recordSettings
                           error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [audioRecorder prepareToRecord];
    }
}

/**
 *  Name: viewDidUnload
 *  Parameters: none
 *  Return: none
 *  Modified: audioPlay, audioRecorder, stopButton, recordButton,
 *            playButton set to nil
 *  Purpose: releases properties
 */
- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    audioPlayer = nil;
    audioRecorder = nil;
    self.stopButton = nil;
    recordButton = nil;
    playButton = nil;
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
 *  Name: recordAudio
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: progressDir set to 1, changes color of progress bar, and
 *            sets the audioRecorder to record
 *  Purpose: sets up everything needed to record sound and records up to
 *           5 seconds of audio
 */
-(void) recordAudio:(id)sender
{
    progressDir = 1;
    
    self.progressBar.trackTintColor = [UIColor darkGrayColor];
    self.progressBar.progressTintColor = [UIColor lightGrayColor];
    
    recordButton.frame = CGRectMake(131,87,76,44);
    playButton.frame = CGRectMake(131,138,76,44);
    if (!audioRecorder.recording)
    {
        soundRecorded = YES;
        testProgress = 0;
        playButton.enabled = YES;
        playButton.hidden = NO;
        //self.stopButton.enabled = YES;
        
        [recordButton setTitle:@"Stop" forState:UIControlStateNormal];
        //[audioRecorder recordForDuration:5];
        [audioRecorder record];
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(stop:) userInfo:nil repeats:NO];
        [timer fire];
    }else{
        //self.stopButton.enabled = NO;
        playButton.enabled = YES;
        recordButton.enabled = YES;
        if(playButton.hidden){
            playButton.hidden = NO;
        }
        [recordButton setTitle:@"Record" forState:UIControlStateNormal];
        [audioRecorder stop];
    }
}

/**
 *  Name: playAudio
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: plays the recorded audio back to the user
 */
-(void) playAudio:(id)sender
{
    if (!audioRecorder.recording)
    {
        //self.stopButton.enabled = YES;
        recordButton.enabled = NO;
        
        NSError *error;
        
        
        self.progressBar.trackTintColor = [UIColor lightGrayColor];
        self.progressBar.progressTintColor = [UIColor blackColor];
        
        [timer fire];
        
        audioPlayer = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:audioRecorder.url
                       error:&error];
        
        audioPlayer.delegate = self;
        
        if (error)
            NSLog(@"Error: %@",
                  [error localizedDescription]);
        else
            [audioPlayer play];
    }
}

/**
 *  Name: sendSound
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert telling the user the sound has been
 *           sent if they recorded a sound, or if they haven't, tells
 *           them that they didn't record a sound
 */
- (IBAction)sendSound:(id)sender
{
    if (soundRecorded){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Sending!"
                              message:@"Your sound is sending to a friend!"
                              delegate:nil
                              cancelButtonTitle:@"Great!"
                              otherButtonTitles:nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Uh oh!"
                              message:@"There is no sound to send!"
                              delegate:nil
                              cancelButtonTitle:@"Oops!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

/**
 *  Name: stop
 *  Parameters: sender -- id object that sent the request
 *  Return: none
 *  Modified: enables the record and play buttons
 *  Purpose: stops recording if the user is currently recording,
 *           or stops playback if the user is currently playing
 *           their recorded sound back to themselves
 */
-(void)stop:(id)sender
{
    if (audioRecorder.recording)
    {
        //self.stopButton.enabled = NO;
        playButton.enabled = YES;
        recordButton.enabled = YES;
        [recordButton setTitle:@"Record" forState:UIControlStateNormal];
        [audioRecorder stop];
    } else if (audioPlayer.playing) {
        [audioPlayer stop];
    }
}

/**
 *  Name: updateProgress
 *  Parameters: sender -- id object that sent the request
 *  Return: none
 *  Modified: updates the value of testProgress
 *  Purpose: repeatedly called while recording or playing back
 *           a sound, and updates the progress bar accordingly
 */
- (void)updateProgress:(id)sender
{
	if (audioRecorder.recording || audioPlayer.playing){
        testProgress += (0.01f * progressDir) ;
        [self.progressBar setProgress: testProgress];
    }
    if (testProgress > 1){
        //[timer invalidate];
        testProgress = 0;
        [self.progressBar setProgress: 0.0f];
    }
}

/**
 *  Name: audioPlayerDidFinishRecording: successfully:
 *  Parameters: AVAudioPlayer *recorder, BOOL flag
 *  Return: none
 *  Modified: none
 *  Purpose: called when recording has finished
 */
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    //do nothing
}

/**
 *  Name: audioPlayerDidFinishPlaying: successfully:
 *  Parameters: AVAudioPlayer *player, BOOL flag
 *  Return: none
 *  Modified: enables the recordButton
 *  Purpose: called when playback has finished
 */
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    recordButton.enabled = YES;
}

/**
 *  Name: audioPlayerEncodeErrorDidOccur: error:
 *  Parameters: AVAudioPlayer *player, NSError *error
 *  Return: none
 *  Modified: none
 *  Purpose: prints whether an audio encoding error occurred
 */
-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}

/**
 *  Name: audioPlayerDecodeErrorDidOccur: error:
 *  Parameters: AVAudioPlayer *player, NSError *error
 *  Return: none
 *  Modified: none
 *  Purpose: prints whether an audio decoding error occurred
 */
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"Decode Error occurred");
}

@end
