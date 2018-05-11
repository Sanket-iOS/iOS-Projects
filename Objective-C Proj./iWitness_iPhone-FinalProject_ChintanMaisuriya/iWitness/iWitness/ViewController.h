//
//  ViewController.h
//  iWitness
//
//  Created by MAC OS on 5/26/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"


@interface ViewController : UIViewController
{
    NSMutableArray *getData;

}

@property (weak, nonatomic) IBOutlet TextFieldValidator *txtUsername;
@property (weak, nonatomic) IBOutlet TextFieldValidator *txtPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnLogIn;
- (IBAction)btnLogIn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnForgotPWD;
- (IBAction)btnForgotPWD:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)btnBack:(id)sender;

@end

