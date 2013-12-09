//
//  PagingViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "PagingViewController.h"

@interface PagingViewController ()
{
    NSMutableArray* images;
}

@property(strong,nonatomic)    UIScrollView* scrollView;

@end

@implementation PagingViewController
@synthesize  scrollView;
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
    self.title =@"Paging";
    images = [[NSMutableArray alloc]initWithObjects:@"IMG_0150.jpg", @"IMG_0154.jpg", @"IMG_0163.jpg", @"IMG_0169.jpg", @"IMG_0170.jpg", @"IMG_0173.jpg", @"IMG_0174.jpg", @"IMG_0180.jpg", @"IMG_0181.jpg", @"IMG_0184.jpg", nil];
    
    
    scrollView = [[UIScrollView alloc]init];
    
    scrollView.frame=CGRectMake(0.0, 0.0, 320, 480);

   scrollView.showsHorizontalScrollIndicator = YES;
   scrollView.backgroundColor=[UIColor clearColor];
   scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * images.count, self.scrollView.frame.size.height);
    [self.view addSubview:scrollView];

    for (int i = 0; i < images.count; i++) {
        
        CGRect frame;
        frame.origin.x = scrollView.frame.size.width * i;
        frame.size = scrollView.frame.size;
        
        scrollView.pagingEnabled = YES;
                
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        self.view.backgroundColor=[UIColor blueColor];

        subview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[images objectAtIndex:i]]];
        NSLog(@"%@",[images objectAtIndex:i]);
      //  subview.backgroundColor = [UIColor colorWithPatternImage:[images objectAtIndex:i]];
        [self.scrollView addSubview:subview];
    }
    
}

    

	// Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
