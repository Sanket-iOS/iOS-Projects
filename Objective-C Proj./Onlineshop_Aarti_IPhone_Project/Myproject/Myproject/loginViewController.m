//
//  loginViewController.m
//  Myproject
//
//  Created by tops on 1/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "loginViewController.h"
#include "DBHandler.h"
#import "registerViewController.h"
#import "forgetpasswordViewController.h"
#import "ordViewController.h"
#import "tttttttViewController.h"
#import "collectionViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController
@synthesize txtpassword,txtemail;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    //self.view.backgroundColor=[UIColor clearColor];    // Do any additional setup after loading the view.
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

- (IBAction)changesegment:(id)sender {
    UISegmentedControl *segment=(UISegmentedControl *)sender;
    NSInteger selectedsegment=segment.selectedSegmentIndex;
    if(selectedsegment==0)
    {
        UIViewController *regView=[self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController pushViewController:regView animated:YES];
    }
    else if (selectedsegment==1)
    {
        UIViewController *regView=[self.storyboard instantiateViewControllerWithIdentifier:@"register"];
        [self.navigationController pushViewController:regView animated:YES];
    }
}
- (IBAction)btnshow:(id)sender {
}

- (IBAction)btnforgetpass:(id)sender {
    forgetpasswordViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"forgot"];
    [self.navigationController pushViewController:view1 animated:YES];
}
NSInteger countErr=0;
- (IBAction)btnsign:(id)sender {
   /* NSURL *url=[[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://shopapi.somee.com/api/values/GetLogin?EmailID=%@&Password=%@",txtemail.text,txtpassword.text]];
    
    
    NSLog(@"%@",url);
    
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:Request delegate:self];
    
    NSLog(@"%@",con.description);*/
    
    
        if([[txtemail text] isEqualToString:@""] || [[txtpassword text] isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"message" message:@"One of them is Empty so Sign in Failed!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        countErr=1;
    }
    
    else if (![self validateEmail:[txtemail text]])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter Valid Email ID." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr=1;
        
    }
    else if(txtpassword.text.length<8)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter Password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr=1;
        
    }
    
    else
    {
        
        NSURL *url=[[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://shopapi.somee.com/api/values/GetLogin?EmailID=%@&Password=%@",txtemail.text,txtpassword.text]];
        
        
        NSLog(@"%@",url);
        
        NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
        NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:Request delegate:self];
        
        NSLog(@"%@",con.description);
        
        /*([a is])
        {
            
        UIViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"cell"];
            [self.navigationController pushViewController:category1 animated:YES];
        }*/
        /*NSString *query=[NSString stringWithFormat:@"select EmailID,Password from Login_Master"];
        DBHandler *db=[[DBHandler alloc]init];
        BOOL result=[db DMLOperations:query];
        if(result)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Operation Successfully completed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }    
         */}
    
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([str isEqualToString:@"true"])
    {
        NSLog(@"true");
        UIViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"cell"];
        [self.navigationController pushViewController:category1 animated:YES];
    }
    else
    {
        NSLog(@"false");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"please enter proper EmailId Or Password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    
}
- (IBAction)changesegment1:(id)sender {
    UISegmentedControl *segment1=(UISegmentedControl *)sender;
    NSInteger selectedsegment=segment1.selectedSegmentIndex;
    if(selectedsegment==0)
    {
        UIViewController *regView=[self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController pushViewController:regView animated:YES];
    }
}

- (IBAction)email:(id)sender {
}

- (IBAction)password:(id)sender {
}

- (IBAction)getstart:(id)sender {
    registerViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"reg"];
    [self.navigationController pushViewController:view1 animated:YES];}

- (IBAction)btnforgotpassword:(id)sender {
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
@end
