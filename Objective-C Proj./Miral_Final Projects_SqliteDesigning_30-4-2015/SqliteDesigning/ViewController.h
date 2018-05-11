//
//  ViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userid;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *invalid;
- (IBAction)editing_did_begin_UID:(id)sender;
- (IBAction)editing_did_begin_pwd:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *login_image;

@property (weak, nonatomic) IBOutlet UIButton *login_button;

@end
