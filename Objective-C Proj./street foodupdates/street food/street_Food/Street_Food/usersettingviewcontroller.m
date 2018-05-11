//
//  usersettingviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "usersettingviewcontroller.h"
#import "home_pageviewcontroller.h"
#import "ViewController.h"
#import "accountviewcontroller.h"
#import "AppDelegate.h"
#import "operactionmodel.h"

@interface usersettingviewcontroller (){
    AppDelegate *appDel;
    NSMutableArray *data;
    operactionmodel *model;
    
}

@end

@implementation usersettingviewcontroller
@synthesize txt_username,txt_userid,txt_mbno,txt_emailid,userview,btn_update,view_usersetting;
//database coding
@synthesize urlstring;
@synthesize defaultConfigObject;
@synthesize defaultSession;
@synthesize urlRequest;	
@synthesize params;
@synthesize dataTask;
@synthesize responsedata;
@synthesize strEmailid;


-(void)viewWillAppear:(BOOL)animated
{
   
    appDel = (AppDelegate *)[[UIApplication sharedApplication ]delegate];
    operactionmodel *dbHandller = [[operactionmodel alloc]init];
    txt_emailid.text = appDel.userEmailID;
    //txt_username.text = appDel.userName;
    data= [dbHandller SelectData:@"SELECT * FROM tblUser"];
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/select.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"Query=select * from tblUser where emailId='%@'" ,appDel.userEmailID];
    NSLog(@"%@",params);
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
                                        
                                        NSMutableArray *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        
                                        if(dict!=nil)
                                        {
                                            
                                            txt_username.text = [[dict objectAtIndex:0] objectForKey:@"userName"];
                                            txt_emailid.text = [[dict objectAtIndex:0] objectForKey:@"emailid"];
                                            txt_mbno.text = [[dict objectAtIndex:0] objectForKey:@"MobileNo"];
                                            txt_userid.text = [[dict objectAtIndex:0] objectForKey:@"userid"];
                                            
                                        }
                                        
                                    }
                                }];
    [dataTask resume];
    
    
    
    

        }
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    // Do any additional setup after loading the view.
    userview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    userview.clipsToBounds = YES;
    userview.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    userview.layer.borderWidth = 1.0;
    userview.layer.cornerRadius = 6.0;
    
    view_usersetting.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_usersetting.clipsToBounds = YES;
    view_usersetting.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_usersetting.layer.borderWidth = 1.0;
    view_usersetting.layer.cornerRadius = 6.0;
    
    txt_emailid.layer.cornerRadius = 5.0;
    txt_emailid.clipsToBounds = YES;
    
    txt_mbno.layer.cornerRadius = 5.0;
    txt_mbno.clipsToBounds = YES;

    txt_userid.layer.cornerRadius = 5.0;
    txt_userid.clipsToBounds = YES;
    
    txt_username.layer.cornerRadius = 5.0;
    txt_username.clipsToBounds = YES;

    btn_update.layer.cornerRadius = 5.0;
    btn_update.clipsToBounds = YES;
    
    //database code
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/login.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"edit=1&emailid=%@",self.strEmailid];
    NSLog(@"str emailid:%@",self.strEmailid);
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
                                        
                                        NSLog(@"%@",dict);
                                        
                                        txt_emailid.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"emailid"]];
                                        txt_mbno.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"MobileNo"]];
                                        txt_username.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"userName"]];
                                        txt_userid.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"userid"]];
                                        
                                        
                                    }
                                }];
    [dataTask resume];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_updateprofile:(id)sender
{
    //AppDelegate *appDel;
    appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //_lblUserText.text = appDel.userEmailID;
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/select.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"Query=update tblUser set userName='%@',MobileNo='%@' where emailid='%@' ",txt_username.text,txt_mbno.text,self->appDel.userEmailID];
    NSLog(@"%@",params);
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
                                        
                                        
                                        
                                        
                                        home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
                                        [self.navigationController pushViewController:home animated:YES];
                                        
                                        
                                        
                                        if(dict!=nil)
                                        {
                                            txt_username.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"userName"]];

                                            txt_emailid.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"emailid"]];
                                            txt_mbno.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"MobileNo"]];
                                            txt_userid.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"userid"]];
                                        }
                                        
                                        // _lbst.text= @"Password reset to your register Mobile No.!";
                                        
                                        
                                        
                                    }
                                }];
    [dataTask resume];
    

    
    
}
- (IBAction)btn_backaction:(id)sender
{
    
   [self.navigationController popViewControllerAnimated:YES];
}
@end
