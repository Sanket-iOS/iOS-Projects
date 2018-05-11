//
//  CreateEventViewController.m
//  Care4Earth
//
//  Created by tops on 2/12/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "CreateEventViewController.h"
#import "CreateSendInviteViewController.h"
#import "HomeMenuViewController.h"
@interface CreateEventViewController ()

@end

@implementation CreateEventViewController
@synthesize tblcity,tblstate,arrData,arrData1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    arrData = [[NSMutableArray alloc] initWithObjects:@"Gujarat",@"Maharashtra",@"Rajasthan",nil];
   arrData1 = [[NSMutableArray alloc] initWithObjects:@"Ahmedabad",@"Baroda",nil];
    flag=1;
    tblstate.hidden=YES;
    btn.layer.cornerRadius=8;
    tblstate.layer.cornerRadius=8;
    
    flag1=1;
    tblcity.hidden=YES;
    btn1.layer.cornerRadius=8;
    tblcity.layer.cornerRadius=8;

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

- (IBAction)btnbcak:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Do You Want to Discard ?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag = 50;
    [alert show];
}

- (IBAction)btnCreate:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Successfully Created" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag = 100;
    [alert show];
    
}

- (IBAction)btnState:(id)sender {
    if (flag==1) {
        flag=0;
        tblstate.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag=1;
        tblstate.hidden=YES;
        i.hidden=NO;
    }
}

- (IBAction)btnCity:(id)sender {
    if (flag1==1) {
        flag1=0;
        tblcity.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag1=1;
        tblcity.hidden=YES;
        i.hidden=NO;
    }

}
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    if(self.tblstate)
    {
        
        CGPoint location = [tapGesture locationInView:self.tblstate];
        if([tblstate indexPathForRowAtPoint:location] && [tblstate alpha] != 0) {
            // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
        } else {
            // Inside
        }
        flag=1;
        tblstate.hidden=YES;
        i.hidden=NO;
        
    }
    else
    {
        
        CGPoint location = [tapGesture locationInView:self.tblcity];
        if([tblcity indexPathForRowAtPoint:location] && [tblcity alpha] != 0) {
            // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
        } else {
            // Inside
        }
        flag1=1;
        tblcity.hidden=YES;
        i.hidden=NO;
        
        
    }
}
- (void)handleTapGesture1:(UITapGestureRecognizer *)tapGesture1
{
    CGPoint location = [tapGesture1 locationInView:self.tblcity];
    if([tblcity indexPathForRowAtPoint:location] && [tblcity alpha] != 0) {
        
    } else {
        // Inside
    }
    flag1=1;
    tblcity.hidden=YES;
    i.hidden=NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == tblstate)
    {
        return [arrData count];
    }
    else{
        return [arrData1 count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    if(tableView == tblstate)
    {
        cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [arrData1 objectAtIndex:indexPath.row];
    }
   
    
    return cell;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == tblstate)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    }


@end
