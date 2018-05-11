//
//  forgotpassViewController.h
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgotpassViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtpan;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtnewpass;

- (IBAction)btnsave:(id)sender;
@end
