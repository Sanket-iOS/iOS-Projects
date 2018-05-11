//
//  forgotviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/14/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "forgotviewcontroller.h"
#import "ViewController.h"
#import "homepageviewcontroller.h"
#import "home_pageviewcontroller.h"


@interface forgotviewcontroller ()

@end

@implementation forgotviewcontroller
@synthesize txt_forgot,view_forgot,view_forgotpass,forgot_pro,resend_pro;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * imgw = [UIImage imageNamed:@"fff2.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    view_forgot.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_forgot.clipsToBounds = YES;
    view_forgot.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_forgot.layer.borderWidth = 1.0;
    view_forgot.layer.cornerRadius = 6.0;
    
    view_forgotpass.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_forgotpass.clipsToBounds = YES;
    view_forgotpass.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_forgotpass.layer.borderWidth = 1.0;
    view_forgotpass.layer.cornerRadius = 6.0;
    
    forgot_pro.layer.cornerRadius = 5.0;
    forgot_pro .clipsToBounds = YES;
    
    resend_pro.layer.cornerRadius = 5.0;
    resend_pro .clipsToBounds = YES;
    
    txt_forgot.layer.cornerRadius = 5.0;
    txt_forgot .clipsToBounds = YES;
    
    
    
    
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

- (IBAction)forgot_action:(UIButton *)sender
{
    
    ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
    [self.navigationController pushViewController:loginpage animated:YES];


}

- (IBAction)resend_action:(id)sender {
}
- (IBAction)btn_backforgotpass:(id)sender
{
    
    ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
    //[self.navigationController popViewControllerAnimated:YES:loginpage animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];

    


}
@end
