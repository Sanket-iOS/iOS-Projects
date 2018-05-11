//
//  ViewController.m
//  Myproject
//
//  Created by tops on 12/21/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import "ViewController.h"
#import "loginViewController.h"
#import "registerViewController.h"
#import "productlistViewController.h"
#import "categoryViewController.h"
#import "KASlideShow.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize slideshow;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    slideshow.delegate = self;
    [slideshow setDelay:1]; // Delay between transitions
    [slideshow setTransitionDuration:.5]; // Transition duration
    [slideshow setTransitionType:KASlideShowTransitionFade]; // Choose a transition type (fade or slide)
    [slideshow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [slideshow addImagesFromResources:@[@"rotate1.jpg",@"rotate2.jpg",@"rotate3.jpg",@"rotate4.jpg",@"DiamondWatch.jpg",@"WomenShoes.jpg"]]; // Add images from resources
    [slideshow addGesture:KASlideShowGestureTap]; // Gesture to go previous/next directly on the image
    
    [slideshow start];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
       //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"apple.jpg"]]];
    //self.view.backgroundColor=[UIColor clearColor];
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnsignin:(id)sender {
    loginViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
    [self.navigationController pushViewController:view1 animated:YES];

}
- (IBAction)btnregister:(id)sender {
    
    registerViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"reg"];
    [self.navigationController pushViewController:view1 animated:YES];
    
}

- (IBAction)btncategory:(id)sender {
    
    categoryViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"cell"];
    [self.navigationController pushViewController:view1 animated:YES];
}

- (IBAction)btnnotification:(id)sender {
    UILocalNotification* local = [[UILocalNotification alloc]init];
    if (local)
    {
        local.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        local.alertBody = @"Hey this is my first local notification!!!";
        local.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:local];
        
    }
}

- (IBAction)posttofacebook:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"First post from my iPhone app"];
        [controller addURL:[NSURL URLWithString:@"http://www.facebook.com"]];
        [controller addImage:[UIImage imageNamed:@"socialsharing-facebook-image.jpg"]];
        [self presentViewController:controller animated:YES completion:Nil];
    }
}
@end
