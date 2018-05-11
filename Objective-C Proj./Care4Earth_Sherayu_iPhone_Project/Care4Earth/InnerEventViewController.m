//
//  InnerEventViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "InnerEventViewController.h"
#import "CreateSendInviteViewController.h"
#import "HomeMenuViewController.h"
@interface InnerEventViewController ()

@end

@implementation InnerEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 100)
    {
        if(buttonIndex == 0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Invite Friends?" delegate:self cancelButtonTitle:@"Later" otherButtonTitles:@"OK", nil];
            alert.tag = 10;
            [alert show];
            

        }
        
    }
    
    else if(alertView.tag == 10){
        if(buttonIndex!=[alertView cancelButtonIndex ])
        {
            CreateSendInviteViewController *reg =[[CreateSendInviteViewController alloc]initWithNibName:@"CreateSendInviteViewController" bundle:nil];
            [self.navigationController pushViewController:reg animated:YES];
        }
        else
        {
            HomeMenuViewController *reg =[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
            [self.navigationController pushViewController:reg animated:YES];
        }
    }
    else
    {
        
        if(buttonIndex!=[alertView cancelButtonIndex ])
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            
            
        }
        

    }
    
    
}
- (IBAction)btnJoin:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Successfully Joined" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag = 100;
    [alert show];

   }

- (IBAction)btnback:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Wish To Join ?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag = 50;
    [alert show];
}


@end
