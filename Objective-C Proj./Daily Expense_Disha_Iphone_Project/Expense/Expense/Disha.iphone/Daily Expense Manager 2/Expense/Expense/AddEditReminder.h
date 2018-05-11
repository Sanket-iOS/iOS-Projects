//
//  AddReminder.h
//  Expense
//
//  Created by MAC on 2/16/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddReminder : UIViewController<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    BOOL checkboxSelected;
    UIDatePicker *Remin_DatePicker;
    UITableView *Recurring_Table;
    NSArray *Recurring;
    UITableView *Add_Table;
    NSArray *Add;
    
}

@property (strong, nonatomic) IBOutlet UIButton *checkbox;

- (IBAction)checkboxClicked:(id)sender;
- (IBAction)SelectReminDate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ReminDateBox;
- (IBAction)AddClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *AddBox;
@property (strong, nonatomic) IBOutlet UITextField *RecurringBox;
- (IBAction)ReminClick:(id)sender;

- (IBAction)ReminImagePicking:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *ReminImageView;

@end
