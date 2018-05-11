//
//  tttttttViewController.h
//  Myproject
//
//  Created by mac on 3/17/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "ViewController.h"

@interface tttttttViewController : ViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *lblname;
@property (strong, nonatomic) IBOutlet UIButton *btnimage;

@property (weak, nonatomic) IBOutlet UILabel *lblprice;

@property (weak, nonatomic) IBOutlet UITextView *txtdescription;

@property (weak, nonatomic) IBOutlet UITextView *txtfeature;
@property (weak, nonatomic) IBOutlet UITextField *txtstatus;

@property(weak,nonatomic)NSString *strpn;
@property(weak,nonatomic)NSString *strpn1;
@property(weak,nonatomic)NSString *strpn2;
@property(weak,nonatomic)NSString *strpn3;
@property(weak,nonatomic)NSString *strpn4;
@property(weak,nonatomic)NSString *strpn5;
@property(weak,nonatomic)NSString *strpn6;
@property(weak,nonatomic)NSString *strpn7;
- (IBAction)back:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *lbldiscount;

- (IBAction)btnnext:(id)sender;

@end
