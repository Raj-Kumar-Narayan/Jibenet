//
//  AppDelegate.h
//  Jibenet
//
//  Created by Raj on 10/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)RootViewController *viewController;

@property (strong, nonatomic)UINavigationController *navController;
@end
