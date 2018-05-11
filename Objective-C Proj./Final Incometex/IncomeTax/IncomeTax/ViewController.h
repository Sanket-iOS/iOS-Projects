//
//  ViewController.h
//  IncomeTax
//
//  Created by tops on 3/16/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
   
}
- (IBAction)btn_signup:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtuname;
@property (weak, nonatomic) IBOutlet UITextField *txtpwd;
- (IBAction)btnlogin:(id)sender;

- (IBAction)frgtpassword:(id)sender;

@end
