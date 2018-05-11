//
//  NSnotificationViewController.h
//  Myproject
//
//  Created by tops on 3/26/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSnotificationViewController : UIViewController
{
    UILocalNotification *notification;
}
@property (weak, nonatomic) IBOutlet UITextField *customMessage;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *frequencySegmentedControl;
- (IBAction)btnsave:(id)sender;

@end
