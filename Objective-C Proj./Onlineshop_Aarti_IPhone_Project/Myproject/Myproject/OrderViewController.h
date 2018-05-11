//
//  OrderViewController.h
//  Myproject
//
//  Created by tops on 2/15/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;
- (IBAction)btncomplain:(id)sender;
- (IBAction)btnorder:(id)sender;
- (IBAction)btnamount:(id)sender;
- (IBAction)btnshippingrate:(id)sender;
- (IBAction)btnstate:(id)sender;
- (IBAction)btncity:(id)sender;
- (IBAction)btndate:(id)sender;

- (IBAction)btnprice:(id)sender;
- (IBAction)btnname:(id)sender;
- (IBAction)btnquantity:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtquantity;
@property (strong, nonatomic) IBOutlet UITextField *txtname;
@property (strong, nonatomic) IBOutlet UITextField *txtprice;
@property (strong, nonatomic) IBOutlet UITextField *txtaddress;
@property (strong, nonatomic) IBOutlet UITextField *txtdate;
@property (strong, nonatomic) IBOutlet UITextField *txtcity;
@property (strong, nonatomic) IBOutlet UITextField *txtsate;
@property (strong, nonatomic) IBOutlet UITextField *txtshippingrate;
@property (strong, nonatomic) IBOutlet UITextField *txtamount;

@end
