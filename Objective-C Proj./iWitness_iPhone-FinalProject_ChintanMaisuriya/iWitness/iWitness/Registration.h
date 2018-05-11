//
//  Registration.h
//  iWitness
//
//  Created by MAC OS on 5/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"

@interface Registration : UIViewController<NSURLSessionDelegate,NSURLSessionDataDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewRegistration;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtFName;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtSurname;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtAddress1;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtContact;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtEmail;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtUsername;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtPassword;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtConfirmPWD;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtAadharNo;

@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
- (IBAction)btnRegister:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnRegCancel;
- (IBAction)btnRegCancel:(id)sender;


@end
