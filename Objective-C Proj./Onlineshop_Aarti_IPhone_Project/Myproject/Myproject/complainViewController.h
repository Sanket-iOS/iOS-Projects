//
//  complainViewController.h
//  Myproject
//
//  Created by tops on 2/26/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface complainViewController : UIViewController
{
    UIDatePicker *MyDatePicker;
}
@property (strong, nonatomic) IBOutlet UITextField *txtdate;
- (IBAction)btndate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtsubject;
- (IBAction)btnsubject:(id)sender;

- (IBAction)selectdate:(id)sender;
- (IBAction)btncomplin:(id)sender;
- (IBAction)btndesciption:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtdescription;

@end
