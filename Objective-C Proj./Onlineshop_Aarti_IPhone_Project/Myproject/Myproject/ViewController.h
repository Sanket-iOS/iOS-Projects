//
//  ViewController.h
//  Myproject
//
//  Created by tops on 12/21/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KASlideShow.h"
#import <Social/Social.h>
@interface ViewController : UIViewController<KASlideShowDelegate>

- (IBAction)btnsignin:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imgview;
- (IBAction)btnregister:(id)sender;
- (IBAction)btncategory:(id)sender;

- (IBAction)btnnotification:(id)sender;
@property (strong,nonatomic) IBOutlet KASlideShow * slideshow;
- (IBAction)posttofacebook:(id)sender;

@end
