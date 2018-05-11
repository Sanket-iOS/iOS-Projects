//
//  addplaceviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/28/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addplaceviewcontroller : UIViewController<UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
- (IBAction)btn_backaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *view_upload;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *view_form;
@property (weak, nonatomic) IBOutlet UITextField *txt_placename;
@property (weak, nonatomic) IBOutlet UITextView *txt_address;
@property (weak, nonatomic) IBOutlet UITextField *txt_shopename;
@property (strong, nonatomic) IBOutlet UITextView *txt_speciality;
@property (weak, nonatomic) IBOutlet UIImageView *upload_imgview;
@property (weak, nonatomic) IBOutlet UIButton *btn_uploadimgaction;
@property (weak, nonatomic) IBOutlet UIButton *btn_uploadplaceaction;
@property (strong, nonatomic) UIVisualEffectView *view_welcome;

@property (weak, nonatomic) IBOutlet UITextField *txt_category;
//for image picker view
@property (nonatomic,strong) NSString *urlstring;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultConfigObject;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSMutableURLRequest * urlRequest;
@property (nonatomic, strong) NSString * params;
@property (nonatomic, strong) NSURLSessionDataTask * dataTask;
@property (nonatomic, strong) NSData *responsedata;


- (IBAction)btn_uploadformaction:(id)sender;
- (IBAction)btn_uplaodimg:(id)sender;

@end
