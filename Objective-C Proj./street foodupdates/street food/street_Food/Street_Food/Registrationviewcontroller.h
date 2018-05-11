//
//  Registrationviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/8/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Registrationviewcontroller : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_mbno;
@property (weak, nonatomic) IBOutlet UIButton *reg_pro;
@property (weak, nonatomic) IBOutlet UIView *view_streetfood;
@property (weak, nonatomic) IBOutlet UIView *view_reg;
@property (weak, nonatomic) IBOutlet UITextField *txt_userbname;
- (IBAction)btn_backreg:(id)sender;
- (IBAction)reg_action:(id)sender;
- (IBAction)mbno_action:(id)sender;


//database

@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;


@end
