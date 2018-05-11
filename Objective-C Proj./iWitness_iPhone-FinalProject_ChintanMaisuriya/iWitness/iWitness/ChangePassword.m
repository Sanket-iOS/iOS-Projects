//
//  ChangePassword.m
//  iWitness
//
//  Created by MACOS on 7/6/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "ChangePassword.h"
#import "HomeTab.h"

@interface ChangePassword ()

@end

@implementation ChangePassword{
    NSString *checkStatus;
    NSString *oldPWD;
}
@synthesize txtOldPWD,txtNewPWD,txtConfirmNewPWD;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    _viewChangePWD.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewChangePWD.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewChangePWD.layer.shadowOffset=CGSizeMake(0,0);
    _viewChangePWD.layer.shadowOpacity=0.5;
    _viewChangePWD.layer.shadowRadius=2.0;
    _viewChangePWD.layer.cornerRadius=5;

    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    strGetUOpwd=[uDef valueForKey:@"UOpwd"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)btnChangePWD:(id)sender {
    
    oldPWD = txtOldPWD.text;
    
    if ([oldPWD isEqualToString:strGetUOpwd])
    {
        if (![txtNewPWD.text isEqualToString:oldPWD])
        {
            NSString *strCP = [NSString stringWithFormat:@"http://localhost/iWitness_WS/changepwd.php?newPWD=%@&uID=%@",txtNewPWD.text,strGetUID];
            NSURL *urlCP = [NSURL URLWithString:strCP];
            NSURLRequest *urlREQCP = [NSURLRequest requestWithURL:urlCP];
            NSURLSession *cpSession = [NSURLSession sharedSession];
            
            NSURLSessionDataTask *cpSDTask = [cpSession dataTaskWithRequest:urlREQCP completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                checkStatus = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            
            if ([checkStatus isEqualToString:@"success\n"]){
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hola!" message:@"Your password changed successfully" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                    txtOldPWD.text=Nil;
                    txtNewPWD.text=Nil;
                    txtConfirmNewPWD.text=Nil;
                    
                    HomeTab *navHomeTab = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
                    [self.navigationController pushViewController:navHomeTab animated:NO];
                }];
                [alert addAction:Ok];
                dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
            }else{
            
                UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Your password is not updated. Please try again." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
                    txtOldPWD.text=Nil;
                    txtNewPWD.text=Nil;
                    txtConfirmNewPWD.text=Nil; }];
                [errorAlert addAction:Ok];
                dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:errorAlert animated:YES completion:nil];});
            }
         }];
      [cpSDTask resume];
    }else{
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Your new password should not be as same as your old one" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
                txtOldPWD.text=Nil;
                txtNewPWD.text=Nil;
                txtConfirmNewPWD.text=Nil; }];
            [errorAlert addAction:Ok];
            dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:errorAlert animated:YES completion:nil];});
        }
    }
    else{
        UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"please enter correct old passwprd" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            txtOldPWD.text=Nil;
            txtNewPWD.text=Nil;
            txtConfirmNewPWD.text=Nil;
        }];
        [errorAlert addAction:Ok];
        dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:errorAlert animated:YES completion:nil];});
    }
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
