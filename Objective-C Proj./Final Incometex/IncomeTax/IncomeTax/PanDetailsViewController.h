//
//  PanDetailsViewController.h
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtfname;
@property (weak, nonatomic) IBOutlet UITextField *txtmname;
@property (weak, nonatomic) IBOutlet UITextField *txtlname;
@property (weak, nonatomic) IBOutlet UITextField *txtdate;
- (IBAction)btnPAN:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;

@end
