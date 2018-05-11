//
//  ForgotPassword.h
//  iWitness
//
//  Created by Chintan on 06/09/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassword : UIViewController{
    NSArray *getPWD;
    NSString *PWD;
    NSString *resOTP;
    NSString *OTPcode;
}
@property (weak, nonatomic) IBOutlet UIView *viewFP;

@property (weak, nonatomic) IBOutlet UITextField *txtRegisterMobileNo;

- (IBAction)btnSendOTP:(id)sender;

@end
