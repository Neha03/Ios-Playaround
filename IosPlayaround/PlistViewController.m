//
//  PlistViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 07/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "PlistViewController.h"

@interface PlistViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* tableView;
    NSArray* tableData;
}

@end

@implementation PlistViewController

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
    self.title = @"Plist";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(00,0,320,650) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.scrollEnabled = YES;
    [self.view addSubview:tableView];
    
    tableData = [dictionary objectForKey:@"AppleDevice"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}


	// Do any additional setup after loading the view.



@end
