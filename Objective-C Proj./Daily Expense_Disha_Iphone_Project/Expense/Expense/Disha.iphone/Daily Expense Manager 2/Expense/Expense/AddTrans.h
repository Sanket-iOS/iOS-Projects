//
//  AddTrans.h
//  Expense
//
//  Created by tops on 2/11/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTrans : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIDatePicker *MyDatePicker;
    UITableView *CategoryTable;
    UITableView *Pay_ModeTable;

    NSArray *Category;
    NSArray *Pay_mod;
    
}
- (IBAction)SelectDate:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *DateTextBox;
- (IBAction)Back:(id)sender;
- (IBAction)SelectCategory:(id)sender;
- (IBAction)SelectPaymentMode:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *CategoryBox;
@property (strong, nonatomic) IBOutlet UITextField *ModeTextBox;
- (IBAction)PickImg:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *TraImgView;
- (IBAction)SaveRecord:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ItemBox;
@property (strong, nonatomic) IBOutlet UITextField *PriceBox;
@property (strong, nonatomic) IBOutlet UITextView *DescTextView;
@property (strong, nonatomic) IBOutlet UILabel *blankerror1;
@property (strong, nonatomic) IBOutlet UILabel *blankerror2;
@property (strong, nonatomic) IBOutlet UILabel *blankerror3;
@property (strong, nonatomic) IBOutlet UILabel *blankerror4;
@property (strong, nonatomic) IBOutlet UILabel *blankerror5;
@property (strong, nonatomic) IBOutlet UILabel *blankerror6;


@end
