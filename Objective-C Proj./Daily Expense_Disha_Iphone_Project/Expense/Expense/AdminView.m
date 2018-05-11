//
//  AdminView.m
//  Expense
//
//  Created by mac on 4/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AdminView.h"
#import "DbOperation.h"
#import "Validation.h"
#import "Home.h"
@interface AdminView ()

@end

@implementation AdminView
@synthesize adminPassBox,adminUserBox;

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)adminLogin:(id)sender {
    NSLog(@"%@",NSHomeDirectory());
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isClientLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    DbOperation *db=[[DbOperation alloc]init];
    arrUser=[db selectAdminUser];
    NSString *username=[[arrUser objectAtIndex:0]objectForKey:@"NAME"];
    NSString *Password=[[arrUser objectAtIndex:0]objectForKey:@"PASS"];
    NSString *g=adminUserBox.text;
    NSString *str=adminPassBox.text;
    if([username isEqualToString:g]||[Password isEqualToString:str])
    {
        Home *hm =[self.storyboard instantiateViewControllerWithIdentifier:@"home1"];
        
        [self.navigationController pushViewController:hm animated:YES];
    }
    else
    {
        Validation *vl=[[Validation alloc]init];
        BOOL res=[vl validEmail:g];
        BOOL ps=[vl strongPassword:str];
        if(!res)
        {
            UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"mcgn" message:@"UserName Format is not valid" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [al show];
        }
        if(!ps)
        {
            UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"mcgn" message:@"Password format is not valid" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [al show];
        }
        
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"mcgn" message:@"Wrong Username or Password!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [al show];
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)Clear:(id)sender {
    adminPassBox.text=nil;
    adminUserBox.text=nil;
}
@end
