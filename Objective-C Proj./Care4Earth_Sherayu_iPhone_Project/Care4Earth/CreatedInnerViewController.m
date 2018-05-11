//
//  CreatedInnerViewController.m
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "CreatedInnerViewController.h"
#import "EventHomeViewController.h"
@interface CreatedInnerViewController ()

@end

@implementation CreatedInnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)btncancel:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Successfully Canceled" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag = 100;
    [alert show];

}

- (IBAction)btnback:(id)sender {
    EventHomeViewController *create=[[EventHomeViewController alloc]initWithNibName:@"EventHomeViewController" bundle:nil];
    [self.navigationController pushViewController:create animated:YES];
}
@end
