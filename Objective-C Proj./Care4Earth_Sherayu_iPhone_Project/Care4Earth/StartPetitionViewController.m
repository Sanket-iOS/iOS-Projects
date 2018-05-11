//
//  StartPetitionViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "StartPetitionViewController.h"
#import "TellPeopleViewController.h"
#import "HomeMenuViewController.h"
@interface StartPetitionViewController ()

@end

@implementation StartPetitionViewController
@synthesize arrData,tbldata,txtagainst,txttitle,txtview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    arrData = [[NSMutableArray alloc] initWithObjects:@"Energy",@"Ocean",@"Pollution",@"GlobalWarming",@"Wildlife",nil];
    //tblSimpleTable.frame =CGRectMake(10, 10, 300, 100);
    flag=1;
    tbldata.hidden=YES;
    btn.layer.cornerRadius=8;
    tbldata.layer.cornerRadius=8;
    
}
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    
        
        CGPoint location = [tapGesture locationInView:self.tbldata];
        if([tbldata indexPathForRowAtPoint:location] && [tbldata alpha] != 0) {
            // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
        } else {
            // Inside
        }
        flag=1;
        tbldata.hidden=YES;
        i.hidden=NO;
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

- (IBAction)btnSelect:(id)sender {
    if (flag==1) {
        flag=0;
        tbldata.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag=1;
        tbldata.hidden=YES;
        i.hidden=NO;
    }
    

}

- (IBAction)btnStart:(id)sender {
    
    NSString *Str=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/petition/postpetition/?userid=%@&title=%@&whom=%@&reason=%@&date=1/1/2015",txttitle.text, txtagainst.text, txtview.text];
    
    
    
    NSURL *Url=[[NSURL alloc]initWithString:Str];
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:Url];
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSLog(@"%@",[response description]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *st=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    NSString *s = [NSString stringWithFormat:@"\"Started\""];
    
    NSLog(@"%@",s);
    NSLog(@"%@",st);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Successfully Started" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag=100;
    [alert show];

    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [arrData count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    
    return cell;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)btnBack:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Do You Want To Discard?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag=50;
    [alert show];
    
}
@end
