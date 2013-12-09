//
//  AnimationViewController.m
//  IosPlayaround
//
//  Created by n3h@ on 06/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property(strong,nonatomic)UIImageView* imageView;

@end

@implementation AnimationViewController

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
    self.title =@"Animation";
    UIImage *image = [UIImage imageNamed:@"IMG_0150.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = CGRectMake(0, 0, 100.0f, 120.0f);    
    [self.view addSubview:self.imageView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:10.0f];
    //    [UIView setAnimationDelegate:self];
    //    self.imageView.frame = CGRectMake(200.0f, 150.0f, 100.0f,120.0f);
    //    [UIView commitAnimations];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    self.view.frame=CGRectMake(self.view.frame.size.width-90.0, self.view.frame.size.height/2, 90.0, 90.0);
    [UIView commitAnimations];
    [self performSelector:@selector(animate1) withObject:nil afterDelay:0.3];
}


-(void)animate1{
    
    [UIView animateWithDuration:.35 animations:^{
        self.view.frame=CGRectMake(self.view.frame.size.width-90.0, self.view.frame.size.height/2, 90.0, 90.0);
        
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:.35 animations:^{
           self.view.frame=CGRectMake(200.0, self.view.frame.size.height-320, 90.0, 90.0);
            
        } completion:^(BOOL finished){
            [UIView animateWithDuration:.35 animations:^{
                self.view.frame=CGRectMake(20.0, 400, 90.0, 90.0);
                            
            } completion:^(BOOL finished){
                [UIView animateWithDuration:.35 animations:^{
                    self.view.alpha=0.0;
                    self.view.transform=CGAffineTransformMakeScale(0.5, 0.5);

                
            }];
        }];
    }];
}];
        
}

//-(void)animate2{
//    [UIView beginAnimations:@"" context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDuration:0.3];
//    _demoView.frame=CGRectMake(0.0, self.view.frame.size.height-90, 90.0, 90.0);
//    [UIView commitAnimations];
//}
//- (void)viewDidAppear:(BOOL)animated
//{
//
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:3.0f];
//    [UIView setAnimationDelegate:self];
//    self.imageView.frame = CGRectMake(20.0f, 350.0f, 100.0f, 120.0f);
//    [UIView commitAnimations];
//}



	// Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
