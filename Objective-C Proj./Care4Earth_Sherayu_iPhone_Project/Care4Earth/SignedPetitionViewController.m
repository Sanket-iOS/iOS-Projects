//
//  SignedPetitionViewController.m
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "SignedPetitionViewController.h"
#import "SignedInnerViewController.h"
@interface SignedPetitionViewController ()

@end

@implementation SignedPetitionViewController
@synthesize arrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/petition/getpetitionsigned/?userid=1"];
    
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    arrData=[[NSMutableArray alloc]init];
    arrData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
   cell.textLabel.text=[[arrData objectAtIndex:indexPath.row]objectForKey:@"Title"];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SignedInnerViewController *pet=[[SignedInnerViewController alloc]initWithNibName:@"SignedInnerViewController" bundle:nil];
    [self.navigationController pushViewController:pet animated:YES];
}



- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
