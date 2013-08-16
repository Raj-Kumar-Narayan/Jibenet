//
//  SideSwipeTableViewController.h
//  Jibenet
//
//  Created by Raj on 10/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//


@interface SideSwipeTableViewController : UIViewController
{
  IBOutlet UITableView* tableView;
  IBOutlet UIView* sideSwipeView;
  UITableViewCell* sideSwipeCell;
  UISwipeGestureRecognizerDirection sideSwipeDirection;
  BOOL animatingSideSwipe;
}

@property (nonatomic, retain) IBOutlet UITableView* tableView;
@property (nonatomic, retain) IBOutlet UIView* sideSwipeView;
@property (nonatomic, retain) UITableViewCell* sideSwipeCell;
@property (nonatomic) UISwipeGestureRecognizerDirection sideSwipeDirection;
@property (nonatomic) BOOL animatingSideSwipe;

- (void) removeSideSwipeView:(BOOL)animated;
- (BOOL) gestureRecognizersSupported;

@end
