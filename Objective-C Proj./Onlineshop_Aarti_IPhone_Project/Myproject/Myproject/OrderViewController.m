//
//  OrderViewController.m
//  Myproject
//
//  Created by tops on 2/15/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "OrderViewController.h"
#import "complainViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btncomplain:(id)sender {
    complainViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"complain"];
    [self.navigationController pushViewController:view1 animated:YES];
    }

- (IBAction)btnorder:(id)sender {
}

- (IBAction)btnamount:(id)sender {
}

- (IBAction)btnshippingrate:(id)sender {
}

- (IBAction)btnstate:(id)sender {
}

- (IBAction)btncity:(id)sender {
}

- (IBAction)btndate:(id)sender {
}



- (IBAction)btnprice:(id)sender {
}

- (IBAction)btnname:(id)sender {
}

- (IBAction)btnquantity:(id)sender {
}
@end
