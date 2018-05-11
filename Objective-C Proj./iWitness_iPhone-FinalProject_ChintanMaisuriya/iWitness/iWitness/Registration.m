//
//  Registration.m
//  iWitness
//
//  Created by MAC OS on 5/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "Registration.h"

#define REGEX_NAME @".{3,10}$"
#define REGEX_LASTNAME @".{3,10}$"
#define REGEX_ADDRESS @".{0,50}$"
#define REGEX_CONTACT @"(^[789])*[0-9]{10}$"
#define REGEX_EMAIL @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_CONFIRMPASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_ADDHARCARD @"[1-9]+[0-9]{12,12}"

@interface Registration ()

@end

@implementation Registration
@synthesize txtFName,txtSurname,txtAddress1,txtContact,txtEmail,txtUsername,txtPassword,txtConfirmPWD,txtAadharNo;

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    [self setValidation];
    
    //[_viewRegistration setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"white.png"]]];
    //_viewRegistration.backgroundColor=[UIColor colorWithRed:201/255 green:219/255 blue:220/255 alpha:0.15];
    _viewRegistration.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewRegistration.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewRegistration.layer.shadowOffset=CGSizeMake(0,0);
    _viewRegistration.layer.shadowOpacity=0.5;
    _viewRegistration.layer.shadowRadius=2.0;
    _viewRegistration.layer.cornerRadius=5;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
 {
   [self.view endEditing:YES];
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

- (IBAction)btnRegister:(id)sender
  {
      if ([txtPassword.text isEqualToString:txtConfirmPWD.text])
      {
      NSString *regUserStr = [NSString stringWithFormat:@"http://localhost/iWitness_WS/registration.php?ufname=%@&ulname=%@&uadd=%@&ucont=%@&uemail=%@&un=%@&upwd=%@&uaadhar=%@",txtFName.text,txtSurname.text,txtAddress1.text,txtContact.text,txtEmail.text,txtUsername.text,txtPassword.text,txtAadharNo.text];
      
      NSURL *regURL = [NSURL URLWithString:regUserStr];
      NSURLRequest *regREQ = [NSURLRequest requestWithURL:regURL];
      
    
      NSURLSession *regSession = [NSURLSession sharedSession];
      NSURLSessionDataTask *regSTask = [regSession dataTaskWithRequest:regREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                     {
                                         NSString *regStrName = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                                        // NSLog(@"%@",regStrName);
                                     }];
      [regSTask resume];
          
          
          txtFName.text=nil;
          txtSurname.text=nil;
          txtAddress1.text=nil;
          txtContact.text=nil;
          txtEmail.text=nil;
          txtUsername.text=nil;
          txtPassword.text=nil;
          txtConfirmPWD.text=nil;
          txtAadharNo.text=nil;
          
      }else{
          
          UIAlertController *regErrorAlt = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Please confrim your password" preferredStyle:UIAlertControllerStyleAlert];
          
          UIAlertAction *OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
             {
                [regErrorAlt dismissViewControllerAnimated:YES completion:nil];
             }];
          [regErrorAlt addAction:OK];
          [self presentViewController:regErrorAlt animated:YES completion:nil];
          
          txtConfirmPWD.text=nil;
      }
      
  }
                                               
- (IBAction)btnRegCancel:(id)sender
  {
      [self.navigationController popToRootViewControllerAnimated:YES];
  }

-(void)setValidation{
    [txtFName addRegx:REGEX_NAME withMsg:@"Please enter valid name"];
    txtFName.presentInView=self.view;
    
    [txtSurname addRegx:REGEX_LASTNAME withMsg:@"Please enter valid lastname"];
    txtSurname.presentInView=self.view;
    
    [txtAddress1 addRegx:REGEX_ADDRESS withMsg:@"Please enter valid address"];
    txtAddress1.presentInView=self.view;
    
    [txtContact addRegx:REGEX_CONTACT withMsg:@"Please enter valid contact"];
    txtContact.presentInView=self.view;
    
    [txtEmail addRegx:REGEX_EMAIL withMsg:@"Please enter vallid email address"];
    txtEmail.presentInView=self.view;
    
    [txtUsername addRegx:REGEX_USER_NAME_LIMIT withMsg:@"Please enter valid username"];
    txtUsername.presentInView=self.view;
    
    [txtPassword addRegx:REGEX_PASSWORD withMsg:@"Please enter valid password"];
    txtPassword.presentInView=self.view;
    
    [txtConfirmPWD addRegx:REGEX_CONFIRMPASSWORD withMsg:@"Please enter valid password"];
    txtConfirmPWD.presentInView=self.view;
    
    [txtAadharNo addRegx:REGEX_ADDHARCARD withMsg:@"Please enter valid adharcard number"];
    txtAadharNo.presentInView=self.view;
}

@end
