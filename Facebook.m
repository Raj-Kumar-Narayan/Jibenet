//
//  Facebook.m
//  Jibenet
//
//  Created by Raj on 14/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "Facebook.h"

@interface Facebook ()

@end

@implementation Facebook

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
    mySLComposerSheet =[[SLComposeViewController alloc]init];
    mySLComposerSheet =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [mySLComposerSheet setInitialText:@"The Jibenet application is owesome experience it at http://www.jibenet.com"];
    [self presentViewController:mySLComposerSheet animated:YES completion:NULL];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
