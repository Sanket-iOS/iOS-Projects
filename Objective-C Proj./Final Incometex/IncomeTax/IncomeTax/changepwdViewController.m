//
//  changepwdViewController.m
//  IncomeTax
//
//  Created by tops on 3/31/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "changepwdViewController.h"
#import "AppDelegate.h"
#import "DBoperation.h"

@interface changepwdViewController ()

@end

@implementation changepwdViewController
@synthesize newpwd,oldpwd,confirmpwd;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    // Do any additional setup after loading the view.
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

- (IBAction)updatebtn:(id)sender {
    
    
    AppDelegate   *appdel2=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    AppDelegate   *appdel3=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSString *pwd=appdel2.strpassword;
    NSString *email=appdel3.strEmail;
    NSLog(@"%@",pwd);
    NSLog(@"%@",email);
    
    
    if ([newpwd.text isEqualToString:self.confirmpwd.text])
    {
        
        DBoperation *data=[[DBoperation alloc]init];
        
        NSString *strquery=[[NSString alloc] initWithFormat:@"update regi set pass='%@' where pass='%@' and email='%@'",newpwd.text,oldpwd.text,email];
        NSLog(@"%@",strquery);
        
        BOOL st= [data DMLOpearion:strquery];
        
        if(![oldpwd.text isEqualToString:pwd])
        {
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"enter currecte oldpassword" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alrt show];
        }
        else if (st==true)
        {
            
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"password is updated" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alrt show];
        }
        
    }
    /*ViewController *fview=[self.storyboard instantiateViewControllerWithIdentifier:@"fview"];
     [self.navigationController pushViewController:fview animated:YES];*/
    
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"new password and confirm password not currecte" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    newpwd.text=@"";
    oldpwd.text=@"";
    confirmpwd.text=@"";

    
    
    
    
}
@end
