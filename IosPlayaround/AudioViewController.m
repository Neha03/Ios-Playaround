//
//  AudioViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 07/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "AudioViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AudioViewController ()<AVAudioPlayerDelegate>
{
    AVAudioPlayer* player;
}
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) UIButton* playBtn;;
@property (nonatomic, strong) NSTimer *timer;



- (void)stopSound:(id)sender;
- (void)playOrPauseSound:(id)sender;

@end

@implementation AudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Audio";
    self.view.backgroundColor = [UIColor whiteColor];
    self.playBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.playBtn setTitle:@"Play" forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    self.playBtn.frame = CGRectMake(120, 340, 70, 50);
    [self.view addSubview:self.playBtn];

}
    
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playAudio:(id)sender;
{
    NSString* path= [[NSBundle mainBundle]pathForResource:@"Balam_Pichkari_-_www.DjPunjab.Com" ofType:@"mp3"];
    NSURL * audioURL = [NSURL fileURLWithPath:path];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:audioURL error:nil];
    [player play];
	// Do any additional setup after loading the view.



}
@end
