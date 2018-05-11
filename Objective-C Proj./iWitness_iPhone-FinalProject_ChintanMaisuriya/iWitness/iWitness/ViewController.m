//
//  ViewController.m
//  iWitness
//
//  Created by MAC OS on 5/26/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "ViewController.h"
#import "HomeTab.h"
#import "Suggestions.h"
#import "ForgotPassword.h"

#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"

@interface ViewController ()

@end

@implementation ViewController{
    UIImage *uPic;
}
@synthesize txtUsername,txtPassword;

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    
    [super viewDidLoad];
    
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setValidation];
    
    getData = [[NSMutableArray alloc]init];
    
//    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
//    
//    if ([uDef valueForKey:@"UID"]!=nil) {
//        HomeTab *navHome = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
//        [self.navigationController pushViewController:navHome animated:NO];
//    }
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (IBAction)btnLogIn:(id)sender {
    
    NSString *strLogIn = [NSString stringWithFormat:@"http://localhost/iWitness_WS/login.php?userName=%@&pwd=%@",txtUsername.text,txtPassword.text];
    
    NSURL *logInURL = [NSURL URLWithString:strLogIn];
    NSURLRequest *logInREQ = [NSURLRequest requestWithURL:logInURL];
    
    NSURLSession *logInSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *logInSTask = [logInSession dataTaskWithRequest:logInREQ completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        
        getData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        {
            if ([getData count]>0)
            {
                NSString *getUName=[[getData valueForKey:@"UName"]objectAtIndex:0];
                NSString *getUID = [[getData valueForKey:@"UID"]objectAtIndex:0];
                NSString *getOpwd = [[getData valueForKey:@"Password"]objectAtIndex:0];
            
                //NSLog(@"Login sucessfull");
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
                [uDef setValue:getUName forKey:@"uName"];
                [uDef setValue:getUID forKey:@"UID"];
                [uDef setValue:getOpwd forKey:@"UOpwd"];
                    
                HomeTab *navHomeTab = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
                [self.navigationController pushViewController:navHomeTab animated:NO];
                    
              });
            }
            else
            {
                UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"InvelidUser" message:@"Registre Here" preferredStyle:UIAlertControllerStyleActionSheet];
                
                UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
                                   { //NSLog(@"OK");
                                   }];
                
                [alert addAction:ok];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self presentViewController:alert animated:YES completion:nil];
                });
            }
        }
     }];
    
    [logInSTask resume];
}


- (IBAction)btnForgotPWD:(id)sender {
    ForgotPassword *navFPWD = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPassword_SB"];
    [self.navigationController pushViewController:navFPWD animated:YES];
}

-(void)setValidation{
    [txtUsername addRegx:REGEX_USER_NAME_LIMIT withMsg:@"Please enter valid username"];
    txtUsername.presentInView=self.view;
    
    [txtPassword addRegx:REGEX_PASSWORD withMsg:@"Please enter valid password"];
    txtPassword.presentInView=self.view;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBack:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = [storyboard instantiateInitialViewController];
}
@end
