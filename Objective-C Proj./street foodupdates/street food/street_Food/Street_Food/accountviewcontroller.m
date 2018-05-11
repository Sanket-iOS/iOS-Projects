//
//  accountviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/26/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "accountviewcontroller.h"
#import "ChangePasswordviewcontroller.h"
#import "usersettingviewcontroller.h"
#import "home_pageviewcontroller.h"
#import "ViewController.h"
#import "operactionmodel.h"
#import "AppDelegate.h"

@interface accountviewcontroller ()
{
    operactionmodel *model;
     AppDelegate *appDel;
    
}
@end

@implementation accountviewcontroller
@synthesize view_account,view_accountpage;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    view_account.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.10];
    view_account.clipsToBounds = YES;
    view_account.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_account.layer.borderWidth = 1.0;
    view_account.layer.cornerRadius = 6.0;
    
    view_accountpage.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_accountpage.clipsToBounds = YES;
    view_accountpage.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_accountpage.layer.borderWidth = 1.0;
    view_accountpage.layer.cornerRadius = 6.0;

    
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

- (IBAction)btn_editaction:(id)sender
{
    usersettingviewcontroller *usersettingpage =[self.storyboard instantiateViewControllerWithIdentifier:@"usersettingpage"];
    [self.navigationController pushViewController:usersettingpage animated:YES];
    
}

- (IBAction)btn_changepwdaction:(id)sender
{
    ChangePasswordviewcontroller *changepasspage =[self.storyboard instantiateViewControllerWithIdentifier:@"changepasspage"];
    [self.navigationController pushViewController:changepasspage animated:YES];

}

- (IBAction)btn_backaction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btn_logout:(id)sender
{
    appDel.usts=@"Logout";
//       
  model = [[operactionmodel alloc]init];
    [model CommandMethod:@"delete from tbl_UserActive"];
    
    //to pop from all the pages (signout to login pages)
    [self.navigationController popToRootViewControllerAnimated:YES];
   // ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
   // [self.navigationController pushViewController:loginpage animated:YES];

}
@end
