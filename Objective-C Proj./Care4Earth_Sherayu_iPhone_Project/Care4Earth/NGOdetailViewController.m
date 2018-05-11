//
//  NGOdetailViewController.m
//  Care4Earth
//
//  Created by tops on 4/14/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "NGOdetailViewController.h"

@interface NGOdetailViewController ()

@end

@implementation NGOdetailViewController

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

- (IBAction)btnback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
