//
//  RSSDetailViewController.m
//  Care4Earth
//
//  Created by MAC on 3/23/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "RSSDetailViewController.h"

@interface RSSDetailViewController ()

@end

@implementation RSSDetailViewController
@synthesize url;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //url1=[NSURL URLWithString:url];
  NSMutableURLRequest * url1 = [NSURL URLWithString:url];
   // NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    [self.webview loadRequest:url1];
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnback:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
