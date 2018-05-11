//
//  InnerPetitionViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "InnerPetitionViewController.h"
#import "TellPeopleViewController.h"
#import "PetCatSelectedViewController.h"
@interface InnerPetitionViewController ()

@end

@implementation InnerPetitionViewController
@synthesize ardata,petid,txtreason,lblagainst,lblsupporters,lbltitle,arrSupp;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/petition/getpetitionpetid/?petid=%@",petid];
    
    
    NSLog(@"%@", strurl);
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    ardata = [[NSMutableArray alloc]init];
    ardata =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *supp=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/petition/getsupportercount/?petid=%@",petid];
    NSURL *url1=[[NSURL alloc]initWithString:supp];
    
    NSData *data1=[[NSData alloc]initWithContentsOfURL:url1];
    arrSupp = [[NSMutableArray alloc]init];
    arrSupp =[NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
    //urldata = [[NSMutableArray alloc]init];
    //  urldata = []
    // NSArray *attachments = [[ardata objectForKey:@"page"] objectForKey:@"attachments"];
    for(NSDictionary *object in ardata)
    {
        NSString *name = [object objectForKey:@"Title"];
        lbltitle.text = name;
        NSString *against = [object objectForKey:@"WhomToPetition"];
        lblagainst.text = against;
        NSString *reason = [object objectForKey:@"Reason"];
        txtreason.text = reason;
        //lbltitle.text = name;
        


        
    }
    


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
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Tell a Friend?" delegate:self cancelButtonTitle:@"Later" otherButtonTitles:@"OK", nil];
            alert.tag = 10;
            [alert show];
            
            
        }
        
    }
    
    else if(alertView.tag == 10){
        if(buttonIndex!=[alertView cancelButtonIndex ])
        {
            TellPeopleViewController *reg =[[TellPeopleViewController alloc]initWithNibName:@"TellPeopleViewController" bundle:nil];
            [self.navigationController pushViewController:reg animated:YES];
        }
        else
        {
          
            [self.navigationController popViewControllerAnimated:YES];        }
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


- (IBAction)btnSign:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Thank You for Signing" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
     alert.tag = 100;
    [alert show];
}

- (IBAction)btnback:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Do You Want to Discard ?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag = 50;
    [alert show];
}
@end
