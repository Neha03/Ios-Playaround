//
//  FacebookViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 09/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "FacebookViewController.h"
#import "social/social.h"

@interface FacebookViewController ()
{
    UIButton* FbBtn;
}
@end

@implementation FacebookViewController

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
    self.title =@"Facebook Demo";
    UIButton* fbBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fbBtn setTitle:@"Post to Facebook" forState:UIControlStateNormal];
    [fbBtn addTarget:self action:@selector(fbClicked:) forControlEvents:UIControlEventTouchUpInside];
    fbBtn.frame = CGRectMake(80, 300, 150, 50);
    [self.view addSubview:fbBtn];
	// Do any additional setup after loading the view.
}

-(void)fbClicked:(id)sender{
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            SLComposeViewController *FBPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
          
            
            [self presentViewController:FBPost animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Error"
                                      message:@"please setup Twitter"
                                      delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
        }
    }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
