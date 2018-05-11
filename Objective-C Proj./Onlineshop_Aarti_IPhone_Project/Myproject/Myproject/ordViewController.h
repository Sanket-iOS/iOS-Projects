//
//  ordViewController.h
//  Myproject
//
//  Created by mac on 3/17/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "ViewController.h"

@interface ordViewController : ViewController
- (IBAction)btnprice:(id)sender;
- (IBAction)btnname:(id)sender;
- (IBAction)btnquantity:(id)sender;
- (IBAction)btnaddress:(id)sender;
- (IBAction)btndate:(id)sender;
- (IBAction)btncity:(id)sender;
- (IBAction)btnstate:(id)sender;
- (IBAction)btnshippingrate:(id)sender;
- (IBAction)btnamount:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtquantity;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtprice;
@property (weak, nonatomic) IBOutlet UITextField *txtaddress;
@property (weak, nonatomic) IBOutlet UITextField *txtdate;
@property (weak, nonatomic) IBOutlet UITextField *txtcity;
@property (weak, nonatomic) IBOutlet UITextField *txtstate;
@property (weak, nonatomic) IBOutlet UITextField *txtshipingrate;
@property (weak, nonatomic) IBOutlet UITextField *txtamount;
- (IBAction)makeorder:(id)sender;
- (IBAction)makecomplain:(id)sender;
@property(weak,nonatomic)NSString *st1;
@property(weak,nonatomic)NSString *st2;
@end
