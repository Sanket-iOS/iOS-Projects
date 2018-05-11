//
//  RegistrationStep2.h
//  IncomeTax
//
//  Created by tops on 3/16/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationStep2 : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scoll;
@property (weak, nonatomic) IBOutlet UITextField *txtuserid;
@property (weak, nonatomic) IBOutlet UITextField *txtfname;
@property (weak, nonatomic) IBOutlet UITextField *txtmname;
@property (weak, nonatomic) IBOutlet UITextField *txtlname;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtpass;
@property (weak, nonatomic) IBOutlet UITextField *txtconpass;
@property (weak, nonatomic) IBOutlet UITextField *txtsecques;
@property (weak, nonatomic) IBOutlet UITextField *txtsecans;
@property (weak, nonatomic) IBOutlet UITextField *txtpan;
@property (weak, nonatomic) IBOutlet UITextField *txtmobile;
@property (weak, nonatomic) IBOutlet UITextField *txtdob;
@property (weak, nonatomic) IBOutlet UITextField *txtadd;
- (IBAction)btnregsub:(id)sender;

@end
