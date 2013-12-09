//
//  ViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "ViewController.h"
#import "ActivityIndiactorViewController.h"
#import "CollectionViewController.h"
#import "EmailViewController.h"
#import "WebViewController.h"
#import "ActionSheetViewController.h"
#import "SliderViewController.h"
#import "UserdeafaultViewController.h"
#import "MBProgressViewController.h"
#import "CarouselViewController.h"
#import "SocialSharingViewController.h"
#import "AnimationViewController.h"
#import "PagingViewController.h"
#import "AudioViewController.h"
#import "PopViewController.h"
#import "TwitterDemoViewController.h"
#import "FacebookViewController.h"



@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{

    UITableView *iosexampleTable;
    NSMutableArray *exampleArray;
    UILabel* titleLbl;
    UIScrollView* scrollView;
    ActivityIndiactorViewController *activityController;
    CollectionViewController *collectionController;
    EmailViewController* emailController;
    WebViewController *webController;
    ActionSheetViewController* actionController;
    SliderViewController* sliderController;
    UserdeafaultViewController* userController;
    MBProgressViewController* progressController;
    CarouselViewController* carouselController;
    SocialSharingViewController* socialController;
    AnimationViewController* animationController;
    PagingViewController* pagingController;
    AudioViewController* audioController;
    PopViewController* popController;
    TwitterDemoViewController* twitterController;
    FacebookViewController* facebookController;
    

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"IOS PLAYAROUND";
    self.view.backgroundColor = [UIColor whiteColor];
    scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,320, 480)];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.backgroundColor= [UIColor clearColor];
    scrollView.delegate=  self;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(320, 680);
    [self.view addSubview:scrollView];
    
    
    
    exampleArray = [[NSMutableArray alloc]initWithObjects:@"1. Activity indicator",@"2. Collection View",@"3. Email Demo",@"4. WebView",@"5. ActionSheet",@"6. Slider",@"7. User Default",@"8. MBProgressHUD",@"9. Carousel",@"10. Social Sharing", @"11. Animation",@"12. Paging",@"13. Audio",@"14. PopOver",@"15. Twitter",@"16. Facebook", nil];
    
    iosexampleTable = [[UITableView alloc] initWithFrame:CGRectMake(00,0,320,650) style:UITableViewStylePlain];
    iosexampleTable.dataSource = self;
    iosexampleTable.delegate = self;
    iosexampleTable.scrollEnabled = YES;
    [scrollView addSubview:iosexampleTable];
  	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma -mark TableView Delegate Methods




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [exampleArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [iosexampleTable dequeueReusableCellWithIdentifier:CellIdentifier];

    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [exampleArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

    //etc.
   

- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        activityController = [[ActivityIndiactorViewController alloc] initWithNibName:nil bundle:NULL];
        [self.navigationController pushViewController:activityController animated:YES];
   
    }
    else if(indexPath.row ==1)
    {
        collectionController = [[CollectionViewController alloc]init];
        [self.navigationController pushViewController:collectionController animated:YES];       
    }
    if(indexPath.row == 2)
    {
        emailController = [[EmailViewController alloc]init];
        [self.navigationController pushViewController:emailController animated:YES];
    }
    if(indexPath.row == 3)
    {
        webController = [[WebViewController alloc]init];
        [self.navigationController pushViewController:webController animated:YES];
    }
    if(indexPath.row == 4)
    {
        actionController = [[ActionSheetViewController alloc]init];
        [self.navigationController pushViewController:actionController animated:YES];
    }
    if(indexPath.row == 5)
    {
        sliderController = [[SliderViewController alloc]init];
        [self.navigationController pushViewController:sliderController animated:YES];
    }
    if(indexPath.row == 6)
    {
        userController = [[UserdeafaultViewController alloc]init];
        [self.navigationController pushViewController:userController animated:YES];
    }
    if(indexPath.row == 7)
    {
        progressController = [[MBProgressViewController alloc]init];
        [self.navigationController pushViewController:progressController animated:YES];
    }
    if(indexPath.row == 8)
    {
        carouselController = [[CarouselViewController alloc]init];
        [self.navigationController pushViewController:carouselController animated:YES];
    }
    if(indexPath.row == 9)
    {
        socialController = [[SocialSharingViewController alloc]init];
        [self.navigationController pushViewController:socialController animated:YES];
    }
    if(indexPath.row == 10)
    {
        animationController = [[AnimationViewController alloc]init];
        [self.navigationController pushViewController:animationController animated:YES];
    }
    if(indexPath.row == 11)
    {
        pagingController = [[PagingViewController alloc]init];
        [self.navigationController pushViewController:pagingController animated:YES];
    }
    if(indexPath.row == 12)
    {
        audioController = [[AudioViewController alloc]init];
        [self.navigationController pushViewController:audioController animated:YES];
    }
    if(indexPath.row == 13)
    {
        popController = [[PopViewController alloc]init];
        [self.navigationController pushViewController:popController animated:YES];
    }
    if(indexPath.row == 14)
    {
        twitterController = [[TwitterDemoViewController alloc]init];
        [self.navigationController pushViewController:twitterController animated:YES];
    }
    if(indexPath.row == 15)
    {
        facebookController = [[FacebookViewController alloc]init];
        [self.navigationController pushViewController:facebookController animated:YES];
    }





   
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    
//    return 82;
//    
//}
//
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}



    // Dispose of any resources that can be recreated.


@end
