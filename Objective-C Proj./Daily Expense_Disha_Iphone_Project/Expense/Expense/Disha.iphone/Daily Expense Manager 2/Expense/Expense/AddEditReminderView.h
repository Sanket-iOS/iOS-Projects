//
//  AddEditReminderView.h
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEditReminderView : UIViewController<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>
{
  
    UIDatePicker *Remin_DatePicker;
    UIDatePicker *Remin_TimePicker;
    UITableView *Recurring_Table;
    NSArray *Recurring;
    UITableView *Add_Table;
    NSArray *Add;
    BOOL Notified;
    NSMutableArray *Notifiedarr;
}

@property (strong, nonatomic) IBOutlet UIButton *checkbox;

- (IBAction)checkboxClicked:(id)sender;
- (IBAction)SelectReminDate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ReminDateBox;
- (IBAction)AddClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *AddBox;
@property (strong, nonatomic) IBOutlet UITextField *RecurringBox;
- (IBAction)ReminClick:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *headingBox;
@property (strong, nonatomic) IBOutlet UITextField *DetailBox;
- (IBAction)TimePicker:(id)sender;

- (IBAction)ReminImagePicking:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *ReminImageView;
//- (IBAction)AddRecord:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *PriceBox;
- (IBAction)EditReminder:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *TimeBox;
@property (strong, nonatomic) IBOutlet UILabel *blankeError1;
@property (strong, nonatomic) IBOutlet UILabel *blankeError2;
@property (strong, nonatomic) IBOutlet UILabel *blankeError3;
@property (strong, nonatomic) IBOutlet UILabel *blankeError4;
@property (strong, nonatomic) IBOutlet UILabel *blankeError5;
@property (strong, nonatomic) IBOutlet UILabel *blankeError6;
@property (strong, nonatomic) IBOutlet UILabel *blankeError7;


@end
