//
//  forgotviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/14/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgotviewcontroller : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_forgot;
- (IBAction)forgot_action:(UIButton *)sender;
- (IBAction)resend_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view_forgot;
@property (weak, nonatomic) IBOutlet UIView *view_forgotpass;
@property (weak, nonatomic) IBOutlet UIButton *forgot_pro;
@property (weak, nonatomic) IBOutlet UIButton *resend_pro;
@property (weak, nonatomic) IBOutlet UIButton *btn_backforgot;
- (IBAction)btn_backforgotpass:(id)sender;

@end
