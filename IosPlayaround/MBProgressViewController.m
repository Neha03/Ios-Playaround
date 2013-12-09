//
//  MBProgressViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "MBProgressViewController.h"
#import "MBProgressHUD.h"
@interface MBProgressViewController ()
{
    MBProgressHUD *HUD;
}
@end

@implementation MBProgressViewController

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
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Loading....";
    HUD.detailsLabelText = @"Wait";
    HUD.mode = MBProgressHUDAnimationZoom;
    [self.view addSubview:HUD];
    [HUD showWhileExecuting:@selector(loading) onTarget:self withObject:nil animated:YES];
    
     
    
}
    
- (void)loading {
    float progress = 0.0;
    while (progress < 1.0) {
        progress += 0.01;
        HUD.progress = progress;
        usleep(100000);
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
