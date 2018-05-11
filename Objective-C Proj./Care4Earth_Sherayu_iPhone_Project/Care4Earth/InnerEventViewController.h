//
//  InnerEventViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InnerEventViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *txtgoal;
- (IBAction)btnJoin:(id)sender;
- (IBAction)btnback:(id)sender;


@end
