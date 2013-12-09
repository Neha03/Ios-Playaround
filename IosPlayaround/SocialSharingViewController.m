//
//  SocialSharingViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "SocialSharingViewController.h"

@interface SocialSharingViewController ()
{
    UIAlertView* pushAlert;
}
@property (nonatomic, strong)  UITextField *textField;
@property (nonatomic, strong)  UIButton *shareButton;
@property (nonatomic, strong) UIActivityViewController *activityViewController;

- (void)shareButtonPressed:(id)sender;
@end

@implementation SocialSharingViewController

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
    self.title = @"Social Sharing";
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 31.0f)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.font = [UIFont systemFontOfSize:14.0f];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing ;
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    

    self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.shareButton.frame = CGRectMake(100, 120, 100, 50);
    [self.view addSubview:self.shareButton];

// Do any additional setup after loading the view.
}

- (void)shareButtonPressed:(id)sender
{
//    if ([self.textField.text isEqualToString:@""])
//    {
//      pushAlert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"اPlease fill Text" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//    }
    
    NSCharacterSet *_whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *_trimmedNameString = [self.textField.text stringByTrimmingCharactersInSet:_whitespace];
    if (_trimmedNameString.length==0)
    {
        pushAlert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Plese fill text" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [pushAlert show];
    }
    else{
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.textField.text] applicationActivities:nil];
    [self presentViewController:self.activityViewController animated:YES completion:nil];
   }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
