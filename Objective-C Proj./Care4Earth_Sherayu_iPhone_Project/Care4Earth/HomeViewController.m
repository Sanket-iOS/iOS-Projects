//
//  HomeViewController.m
//  Care4Earth
//
//  Created by tops on 2/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "HomeViewController.h"
#import "RegisterationViewController.h"
#import "HomeMenuViewController.h"
#import "EventHomeViewController.h"
#import "DropViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize txtemail,txtPassword;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.navigationItem setHidesBackButton:YES];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Unknown.png"] forBarMetrics:UIBarMetricsDefault];
  

    self.navigationItem.title=@"Care For Earth";
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender
{
    /*NSURL *url=[[NSURL alloc]initWithString:[NSString stringWithFormat:@" http://carefourearth.somee.com/api/login/getlogin/?email=%@&password=%@",txtemail.text,txtPassword.text]];
    
    
    NSLog(@"%@",url);
    
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:Request delegate:self];
    
    NSLog(@"%@",con.description);*/

    // HomeMenuViewController *drop=[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
   // [self.navigationController pushViewController:drop animated:YES];
    
    NSString *Str=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/login/getlogin/?email=%@&password=%@",txtemail.text,txtPassword.text];
    
   
    
    NSURL *Url=[[NSURL alloc]initWithString:Str];
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:Url];
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSLog(@"%@",[response description]);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *st=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    NSString *s = [NSString stringWithFormat:@"\"Login Sucessfully\""];
    
    NSLog(@"%@",s);
    
    NSLog(@"%@",st);
    
    if ([st isEqualToString:s]==NULL)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Login Status" message:@"Login Successfully." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
        
        HomeMenuViewController *drop=[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
        [self.navigationController pushViewController:drop animated:YES];
        
        
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Login Status" message:@"Insert your username or password" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
        
        
    }
    txtemail.text=@"";
    txtPassword.text=@"";
    
    
}

    
    
/*- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([str isEqualToString:@""])
    {
        NSLog(@"invalid");
    }
    else
    {
        NSLog(@"true");
    }
    
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    
}*/
- (IBAction)btnNew:(id)sender {
    RegisterationViewController *reg =[[RegisterationViewController alloc]initWithNibName:@"RegisterationViewController" bundle:nil];
    [self.navigationController pushViewController:reg animated:YES];
}
@end
