//
//  ViewController.h
//  ChatFirebase
//
//  Created by TOPS on 12/30/16.
//  Copyright © 2016 TOPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppState.h"
#import "Constants.h"
#import "MeasurementHelper.h"
@import Firebase;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_emailid;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

- (IBAction)btn_login:(id)sender;
- (IBAction)btn_resetpassword:(id)sender;
- (IBAction)btn_registeruser:(id)sender;

@end

