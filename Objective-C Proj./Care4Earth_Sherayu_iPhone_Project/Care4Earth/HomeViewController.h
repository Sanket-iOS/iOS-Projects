//
//  HomeViewController.h
//  Care4Earth
//
//  Created by tops on 2/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<NSURLConnectionDelegate>
- (IBAction)btnLogin:(id)sender;
- (IBAction)btnNew:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtemail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end
