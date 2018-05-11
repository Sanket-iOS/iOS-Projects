//
//  InitialViewController.m
//  iWitness
//
//  Created by Chintan on 11/09/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "InitialViewController.h"
#import "ViewController.h"
#import "Registration.h"
#import "HomeTab.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    
    if ([uDef valueForKey:@"UID"]!=nil) {
        HomeTab *navHome = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
        [self.navigationController pushViewController:navHome animated:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (IBAction)btnSignIn:(id)sender {
    ViewController *navVC = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    [self.navigationController pushViewController:navVC animated:YES];
}

- (IBAction)btnSignUp:(id)sender {
    Registration *navReg = [self.storyboard instantiateViewControllerWithIdentifier:@"Reg_SB"];
    [self.navigationController pushViewController:navReg animated:YES];
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


@end
