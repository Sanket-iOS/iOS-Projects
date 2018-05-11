//
//  ViewController.m
//  Expense
//
//  Created by tops on 2/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ViewController.h"
#import "Home.h"
#import "DbOperation.h"
#import "Validation.h"
#import "History_Displaydata.h"

#define setIncome(v) [[NSUserDefaults standardUserDefaults] setObject:v forKey:@"income"]


@interface ViewController ()

@end

@implementation ViewController

@synthesize PassBox,loginButton,EmailBox,incomeBox;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    EmailBox.text = @"disha@gmail.com";
    PassBox.text = @"diSHA@@12345";
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Login:(id)sender
{
    NSString *message;
    NSLog(@"%@",NSHomeDirectory());
    DbOperation *db=[[DbOperation alloc]init];
    NSString *strQuery=@"select * from Register";
    arrUser=[db selectRegister:strQuery];
    Home *hm=[self.storyboard instantiateViewControllerWithIdentifier:@"home1"];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isClientLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    setIncome(incomeBox.text);
    
    
    for(int i=0;i<[arrUser count];i++)
    {
        NSString *gemail=EmailBox.text;
        NSString *str=PassBox.text;
        NSString *inc=incomeBox.text;
        
        NSString *username=[[arrUser objectAtIndex:i]objectForKey:@"EMAIL"];
        NSString *Password=[[arrUser objectAtIndex:i]objectForKey:@"PASS"];
        
        if([username isEqualToString:gemail]||[Password isEqualToString:str])
        {
            message=@"YES";
            Validation *vl=[[Validation alloc]init];
            BOOL res=[vl validEmail:gemail];
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
            if([inc isEqualToString:@""])
                NSLog(@"Not Update");
            
            else
            {
                NSString *updateQry=[[NSString alloc]initWithFormat:@"update Register set Income='%@' where Email='%@'",incomeBox.text,EmailBox.text];
                BOOL updINC=[db DMLOperation:updateQry];
                if(updINC)
                    NSLog(@"Update YESSS");
                
                
            }
            
            
            [self.navigationController pushViewController:hm animated:YES];
        }
        else
        {
            message=@"NO";
            
        }
        
    }
    
    if([message isEqualToString:@"NO"])
    {
        
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"mcgn" message:@"Wrong Username or Password!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [al show];
    }
    
    
    
    
    EmailBox.text=nil;
    PassBox.text=nil;
    incomeBox.text=nil;
    
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}





@end
