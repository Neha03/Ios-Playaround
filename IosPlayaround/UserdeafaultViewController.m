//
//  UserdeafaultViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "UserdeafaultViewController.h"

@interface UserdeafaultViewController ()<UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITextField* fname;
    UITextField* lname;
    UITextField* ageTextField;
    UIButton* saveBtn;
    UIButton* chooseImg;
    UIImageView* img;
}
@end

@implementation UserdeafaultViewController

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
    self.title = @"User Default";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    fname = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 50.0f, 280.0f, 31.0f)];
    fname.placeholder = @"First Name";
    fname.textColor = [UIColor blackColor];
    fname.font = [UIFont systemFontOfSize:14.0f];
    fname.borderStyle = UITextBorderStyleRoundedRect;
    fname.delegate = self;
    fname.clearButtonMode = UITextFieldViewModeWhileEditing;
    fname.returnKeyType = UIReturnKeyDone;
    fname.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
   // fname.tag = 2;
    fname.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:fname];
    
  
    
    lname = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 110.0f, 280.0f, 31.0f)];
    lname.placeholder = @"Last Name";
    lname.backgroundColor = [UIColor whiteColor];
    lname.textColor = [UIColor blackColor];
    lname.font = [UIFont systemFontOfSize:14.0f];
    lname.borderStyle = UITextBorderStyleRoundedRect;
    lname.delegate = self;
    lname.clearButtonMode = UITextFieldViewModeWhileEditing;
    lname.returnKeyType = UIReturnKeyDone;
    lname.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
   // lname.tag = 2;
    lname.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:lname];

    
    
    ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 160.0f, 280.0f, 31.0f)];
    ageTextField.placeholder = @"Age";
    ageTextField.backgroundColor = [UIColor whiteColor];
    ageTextField.textColor = [UIColor blackColor];
    ageTextField.font = [UIFont systemFontOfSize:14.0f];
    ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    ageTextField.delegate = self;
    ageTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    ageTextField.returnKeyType = UIReturnKeyDone;
    ageTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  //  age.tag = 2;
    ageTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:ageTextField];

    
    saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(SaveBtn:) forControlEvents:UIControlEventTouchUpInside];
    saveBtn.frame = CGRectMake(180, 220, 70, 50);
    [self.view addSubview:saveBtn];

    chooseImg = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [chooseImg setTitle:@"Choose Image" forState:UIControlStateNormal];
    [chooseImg addTarget:self action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
    chooseImg.frame = CGRectMake(160, 285, 120, 50);
    [self.view addSubview:chooseImg];
    
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(20,220, 100, 120)];
    img.backgroundColor = [UIColor whiteColor];
   // [imageView setImage:[UIImage imageNamed:@"background.png"]];
    [self.view addSubview:img];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstName = [defaults objectForKey:@"firstName"];
    NSString *lastName = [defaults objectForKey:@"lastname"];
    int age = [defaults integerForKey:@"age"];
    NSString *ageString = [NSString stringWithFormat:@"%i",age];
    NSData *imageData = [defaults dataForKey:@"image"];
    UIImage *contactImage = [UIImage imageWithData:imageData];
    // Update the UI elements with the saved data
    fname.text = firstName;
    lname.text = lastName;
    ageTextField.text = ageString;
    img.image = contactImage;
    
  	// Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chooseImage:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init] ;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
   [self presentViewController:picker animated:YES completion:nil];
}

    
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    img.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)SaveBtn:(id)sender
{
    // Hide the keyboard
    [fname resignFirstResponder];
    [lname resignFirstResponder];
    [ageTextField resignFirstResponder];
    // Create strings and integer to store the text info
    NSString *firstName = [fname text];
    NSString *lastName  = [lname text];
    int age = [[ageTextField text] integerValue];
    // Create instances of NSData
    UIImage *contactImage = img.image;
    NSData *imageData = UIImageJPEGRepresentation(contactImage, 100);
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:firstName forKey:@"firstName"];
    [defaults setObject:lastName forKey:@"lastname"];
    [defaults setInteger:age forKey:@"age"];
    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];
//    fname.text =@"";
//    lname.text =@"";
//    ageTextField.text =@"";
    NSLog(@"Data saved");
}

@end
