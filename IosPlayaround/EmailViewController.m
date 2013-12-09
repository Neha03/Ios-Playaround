//
//  EmailViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "EmailViewController.h"


@interface EmailViewController ()<MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>


@property (strong, nonatomic)  UITextField *subject;
@property (strong, nonatomic)  UITextView *messageBody;
@property (strong, nonatomic)  UIButton *mailButton;

@end

@implementation EmailViewController

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
    self.title =@"Email Demo";
    self.view.backgroundColor =[UIColor purpleColor];
//    self.subject = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 260, 50)];
//    self.subject.placeholder = @"subject";
//    self.subject.delegate = self;
//    [self.view addSubview:self.subject];
    
    
    self.subject = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 50.0f, 280.0f, 31.0f)];

    self.subject.placeholder = @"Subject";
    self.subject.backgroundColor = [UIColor whiteColor];
    self.subject.textColor = [UIColor blackColor];
    self.subject.font = [UIFont systemFontOfSize:14.0f];
    self.subject.borderStyle = UITextBorderStyleRoundedRect;
    self.subject.delegate = self;
    self.subject.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.subject.returnKeyType = UIReturnKeyDone;
    self.subject.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.subject.tag = 2;
    self.subject.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.subject];
    
    self.messageBody = [[UITextView alloc] initWithFrame:CGRectMake(20.0f, 100.0f, 280.0f, 200.0f)];
    [self.messageBody setFont:[UIFont systemFontOfSize:14.0f]];
    self.messageBody.backgroundColor = [UIColor whiteColor];
    self.messageBody.userInteractionEnabled = YES;
    self.messageBody.delegate =self;
    [self.view addSubview:self.messageBody];


    self.mailButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.mailButton setTitle:@"Send" forState:UIControlStateNormal];
    [self.mailButton addTarget:self action:@selector(sendMail) forControlEvents:UIControlEventTouchUpInside];
    self.mailButton.frame = CGRectMake(120, 340, 70, 50);
    [self.view addSubview:self.mailButton];
     

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendMail
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate  = self;
    
    [picker setSubject:self.subject.text];
    
    [picker setMessageBody:self.messageBody.text isHTML:YES];
    
    picker.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.subject resignFirstResponder];
    return NO;
}


- (IBAction)copyText:(id)sender {
    NSString *copyString = self.subject.text;
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = copyString;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
