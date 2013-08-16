//
//  RootViewController.m
//  Jibenet
//
//  Created by Raj on 10/08/13.
//  Copyright (c) 2013 admin. All rights reserved.
//


#import "RootViewController.h"
#import "SideSwipeTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Facebook.h"
#import "twitter.h"
#import "RootViewController.h"
#import "descriptionView.h"
#define BUTTON_LEFT_MARGIN 10.0
#define BUTTON_SPACING 25.0

@interface RootViewController (PrivateStuff)
{

    
}
-(void) setupSideSwipeView;
-(UIImage*) imageFilledWith:(UIColor*)color using:(UIImage*)startImage;
@end

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Pay Attention!" message:@"Swipe Table Cells Left or Right for more options" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
  // Setup the title and image for each button within the side swipe view
  buttonData = [NSArray arrayWithObjects:
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Reply", @"title", @"reply.png", @"image", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Retweet", @"title", @"retweet-outline-button-item.png", @"image", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Favorite", @"title", @"star-hollow.png", @"image", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Profile", @"title", @"person.png", @"image", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Links", @"title", @"paperclip.png", @"image", nil],
                  [NSDictionary dictionaryWithObjectsAndKeys:@"Action", @"title", @"action.png", @"image", nil],
                   nil];
  buttons = [[NSMutableArray alloc] initWithCapacity:buttonData.count];

  self.sideSwipeView = [[UIView alloc] initWithFrame:CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, tableView.rowHeight)] ;
  [self setupSideSwipeView];
}

