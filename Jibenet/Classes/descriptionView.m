//
//  descriptionView.m
//  Jibenet
//
//  Created by Raj on 16/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "descriptionView.h"

@interface descriptionView ()

@end

@implementation descriptionView

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
    UIImageView *bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"d2.jpg"]];
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    if (screenRect.size.height==568.0f) {
        bg.image = [UIImage imageNamed:@"d2.jpg"];
    }
    bg.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bg];
    [self.view sendSubviewToBack:bg];
    UIImageView *largeImage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Default@2x.png"]];
    largeImage.frame = CGRectMake(50, 50, 200, 200);
    [self.view addSubview:largeImage];
    UILabel *placeNamelbl =[[UILabel alloc]init];
    placeNamelbl.frame = CGRectMake(50, 252, 580, 60);
    placeNamelbl.numberOfLines=2;
    placeNamelbl.font =[UIFont fontWithName:@"Helvetica" size:12];
    placeNamelbl.text =@"Name of the Office Place";
    placeNamelbl.textColor = [UIColor blackColor];
    placeNamelbl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:placeNamelbl];
    UILabel *addresslbl =[[UILabel alloc]init];
    addresslbl.frame = CGRectMake(50, 291, 580, 90);
    addresslbl.numberOfLines=4;
    addresslbl.font =[UIFont fontWithName:@"Helvetica" size:12];
    addresslbl.text =@"Address of the Office Place";
    addresslbl.textColor = [UIColor blackColor];
    addresslbl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:addresslbl];
    UILabel *pricelbl =[[UILabel alloc]init];
    pricelbl.frame = CGRectMake(50, 382, 580, 30);
    pricelbl.numberOfLines=1;
    pricelbl.font =[UIFont fontWithName:@"Helvetica" size:12];
    pricelbl.text =@"Price of the Office Place";
    pricelbl.textColor = [UIColor blackColor];
    pricelbl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pricelbl];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
