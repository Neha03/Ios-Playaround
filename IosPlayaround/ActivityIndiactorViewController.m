//
//  ActivityIndiactorViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "ActivityIndiactorViewController.h"

@interface ActivityIndiactorViewController ()
{
    UIButton *startBtn;
    UIButton *stopBtn;
}
@property(strong,nonatomic)UIActivityIndicatorView* activityIndicatorView;

@end

@implementation ActivityIndiactorViewController

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
    
    self.view.backgroundColor = [UIColor blackColor];
    self.title =@"Activity Indicator";
    
   /*****************************Start button *************************************/
    
    startBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startBtn.Frame = CGRectMake(20, 100, 80, 50);
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    
    /*****************************Stop button *************************************/

    stopBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopBtn.Frame = CGRectMake(210, 100, 80, 50);
    [stopBtn setTitle:@"Stop" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stopClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    /******************* Activity indiactor *************************************/

    CGRect frame = CGRectMake (120.0, 185.0, 80, 80);
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    
    [self.view addSubview:self.activityIndicatorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)startClicked:(id)sender {
    [self.activityIndicatorView startAnimating];
}

- (void)stopClicked:(id)sender {
    [self.activityIndicatorView stopAnimating];
}

	// Do any additional setup after loading the view.




@end
