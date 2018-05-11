//
//  calculateViewController.h
//  IncomeTax
//
//  Created by tops on 3/28/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownView.h"
#import "DropDownGender.h"

@interface calculateViewController : UIViewController
{
    NSArray *arrdata;
     NSArray *arrdata1;
    DropDownView *dropDownView;
    DropDownGender *dropDownGender;
}
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIButton *btngender;
- (IBAction)actngender:(id)sender;

- (IBAction)selectdrplist:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblgen;

@property (weak, nonatomic) IBOutlet UILabel *lblres;
@property (weak, nonatomic) IBOutlet UITextField *btnyear;
@property (weak, nonatomic) IBOutlet UITextField *btnincome;

@property (weak, nonatomic) IBOutlet UITextField *txttax;

- (IBAction)btncalculate:(id)sender;

@end
