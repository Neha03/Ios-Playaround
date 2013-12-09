//
//  PopViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 07/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "PopViewController.h"
#import "PopoverViewController.h"
@interface PopViewController ()


@property (nonatomic,strong) UIPopoverController *popOver;
@property (nonatomic,strong) UIButton *popBtn;


- (void)showPopover:(UIButton *)sender;

@end

@implementation PopViewController

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
    self.title =@"PopOver";
    self.popBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.popBtn setTitle:@"Pop Over" forState:UIControlStateNormal];
    [self.popBtn addTarget:self action:@selector(showPopover:) forControlEvents:UIControlEventTouchUpInside];
    self.popBtn.frame = CGRectMake(120, 340, 70, 50);
    [self.view addSubview:self.popBtn];

    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPopover:(UIButton *)sender {
    
    PopoverViewController *PopoverView =[[PopoverViewController alloc] init];
    self.popOver =[[UIPopoverController alloc] initWithContentViewController:PopoverView];
    [self.popOver presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}


@end
