//
//  PopoverViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 07/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * popTable;
}
@end

@implementation PopoverViewController

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
    popTable = [[UITableView alloc] initWithFrame:CGRectMake(00,0,320,650) style:UITableViewStylePlain];
    popTable.dataSource = self;
    popTable.delegate = self;
    popTable.scrollEnabled = YES;
    [self.view addSubview:popTable];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text=[NSString stringWithFormat:@"Row number %d",indexPath.row];
    
    return cell;
}


@end
