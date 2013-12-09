//
//  TwitterDemoViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 09/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "TwitterDemoViewController.h"
#import "Social/Social.h"

@interface TwitterDemoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIButton* twitterBtn;
    UIButton* chooseImgBtn;
    UIImageView* img;
}

@end

@implementation TwitterDemoViewController

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
    self.title =@"Twitter Demo";
    twitterBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [twitterBtn setTitle:@"Tweet" forState:UIControlStateNormal];
    [twitterBtn addTarget:self action:@selector(tweetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    twitterBtn.frame = CGRectMake(200, 340, 70, 50);
    [self.view addSubview:twitterBtn];
    

    chooseImgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [chooseImgBtn setTitle:@"Choose Image" forState:UIControlStateNormal];
    [chooseImgBtn addTarget:self action:@selector(chooseImagePressed:) forControlEvents:UIControlEventTouchUpInside];
    chooseImgBtn.frame = CGRectMake(50, 340, 130, 50);
    [self.view addSubview:chooseImgBtn];
    
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(50,120, 200, 180)];
    img.backgroundColor = [UIColor whiteColor];
    // [imageView setImage:[UIImage imageNamed:@"background.png"]];
    [self.view addSubview:img];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tweetButtonPressed:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Look at this nice picture!"];
        
        [tweetSheet addImage:img.image];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
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

- (IBAction)chooseImagePressed:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init] ;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}



#pragma mark

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    img.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
