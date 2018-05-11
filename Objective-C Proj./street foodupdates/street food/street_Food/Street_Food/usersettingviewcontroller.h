//
//  usersettingviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface usersettingviewcontroller : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_uploadpro;
@property (weak, nonatomic) IBOutlet UIView *userview;
- (IBAction)btn_updateprofile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_update;
@property (weak, nonatomic) IBOutlet UITextField *txt_username;
@property (weak, nonatomic) IBOutlet UITextField *txt_emailid;
@property (weak, nonatomic) IBOutlet UITextField *txt_mbno;
@property (weak, nonatomic) IBOutlet UITextField *txt_userid;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *view_usersetting;
- (IBAction)btn_signout:(id)sender;

- (IBAction)btn_backaction:(id)sender;

//database
@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;
@property (nonatomic,strong) NSString * strEmailid;





@end