- (void) setupSideSwipeView
{
  // Add the background pattern
  self.sideSwipeView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"dotted-pattern.png"]];

  // Overlay a shadow image that adds a subtle darker drop shadow around the edges
  UIImage* shadow = [[UIImage imageNamed:@"inner-shadow.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
  UIImageView* shadowImageView = [[UIImageView alloc] initWithFrame:sideSwipeView.frame];
  shadowImageView.alpha = 0.6;
  shadowImageView.image = shadow;
  shadowImageView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  [self.sideSwipeView addSubview:shadowImageView];

  // Iterate through the button data and create a button for each entry
  CGFloat leftEdge = BUTTON_LEFT_MARGIN;
  for (NSDictionary* buttonInfo in buttonData)
  {
    // Create the button
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // Make sure the button ends up in the right place when the cell is resized
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;

    // Get the button image
    UIImage* buttonImage = [UIImage imageNamed:[buttonInfo objectForKey:@"image"]];

    // Set the button's frame
    button.frame = CGRectMake(leftEdge, sideSwipeView.center.y - buttonImage.size.height/2.0, buttonImage.size.width, buttonImage.size.height);

    // Add the image as the button's background image
    // [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage* grayImage = [self imageFilledWith:[UIColor colorWithWhite:0.9 alpha:1.0] using:buttonImage];
    [button setImage:grayImage forState:UIControlStateNormal];
    
    // Add a touch up inside action
    [button addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];

    // Keep track of the buttons so we know the proper text to display in the touch up inside action
    [buttons addObject:button];
      
      
    
    // Add the button to the side swipe view
    [self.sideSwipeView addSubview:button];
    
    // Move the left edge in prepartion for the next button
    leftEdge = leftEdge + buttonImage.size.width + BUTTON_SPACING;
  }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
    NSString *numbers =[[NSString alloc]initWithFormat:@"%d",indexPath.row];
  SideSwipeTableViewCell *cell = (SideSwipeTableViewCell*)[theTableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
    cell = [[SideSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    for (UIView *Cell in cell.contentView.subviews) {
        if ([Cell isKindOfClass:[UIImageView class]]) {
            [Cell removeFromSuperview];
        }
        if ([Cell isKindOfClass:[UILabel class]]) {
            [Cell removeFromSuperview];
        }
        if ([Cell isKindOfClass:[UITextField class]]) {
            [Cell removeFromSuperview];
        }
        if ([Cell isKindOfClass:[UIButton class]]) {
            [Cell removeFromSuperview];
        }
    }
    UIImageView *cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 101,100)];
    cellImage.image = [UIImage imageNamed:@"d2.jpg"];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbg1.png"]];
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbg1.png"]];
    [cell addSubview:cellImage];
    UILabel *lblText = [[UILabel alloc]init];
    lblText.frame =CGRectMake(101, 2, 436, 25);
    lblText.text =numbers;
    lblText.numberOfLines =2;
    lblText.font =[UIFont fontWithName:@"Helvetica" size:20];
    lblText.textColor = [UIColor blackColor];
    lblText.backgroundColor = [UIColor clearColor];

    [cell.contentView addSubview:lblText];
    UILabel *detaillbl =[[UILabel alloc]init];
    detaillbl.frame = CGRectMake(101, 27, 436, 27);
    detaillbl.font = [UIFont fontWithName:@"Helvetica" size:10];
    detaillbl.text = @"Address of the place";
    detaillbl.textColor = [UIColor blueColor];
    detaillbl.backgroundColor = [UIColor clearColor];
    detaillbl.numberOfLines = 4;
    [cell.contentView addSubview:detaillbl];
                    
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 100 + indexPath.row * 0;
}

#pragma mark Button touch up inside action
- (IBAction) touchUpInsideAction:(UIButton*)button
{
  NSIndexPath* indexPath = [tableView indexPathForCell:sideSwipeCell];
    
  NSUInteger index = [buttons indexOfObject:button];
  NSDictionary* buttonInfo = [buttonData objectAtIndex:index];
    
        NSLog(@"%@",[buttonInfo objectForKey:@"title"]);
    if ([[buttonInfo objectForKey:@"title"]isEqualToString:@"Reply"])
    {
        fb = [[Facebook alloc]initWithNibName:@"Facebook" bundle:nil];
        [self.navigationController pushViewController:fb animated:YES];

    }
    if ([[buttonInfo objectForKey:@"title"]isEqualToString:@"Retweet"]) {
        tw = [[twitter alloc]initWithNibName:@"twitter" bundle:nil];
        [self.navigationController pushViewController:tw animated:YES];
    }
    if ([[buttonInfo objectForKey:@"title"]isEqualToString:@"Favorite"])
    {
        descriptionView *dView = [[descriptionView alloc]initWithNibName:@"descriptionView" bundle:nil];
        [self.navigationController pushViewController:dView animated:YES];
    }

  
   /*[[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"%@ on cell %d", [buttonInfo objectForKey:@"title"], indexPath.row]
                               message:nil
                              delegate:nil
                     cancelButtonTitle:nil
                     otherButtonTitles:@"OK", nil] show];*/
  
  [self removeSideSwipeView:YES];
}

#pragma mark Generate images with given fill color
// Convert the image's fill color to the passed in color
-(UIImage*) imageFilledWith:(UIColor*)color using:(UIImage*)startImage
{
  // Create the proper sized rect
  CGRect imageRect = CGRectMake(0, 0, CGImageGetWidth(startImage.CGImage), CGImageGetHeight(startImage.CGImage));

  // Create a new bitmap context
  CGContextRef context = CGBitmapContextCreate(NULL, imageRect.size.width, imageRect.size.height, 8, 0, CGImageGetColorSpace(startImage.CGImage), kCGImageAlphaPremultipliedLast);

  // Use the passed in image as a clipping mask
  CGContextClipToMask(context, imageRect, startImage.CGImage);
  // Set the fill color
  CGContextSetFillColorWithColor(context, color.CGColor);
  // Fill with color
  CGContextFillRect(context, imageRect);

  // Generate a new image
  CGImageRef newCGImage = CGBitmapContextCreateImage(context);
  UIImage* newImage = [UIImage imageWithCGImage:newCGImage scale:startImage.scale orientation:startImage.imageOrientation];

  // Cleanup
  CGContextRelease(context);
  CGImageRelease(newCGImage);
  
  return newImage;
}


@end