//
//  changeViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/26/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "changeViewController.h"
#import "DBmanger.h"
@interface changeViewController ()

@end

@implementation changeViewController
@synthesize str,Login_id,change_label,change_text1,change_text2;

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationItem.title=@"engineering college,gandhinagar";
    
    self.view.backgroundColor=[UIColor clearColor];
    
    if([str isEqualToString:@"password"])
    {
        change_label.text=@"CHANGE PASSWORD";
        change_text1.text=@"enter new password";
        change_text2.text=@"re-enter new password";
        
        
    }
    else if([str isEqualToString:@"mobile"])
    {
        change_label.text=@"CHANGE MOBILE NUMBER";
        change_text1.text=@"enter new mobile number";
        change_text2.text=@"re-enter new mobile number";
    }
    else if([str isEqualToString:@"Emailid"])
    {
        change_label.text=@"CHANGE EMAIL-ID";
        change_text1.text=@"enter new email-id";
        change_text2.text=@"re-enter new email-id";
        
    }
    
    
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (IBAction)submit:(id)sender
{
    DBmanger *dbm=[[DBmanger alloc]init];
    
    [dbm DMLOperation:@"select * from profileinformation"];
    
    NSString *alert=@"NO";
    
    if ([change_text1.text isEqualToString:@""] | [change_text2.text isEqualToString:@""])
    {
        UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"message" message:@"enter text fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alr show];
        
        alert=@"YES";
    }
    else if(![change_text1.text isEqualToString:change_text2.text])
    {
        UIAlertView *alert3=[[UIAlertView alloc]initWithTitle:@"MESSAGE" message:@"enter equal  textfields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert3 show];
        alert=@"YES";
    }
    
    else if([str isEqualToString:@"mobile"])
    {
        
        
        
        
        if([change_text1.text length]!=10 || [change_text2.text length]!=10)
            
        {
            UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"MESSAGE" message:@"enter valid mobile number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert2 show];
            alert=@"YES";
            
        }
    
    }
    
    else if([str isEqualToString:@"Emailid"])
    {
        
            NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
            
            if (![emailTest evaluateWithObject:change_text1.text] || ![emailTest evaluateWithObject:change_text2.text])
            {
                UIAlertView *alert4=[[UIAlertView alloc]initWithTitle:@"MESSAGE" message:@"enter valid emailID" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert4 show];
                alert=@"YES";
                
            }
        
    }
    
    
    if([alert isEqualToString:@"NO"])
    {
    
    NSString *str1=[[NSString alloc]initWithFormat:@"update profileinformation set %@='%@' where Enno='%@' ",str,self.change_text1.text,[dbm.en_arr objectAtIndex:[Login_id intValue]]];
    
    [dbm DMLOperation:str1];
    
    [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)change_text1_editing_begin:(id)sender
{
    change_text1.text=nil;
    if([str isEqualToString:@"password"])
        change_text1.secureTextEntry=YES;
    
}

- (IBAction)change_text2_editing_begin:(id)sender
{
    change_text2.text=nil;
    
     if([str isEqualToString:@"password"])
         change_text2.secureTextEntry=YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
