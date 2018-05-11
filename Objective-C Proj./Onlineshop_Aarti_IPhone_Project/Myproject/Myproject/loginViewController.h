//
//  loginViewController.h
//  Myproject
//
//  Created by tops on 1/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController
- (IBAction)changesegment:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtemail;
@property (strong, nonatomic) IBOutlet UITextField *txtpassword;
- (IBAction)btnshow:(id)sender;
- (IBAction)btnforgetpass:(id)sender;

- (IBAction)btnsign:(id)sender;
- (IBAction)changesegment1:(id)sender;
- (IBAction)email:(id)sender;
- (IBAction)password:(id)sender;
- (IBAction)getstart:(id)sender;
- (IBAction)btnforgotpassword:(id)sender;
@property(weak,nonatomic)NSString *stri1;
@property(weak,nonatomic)NSString *stri2;
@end
