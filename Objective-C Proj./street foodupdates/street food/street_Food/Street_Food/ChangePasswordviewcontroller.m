//
//  ChangePasswordviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "ChangePasswordviewcontroller.h"
#import "homepageviewcontroller.h"
#import "home_pageviewcontroller.h"
#import "accountviewcontroller.h"

#import "AppDelegate.h"

@interface ChangePasswordviewcontroller ()
{
    AppDelegate *appDel;
}
@end

@implementation ChangePasswordviewcontroller
@synthesize txt_oldpassword,txt_newpassword,txt_verify,btn_save,view_pass,view_changepass;

@synthesize urlstring;
@synthesize defaultConfigObject;
@synthesize defaultSession;
@synthesize urlRequest;
@synthesize params;
@synthesize dataTask;
@synthesize responsedata;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    view_pass.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_pass.clipsToBounds = YES;
    view_pass.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_pass.layer.borderWidth = 1.0;
    view_pass.layer.cornerRadius = 6.0;
    
    view_changepass.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_changepass.clipsToBounds = YES;
    view_changepass.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_changepass.layer.borderWidth = 1.0;
    view_changepass.layer.cornerRadius = 6.0;
    
    txt_verify.layer.cornerRadius = 5.0;
    txt_verify .clipsToBounds = YES;
    
    txt_oldpassword.layer.cornerRadius = 5.0;
    txt_oldpassword .clipsToBounds = YES;
    
    txt_newpassword.layer.cornerRadius = 5.0;
    txt_newpassword .clipsToBounds = YES;
    
    btn_save.layer.cornerRadius = 5.0;
    btn_save .clipsToBounds = YES;



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

- (IBAction)btn_saveaction:(id)sender {
    
    
    //AppDelegate *appDel;
    appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //_lblUserText.text = appDel.userEmailID;
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL *url = [NSURL URLWithString:@"http://studentzone.16mb.com/select.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    params =[NSString stringWithFormat:@"Query=update tblUser set PASS_WORD = '%@' where emailId='%@' and PASS_WORD='%@'",txt_newpassword.text,appDel.userEmailID,txt_oldpassword.text];
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
                                            
                                            //NSString *strStatus = [dict valueForKey:@"status"];
                                        }
                                        
                                        // _lbst.text= @"Password reset to your register Mobile No.!";
                                        
                                        
                                        
                                    }
                                }];
    [dataTask resume];
    

}
- (IBAction)btn_backchange:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
