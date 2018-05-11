//
//  LoginViewController.m
//  IncomeTax
//
//  Created by tops on 4/13/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationStep2.h"
#import "DBoperation.h"
#import "ModuleViewController.h"
#import "forgotpassViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
UIAlertView *alert;
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"iphone.jpg"]];
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


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if([[alertView textFieldAtIndex:0]text].length>0 && [[alertView textFieldAtIndex:1]text].length>0)
    {
        
        DBoperation *dblog=[[DBoperation alloc]init];
        
        NSString *Query=[[NSString alloc]initWithFormat:@"select email from regi where email='%@'and pass='%@'",[[alertView textFieldAtIndex:0]text],[[alertView textFieldAtIndex:1]text]];
        
        NSMutableArray *ArrGet=[[NSMutableArray alloc]init];
        ArrGet=[dblog SelectId:Query];
        
        NSLog(@"%d",ArrGet.count);
        
        if (ArrGet.count>0)
        {
            
            alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Login Succesfully..." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            /*  home=[[HomeView alloc]init];
             [self.navigationController pushViewController:home animated:YES];*/
            ModuleViewController *regsnext =[self.storyboard instantiateViewControllerWithIdentifier:@"moduleview"];
            [self.navigationController pushViewController:regsnext animated:YES];
            
            
        }
        else
        {
            alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Username & Passwords are Wrong..." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
        }
        
    }
    else
    {
        alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please fill Fields" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    
}


- (IBAction)btnlogin:(id)sender {
    UIAlertView  *alt=[[UIAlertView alloc]initWithTitle:@"LOGIN" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Login", nil];
    
    [alt setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    UITextField *text1 = [alt textFieldAtIndex:0];
    text1.placeholder=@"User name";
    [[alt textFieldAtIndex:1] setSecureTextEntry:YES];
    UITextField *text2= [alt textFieldAtIndex:1];
    text2.placeholder=@"Password";
    
    alt.tag = 2;
    [alt show];

}

- (IBAction)btnregister:(id)sender {
    RegistrationStep2 *regsnext =[self.storyboard instantiateViewControllerWithIdentifier:@"rgstep2"];
    [self.navigationController pushViewController:regsnext animated:YES];
}

- (IBAction)btnforgot:(id)sender {
    forgotpassViewController *fgt=[self.storyboard instantiateViewControllerWithIdentifier:@"frgt"];
    [self.navigationController pushViewController:fgt animated:YES];

}
@end
