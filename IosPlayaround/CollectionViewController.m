//
//  CollectionViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 05/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UIImageView* imgView;
    NSMutableArray *imgArray;
    UILabel* LblLake;
}
@property(strong,nonatomic)UICollectionView* collectionView;

@end

@implementation CollectionViewController

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
    self.view.backgroundColor =[UIColor blueColor];
    
    imgArray = [[NSMutableArray alloc]initWithObjects:@"IMG_0150.jpg",@"IMG_0154.jpg",@"IMG_0163.jpg",@"IMG_0169.jpg",@"IMG_0170.jpg",@"IMG_0173.jpg",@"IMG_0174.jpg",@"IMG_0180.jpg",@"IMG_0181.jpg",@"IMG_0184.jpg", nil];
    
    self.title =@"Collection View";
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 30, 280, 300) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    //[_collectionView registerClass:[CustomCollectionViewCell class]
    //   forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
    LblLake = [[UILabel alloc]initWithFrame:CGRectMake(100, 350, 250, 100)];
    LblLake.text =@"Beautiful Lakes";
    LblLake.textColor = [UIColor whiteColor];
    LblLake.lineBreakMode = NSLineBreakByWordWrapping;
    LblLake.numberOfLines = 0;
    LblLake.backgroundColor = [UIColor blueColor ];
    LblLake.font = [UIFont italicSystemFontOfSize:40];
    [self.view addSubview:LblLake];
    
    
    
    
}

#pragma mark- collection view delegates
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
   
    NSString *strImageName = [imgArray objectAtIndex:indexPath.row];
    UIImage *imgName =  [UIImage imageNamed:strImageName];
  
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, imgName.size.width, imgName.size.height)];
   
    imgView.image = imgName;
    [cell addSubview:imgView];

       
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{   // NSLog(@"there");
    
    return CGSizeMake(80, 100);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    // NSLog(@"here");
    return 1.0;
}

	// Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
