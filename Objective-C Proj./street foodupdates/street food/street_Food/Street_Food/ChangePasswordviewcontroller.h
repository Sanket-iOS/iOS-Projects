//
//  ChangePasswordviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordviewcontroller : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_oldpassword;
@property (weak, nonatomic) IBOutlet UITextField *txt_newpassword;
@property (weak, nonatomic) IBOutlet UITextField *txt_verify;
@property (weak, nonatomic) IBOutlet UIButton *btn_save;
- (IBAction)btn_saveaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view_pass;
@property (weak, nonatomic) IBOutlet UIView *view_changepass;
@property (weak, nonatomic) IBOutlet UIButton *btn_backchangepass;
- (IBAction)btn_backchange:(id)sender;



@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;


@end
