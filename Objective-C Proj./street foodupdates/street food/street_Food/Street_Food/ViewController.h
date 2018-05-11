//
//  ViewController.h
//  Street_Food
//
//  Created by pinu on 08/09/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *uitext;
@property (weak, nonatomic) IBOutlet UIButton *btn_signinpro;
@property (weak, nonatomic) IBOutlet UIView *blur_view;
@property (weak, nonatomic) IBOutlet UIButton *btn_signoutpro;
@property (weak, nonatomic) IBOutlet UIImageView *view_login;
@property (weak, nonatomic) IBOutlet UITextField *pwdtext;
@property (weak, nonatomic) IBOutlet UIButton *btn_skip;
@property (weak, nonatomic) IBOutlet UIView *view_welcome;

- (IBAction)pwdaction:(id)sender;
- (IBAction)btn_signin:(id)sender;
- (IBAction)btn_signup:(id)sender;
- (IBAction)btn_forgotpwd:(id)sender;
- (IBAction)btn_skipaction:(id)sender;

//database property


//database

@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;
@property (nonatomic,strong) NSMutableArray *statusUser;




@end

