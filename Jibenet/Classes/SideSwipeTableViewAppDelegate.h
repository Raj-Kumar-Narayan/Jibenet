//
//  SideSwipeTableViewAppDelegate.h
//  Jibenet
//
//  Created by Raj on 10/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SideSwipeTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

