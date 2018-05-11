//
//  changepwdViewController.h
//  IncomeTax
//
//  Created by tops on 3/31/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface changepwdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *oldpwd;
@property (weak, nonatomic) IBOutlet UITextField *newpwd;
@property (weak, nonatomic) IBOutlet UITextField *confirmpwd;
- (IBAction)updatebtn:(id)sender;

@end
