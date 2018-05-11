//
//  ItemdescriptionViewController.h
//  Myproject
//
//  Created by tops on 2/14/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemdescriptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *txtdescription;
- (IBAction)btnwishlist:(id)sender;

- (IBAction)btnorder:(id)sender;
@property(weak,nonatomic)NSString *strpn;
- (IBAction)back:(id)sender;

- (IBAction)btnnew:(id)sender;

@end
