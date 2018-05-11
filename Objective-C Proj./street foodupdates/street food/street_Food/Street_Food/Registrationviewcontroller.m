//
//  Registrationviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/8/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "Registrationviewcontroller.h"
#import "ViewController.h"

@interface Registrationviewcontroller ()

@end

@implementation Registrationviewcontroller
@synthesize view_reg,txt_email,txt_mbno,reg_pro,view_streetfood,txt_userbname;
//database coding
@synthesize urlstring;
@synthesize defaultConfigObject;
@synthesize defaultSession;
@synthesize urlRequest;
@synthesize params;
@synthesize dataTask;
@synthesize responsedata;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage * imgw = [UIImage imageNamed:@"fff2.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    //animation code for roundcurve
    UIView *registrationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txt_email.leftView = registrationView;
    txt_email .leftViewMode = UITextFieldViewModeAlways;
    txt_email.layer.cornerRadius = 2.0;
    txt_email.clipsToBounds = YES;
    
    UIView *regView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txt_mbno.leftView = regView;
    txt_mbno.leftViewMode = UITextFieldViewModeAlways;
    txt_mbno.layer.cornerRadius = 2.0;
    txt_mbno.clipsToBounds = YES;
    
    reg_pro.layer.cornerRadius = 5.0;
    reg_pro.clipsToBounds = YES;
    

    view_reg.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.10];
    view_reg.clipsToBounds = YES;
    view_reg.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_reg.layer.borderWidth = 1.0;
    view_reg.layer.cornerRadius = 6.0;
    
    view_streetfood.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_streetfood.clipsToBounds = YES;
    view_streetfood.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_streetfood.layer.borderWidth = 1.0;
    view_streetfood.layer.cornerRadius = 6.0;

    
    
    
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

- (IBAction)reg_action:(id)sender
{
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/login.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"reg=1&emailid=%@&username=%@&MobileNumber=%@",txt_email.text,txt_userbname.text,txt_mbno.text];
    
    [urlRequest setHTTPMethod:@"POST"];
    
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        
                                       
                                        
                                        if(dict!=nil)
                                        {
                                            if(txt_userbname !=nil && txt_email !=nil && txt_mbno !=nil)
                                            {
                                                NSString *strStatus = [dict valueForKey:@"status"];
                                                if([strStatus containsString:@"Not"])
                                                {
                                                    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
                                                    animation.keyPath = @"position.x";
                                                    animation.values = @[ @0, @10, @-10, @10, @0 ];
                                                    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
                                                    animation.duration = 0.4;
                                                    
                                                    animation.additive = YES;
                                                 [txt_email.layer addAnimation:animation forKey:@"shake"];
                                                    [txt_userbname.layer addAnimation:animation forKey:@"shake"];
                                                [txt_mbno.layer addAnimation:animation forKey:@"shake"];
                                                }
                                                else
                                                {
                                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                                }
                                            }
                                        }
                                                                            }
                                }];
    [dataTask resume];
    

    
}

- (IBAction)mbno_action:(id)sender
{
    

}
- (IBAction)btn_backreg:(id)sender
{
    ViewController *loginpage =[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
    [self.navigationController pushViewController:loginpage animated:YES];
    
}
@end
