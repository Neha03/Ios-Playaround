//
//  ActionSheetViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()<UIActionSheetDelegate>{
    UILabel* rateLabel;
    UIButton* BtnAction;
}

@end

@implementation ActionSheetViewController

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
    self.title = @"ActionSheet";
    rateLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 120, 220, 40)];
   // rateLabel.backgroundColor =[UIColor blueColor];
    rateLabel.font =[UIFont systemFontOfSize:20];
    [self.view addSubview:rateLabel];
    
    BtnAction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [BtnAction setTitle:@"Action" forState:UIControlStateNormal];
    [BtnAction addTarget:self action:@selector(displayActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    BtnAction.frame = CGRectMake(100, 50, 100, 50);
    [self.view addSubview:BtnAction];

    
}

- (void)displayActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"Title"
                                      delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"Red", @"Green",
                                      @"Blue", @"Black", @"white", nil];
        
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
        
        
}
    
#pragma mark UIActionSheetDelegate
    
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
    {
        switch (buttonIndex) {
            case 0:
                rateLabel.backgroundColor = [UIColor redColor];
               rateLabel.text = @"You've Selected Red.";
                break;
            case 1:
                rateLabel.backgroundColor = [UIColor greenColor];
                rateLabel.text = @"You've Selected Green.";
                break;
            case 2:
                rateLabel.backgroundColor = [UIColor blueColor];
                rateLabel.text = @"You've selected Blue .";
                break;
            case 3:
                rateLabel.backgroundColor = [UIColor blackColor];
                rateLabel.textColor =[UIColor whiteColor];
                rateLabel.text = @"You've selected Black.";
                break;
            case 4:
                rateLabel.backgroundColor = [UIColor whiteColor];
                rateLabel.textColor =[UIColor blackColor];
                rateLabel.text = @"You've selected white";
                break;
          
                
        }
        
    }

	// Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
