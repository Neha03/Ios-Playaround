//
//  SliderViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()
{
    UISlider* mySlider;
    UILabel* myLbl;
}
@end

@implementation SliderViewController

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
    self.title = @"Slider";
    CGRect frame = CGRectMake(0.0, 40.0, 300.0, 10.0);
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0.0;
    slider.maximumValue = 50.0;
    slider.continuous = YES;
    slider.value = 25.0;
    [self.view addSubview:slider];
    
    myLbl= [[UILabel alloc]initWithFrame:CGRectMake(80, 100, 100, 50)];
    myLbl.font =[UIFont systemFontOfSize:40];
    [self.view addSubview:myLbl];
                     
    
    
    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sliderAction:(UISlider *)sender {
    myLbl.text =  [NSString stringWithFormat:@"%d", (int)sender.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
