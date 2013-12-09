//
//  CarouselViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CarouselViewController.h"
#import "iCarousel.h"

@interface CarouselViewController ()<iCarouselDataSource,iCarouselDelegate>

@property(strong,nonatomic)NSMutableArray *images;
@property(strong,nonatomic) iCarousel* carousel;

@end

@implementation CarouselViewController
@synthesize carousel = _carousel;
@synthesize  images = _images;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    {
        NSArray *imagePaths = [[NSBundle mainBundle]pathsForResourcesOfType:@"jpg" inDirectory:@"Beautiful Lakes"];
      
        _images = [[NSMutableArray alloc]init];
        for(NSString* path in imagePaths){
            [_images addObject:[UIImage imageWithContentsOfFile:path]];
        }
    }
        // Custom initialization
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =@"Carousel";
    self.view.backgroundColor = [UIColor blueColor];
    
    _images = [[NSMutableArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg", nil];

    _carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0.0, 0.0, 512, 384)];
    //_carousel.backgroundColor = [UIColor blackColor];
    _carousel.delegate =self;
    _carousel.dataSource =self;
    _carousel.type = iCarouselTypeCoverFlow2;
    [self.view addSubview:_carousel];
	// Do any additional setup after loading the view.
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_images count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    
    view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_images objectAtIndex:index]]];
    view.frame = CGRectMake(0.0, 0.0, 512.0, 384);
    view.backgroundColor =[UIColor redColor];
    
    return view;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
