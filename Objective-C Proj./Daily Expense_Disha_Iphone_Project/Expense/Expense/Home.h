//
//  Home.h
//  Expense
//
//  Created by mac on 2/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController
- (IBAction)AddTrans:(id)sender;
- (IBAction)History:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *BalanceVal;

- (IBAction)Setting:(id)sender;
- (IBAction)Reminder:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *historyBTN;
@property (weak, nonatomic) IBOutlet UIButton *TranBTN;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;
@property (weak, nonatomic) IBOutlet UIButton *ReminBTN;

@end
