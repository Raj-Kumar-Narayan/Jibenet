//
//  RootViewController.h
//  Jibenet
//
//  Created by Raj on 10/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "SideSwipeTableViewController.h"
#import "Facebook.h"
#import "twitter.h"
#import "RMEIdeasPullDownControl.h"

@interface RootViewController : SideSwipeTableViewController
{
  NSArray* buttonData;
  NSMutableArray* buttons;
  
    Facebook *fb;
    twitter *tw;
}

@end
