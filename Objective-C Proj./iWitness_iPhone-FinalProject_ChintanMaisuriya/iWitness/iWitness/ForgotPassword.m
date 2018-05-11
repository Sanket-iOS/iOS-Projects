//
//  ForgotPassword.m
//  iWitness
//
//  Created by Chintan on 06/09/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "ForgotPassword.h"

@interface ForgotPassword ()

@end

@implementation ForgotPassword
@synthesize txtRegisterMobileNo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=NO;
    getPWD = [[NSArray alloc]init];
    
    _viewFP.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewFP.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewFP.layer.shadowOffset=CGSizeMake(0,0);
    _viewFP.layer.shadowOpacity=0.5;
    _viewFP.layer.shadowRadius=2.0;
    _viewFP.layer.cornerRadius=5;
}

- (IBAction)btnSendOTP:(id)sender {
    
    int i=arc4random() % 9000 + 1000;
    OTPcode= [NSString stringWithFormat:@"%d",i];
    
    NSString *strOTP=[NSString stringWithFormat:@"Your mobile Verification code is %d",i];
    
    NSString *tempOTPmsg=[[NSString alloc]initWithFormat:@"http://localhost/iWitness_WS/Way2SMS-API-master/sendsms.php?uid=7359189897&pwd=9624759491&phone=%@&msg=%@",txtRegisterMobileNo.text,strOTP];
    NSString *strOTPmsg=[tempOTPmsg stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *urlOTP=[NSURL URLWithString:strOTPmsg];
    NSURLRequest *reqOTP=[NSURLRequest requestWithURL:urlOTP];
    NSURLSession *OTPSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *OTPSTask = [OTPSession dataTaskWithRequest:reqOTP completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        
        //dispatch_async(dispatch_get_main_queue(), ^{
            resOTP=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //});
    
    if ([resOTP isEqualToString:@"true"]) {
        UIAlertController * alertOTP = [UIAlertController alertControllerWithTitle: @"Verification" message: @"Enter the OTP code" preferredStyle:UIAlertControllerStyleAlert];
        [alertOTP addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"OTP";
            textField.textColor = [UIColor blueColor];
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.borderStyle = UITextBorderStyleRoundedRect;
        }];
        
        [alertOTP addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSArray * textfields = alertOTP.textFields;
            UITextField * OTPfield = textfields[0];
            
            if ([OTPfield.text isEqualToString:OTPcode]) {
                [self getForgotPWD];
            }else{
                UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Alert!" message:@"Please enter the registerd mobile number" preferredStyle:UIAlertControllerStyleActionSheet];
                
                UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
                                   {
                                       [self dismissViewControllerAnimated:YES completion:nil];
                                   }];
                [alert addAction:ok];
                
                dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
            }
        }]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alertOTP animated:YES completion:nil];
        });
    }
    else {
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Caution" message:@"There is a problem. Please try again later" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alert animated:YES completion:nil];
        });
      }
    }];
    [OTPSTask resume];
}

-(void)getForgotPWD{
    
            NSString *tempSTR=[NSString stringWithFormat:@"http://localhost/iWitness_WS/sendPWDsms.php?regMobNo=%@",txtRegisterMobileNo.text];
            NSString *str=[tempSTR stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSURL *fpURL = [NSURL URLWithString:str];
            NSURLRequest *fpREQ = [NSURLRequest requestWithURL:fpURL];
            NSURLSession *getFPSession = [NSURLSession sharedSession];
            NSURLSessionDataTask *getFPSTask = [getFPSession dataTaskWithRequest:fpREQ completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        
                getPWD = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                
                    if ([getPWD count]>0) {
        
                            PWD=[NSString stringWithFormat:@"Your password for login: %@",[[getPWD objectAtIndex:0]valueForKey:@"Password"]];
        
                            NSString *temp=[[NSString alloc]initWithFormat:@"http://localhost/iWitness_WS/Way2SMS-API-master/sendsms.php?uid=7359189897&pwd=9624759491&phone=%@&msg=%@",txtRegisterMobileNo.text,PWD];
        
                            NSString *str1=[temp stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
                            NSURL *URL=[NSURL URLWithString:str1];
                            NSURLRequest *urlREQ=[NSURLRequest requestWithURL:URL];
        
                            NSURLSession *session = [NSURLSession sharedSession];
                            NSURLSessionDataTask *sdTask = [session dataTaskWithRequest:urlREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
                                NSString *strResponse=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
                                if ([strResponse isEqualToString:@"true"]) {
        
                                    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Caution" message:@"The password is sent to your mobile number" preferredStyle:UIAlertControllerStyleActionSheet];
        
                                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
                                                       {
                                                           [self dismissViewControllerAnimated:YES completion:nil];
                                                       }];
                                    [alert addAction:ok];
        
                                    dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
                                }
                                else {
                                    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Caution" message:@"There is a problem. Please try again later" preferredStyle:UIAlertControllerStyleActionSheet];
        
                                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act)
                                                       {
                                                           [self dismissViewControllerAnimated:YES completion:nil];
                                                       }];
                                    [alert addAction:ok];
        
                                    dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil]; });
                                }
                            }];
                          [sdTask resume];
                    }
            }];
            [getFPSTask resume];
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

@end
