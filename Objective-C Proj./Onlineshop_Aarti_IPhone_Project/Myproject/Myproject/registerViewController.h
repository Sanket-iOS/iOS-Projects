//
//  registerViewController.h
//  Myproject
//
//  Created by tops on 12/24/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerViewController : UIViewController
{
    NSArray *countryarr;
    NSArray *cityarr;
    BOOL matched;
        NSString *str;
    BOOL length;
    NSString *txtcity;
    NSString *txtcounry;
}
@property (strong, nonatomic) IBOutlet UITextField *txtfirstname;
@property (strong, nonatomic) IBOutlet UITextField *txtlastname;
@property (strong, nonatomic) IBOutlet UITextField *txtaddress;
@property (strong, nonatomic) IBOutlet UITextField *txtmobileno;
@property (strong, nonatomic) IBOutlet UITextField *txtpincode;
@property (strong, nonatomic) IBOutlet UITextField *txtemailid;
@property (strong, nonatomic) IBOutlet UITextField *txtpassword;
- (IBAction)btncountry:(id)sender;
- (IBAction)btncity:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtrepassword;

@property (strong, nonatomic) IBOutlet UILabel *lblcity;
@property (strong, nonatomic) IBOutlet UILabel *lblcountry;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction)btnregister:(id)sender;
@end
