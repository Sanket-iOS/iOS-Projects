//
//  ViewController.m
//  Street_Food
//
//  Created by pinu on 08/09/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "ViewController.h"
#import "Registrationviewcontroller.h"
#import "searchviewcontroller.h"
#import "forgotviewcontroller.h"
#import "aboutusviewcontroller.h"
#import "home_pageviewcontroller.h"


#import "operactionmodel.h"
#import "AppDelegate.h"


@interface ViewController ()
{
    operactionmodel *model;
    AppDelegate *appDel;
}

@end

@implementation ViewController
//properties
@synthesize pwdtext,uitext,btn_signinpro,btn_signoutpro,view_login,blur_view,view_welcome;
//database coding
@synthesize urlstring;
@synthesize defaultConfigObject;
@synthesize defaultSession;
@synthesize urlRequest;
@synthesize params;
@synthesize dataTask;
@synthesize responsedata,statusUser;


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}


-(void)viewWillAppear:(BOOL)animated
{
    //[self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewDidLoad {
    
    model = [[operactionmodel alloc]init];
    
    appDel.usts=@"Login";

    if ([appDel.usts isEqual:@"Logout"]) {
        ViewController *view=[self.storyboard instantiateViewControllerWithIdentifier:@"loginpage"];
        [self.navigationController pushViewController:view animated:YES];
    }
    
    if([appDel.usts isEqual:@"Login"])
    {
    statusUser = [model SelectUser:@"select * from tblUserActive"];
    if(statusUser.count==1)
    {
        appDel.usts=@"LoggedIn";
        appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        appDel.userEmailID = [[statusUser objectAtIndex:0]objectForKey:@"emailid"];
        
        home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
        
        [self.navigationController pushViewController:home animated:YES];
        
    }
    }
    
    //background image
    [super viewDidLoad];
    UIImage * imgw = [UIImage imageNamed:@"fff2.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    blur_view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    blur_view.clipsToBounds = YES;
    blur_view.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    blur_view.layer.borderWidth = 1.0;
    blur_view.layer.cornerRadius = 6.0;
    
    
    view_welcome.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_welcome.clipsToBounds = YES;
    view_welcome.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_welcome.layer.borderWidth = 1.0;
    view_welcome.layer.cornerRadius = 6.0;
    
    
    
    //animation code for roundcurve
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    pwdtext.leftView = paddingView;
    pwdtext.leftViewMode = UITextFieldViewModeAlways;
    pwdtext.layer.cornerRadius = 2.0;
    pwdtext.clipsToBounds = YES;
    
    UIView *pView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    uitext.leftView = pView;
    uitext.leftViewMode = UITextFieldViewModeAlways;
    uitext.layer.cornerRadius = 2.0;
    uitext.clipsToBounds = YES;
    
    
    
    
    btn_signinpro.layer.cornerRadius = 5.0;
    btn_signinpro .clipsToBounds = YES;
    
    btn_signoutpro.layer.cornerRadius = 5.0;
    btn_signoutpro.clipsToBounds = YES;
    
    view_login.layer.cornerRadius = 15.0;
    view_login.clipsToBounds = YES;
    
    [self.navigationController setNavigationBarHidden:YES];
    NSLog(@"superview: %d", self.view.userInteractionEnabled);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pwdaction:(id)sender
{
    
}

- (IBAction)btn_signin:(id)sender {
 
    
        //database code
    
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/login.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"login=1&username=%@&password=%@",uitext.text,pwdtext.text];
    
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
                                            
                                            NSString *strStatus = [dict valueForKey:@"status"];
                                            if ([strStatus isEqualToString:@"1"])
                                            {
                                                NSMutableArray *statusUser = [model SelectUser:[NSString stringWithFormat:@"select * from tblUserActive where emailid='%@'",uitext.text]];
                                                if(statusUser.count==0)
                                                {
                                                    [model CommandMethod:[NSString stringWithFormat:@"Insert into tblUserActive (emailid,islogin) values('%@',1)",uitext.text]];
                                                }
                                                statusUser = [model SelectUser:@"select * from tblUserActive"];
                                                if(statusUser.count==1)
                                                {
                                                    appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                    
                                                    appDel.userEmailID = [[statusUser objectAtIndex:0]objectForKey:@"emailid"];
                                                    
                                                    // homeViewController *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
                                                    
                                                    //[self.navigationController pushViewController:home animated:YES];
                                                    
                                                }
                                                

                                                                                               
                                                home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
                                                [self.navigationController pushViewController:home animated:YES];
                                            }
                                            else
                                            {
                                                CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
                                                animation.keyPath = @"position.x";
                                                animation.values = @[ @0, @10, @-10, @10, @0 ];
                                                animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
                                                animation.duration = 0.4;
                                                animation.additive = YES;
                                                [uitext.layer addAnimation:animation forKey:@"shake"];
                                                [pwdtext.layer addAnimation:animation forKey:@"shake"];
                                            }
                                            

                                            
                                        }
                                        
                                    }
                                }];
    [dataTask resume];
    

    
   }
    

- (IBAction)btn_signup:(id)sender

{
    //navigation connection code
    Registrationviewcontroller *registrationpage=[self.storyboard instantiateViewControllerWithIdentifier:@"registrationpage"];
    //data send one to another place code
    //sec.str =txtname.text;
    [self.navigationController pushViewController:registrationpage animated:YES];
    
    
}

- (IBAction)btn_forgotpwd:(id)sender {
    forgotviewcontroller *forgotpage =[self.storyboard instantiateViewControllerWithIdentifier:@"forgotpage"];
    [self.navigationController pushViewController:forgotpage animated:YES];

}

- (IBAction)btn_skipaction:(id)sender

{
    home_pageviewcontroller *home =(home_pageviewcontroller*)[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:home animated:YES];
    //NSLog(@"this is worked!");
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    app.ChkSkip=@"skip";
}


@end
