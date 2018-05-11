//
//  ViewController.m
//  IncomeTax
//
//  Created by tops on 3/16/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

#import "RegistrationStep2.h"
#import "DBoperation.h"
#import "CheckReturnStatus.h"
#import "ModuleViewController.h"
#import "forgotpassViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//UIAlertView *alert;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    //[self.navigationController setNavigationBarHidden:YES];
    [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector:@selector(onTick)userInfo: nil repeats:YES];
}
int count=0;
-(void)onTick
{
  //  self.view.alpha=0.1;
    if (count==5) {
      /*  UIAlertView  *alt=[[UIAlertView alloc]initWithTitle:@"LOGIN" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Login", nil];
        
        [alt setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
        UITextField *text1 = [alt textFieldAtIndex:0];
        text1.placeholder=@"User name";
        [[alt textFieldAtIndex:1] setSecureTextEntry:YES];
        UITextField *text2= [alt textFieldAtIndex:1];
        text2.placeholder=@"Password";
        
        alt.tag = 2;
        [alt show];*/
       LoginViewController  *Login =[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:Login animated:YES];

    }
    
        count++;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)btn_signup:(id)sender {
/*    RegistrationStep2 *regsnext =[self.storyboard instantiateViewControllerWithIdentifier:@"rgstep2"];
    [self.navigationController pushViewController:regsnext animated:YES];*/

    }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
/*
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
            /*ModuleViewController *regsnext =[self.storyboard instantiateViewControllerWithIdentifier:@"moduleview"];
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
    }*/
    
    
}


- (IBAction)btnlogin:(id)sender {
  /*UIAlertView  *alt=[[UIAlertView alloc]initWithTitle:@"LOGIN" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Login", nil];
    
    [alt setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    UITextField *text1 = [alt textFieldAtIndex:0];
    text1.placeholder=@"User name";
    [[alt textFieldAtIndex:1] setSecureTextEntry:YES];
    UITextField *text2= [alt textFieldAtIndex:1];
    text2.placeholder=@"Password";
    
    alt.tag = 2;
    [alt show];
    

  /*
    AppDelegate   *appdel2=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdel2.strEmail=txtuname.text;
    
    AppDelegate   *appdel3=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    appdel3.strpassword=txtpwd.text;
    
    
    if ([txtuname.text isEqualToString:@""]||[txtpwd.text isEqualToString:@""]) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Enter Usernae And Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    else{
        DBoperation *data=[[DBoperation alloc]init];
        NSString *Strquery=[[NSString alloc]initWithFormat:@"select email from regi where email='%@'and pass='%@'",txtuname.text,txtpwd.text];

    NSString *username=[[NSString alloc]init];
    
    username= [data userlogin:Strquery];
    NSLog(@"%@",username);
    if ([username isEqualToString:@""])
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Username And Password Wrong" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Login Succesfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];
        
        ModuleViewController *regsnext =[self.storyboard instantiateViewControllerWithIdentifier:@"moduleview"];
        [self.navigationController pushViewController:regsnext animated:YES];

    }
  }

}
*/
}
- (IBAction)frgtpassword:(id)sender {
    
    /*forgotpassViewController *fgt=[self.storyboard instantiateViewControllerWithIdentifier:@"frgt"];
    [self.navigationController pushViewController:fgt animated:YES];*/
}
@end
