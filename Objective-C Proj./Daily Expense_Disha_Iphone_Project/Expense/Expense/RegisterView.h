//
//  RegisterView.h
//  Expense
//
//  Created by mac on 4/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *NameBox;
@property (weak, nonatomic) IBOutlet UITextField *PassBox;
@property (weak, nonatomic) IBOutlet UITextField *rePassBox;
@property (weak, nonatomic) IBOutlet UITextField *EmailBox;
@property (weak, nonatomic) IBOutlet UITextField *ContactBox;
@property (weak, nonatomic) IBOutlet UITextField *IncomeBox;
- (IBAction)Register:(id)sender;
- (IBAction)Clear:(id)sender;

@end
