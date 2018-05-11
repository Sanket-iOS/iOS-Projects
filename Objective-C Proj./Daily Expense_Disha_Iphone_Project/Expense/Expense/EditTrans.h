//
//  EditTrans.h
//  Expense
//
//  Created by tops on 3/14/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTrans : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIDatePicker *MyDatePicker;
    UITableView *CategoryTable;
    UITableView *Pay_ModeTable;
    NSMutableArray *arrData;
    NSArray *Category;
    NSArray *Pay_mod;
    
}
- (IBAction)BackToADD:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *blankerror1;
@property (strong, nonatomic) IBOutlet UILabel *blankerror2;
@property (strong, nonatomic) IBOutlet UILabel *blankerror3;
@property (strong, nonatomic) IBOutlet UILabel *blankerror4;
@property (strong, nonatomic) IBOutlet UILabel *blankerror5;
@property (strong, nonatomic) IBOutlet UILabel *blankerror6;
@property (strong, nonatomic) IBOutlet UILabel *blankerror7;

- (IBAction)ChengeTrans_id:(id)sender;
- (IBAction)SelectDate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *Trans_idBox;

@property (strong, nonatomic) IBOutlet UITextField *DateTextBox;
- (IBAction)SelectCategory:(id)sender;
- (IBAction)SelectPaymentMode:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *CategoryBox;
@property (strong, nonatomic) IBOutlet UITextField *ModeTextBox;
@property (strong, nonatomic) IBOutlet UITextField *ItemBox;
@property (strong, nonatomic) IBOutlet UITextField *PriceBox;
@property (strong, nonatomic) IBOutlet UITextView *DescTextView;
- (IBAction)EditClciked:(id)sender;

@end
