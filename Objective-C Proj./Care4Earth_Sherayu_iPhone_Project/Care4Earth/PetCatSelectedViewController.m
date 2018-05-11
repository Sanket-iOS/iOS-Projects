//
//  PetCatSelectedViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "PetCatSelectedViewController.h"
#import "InnerPetitionViewController.h"
#import "CategoryPetitionViewController.h"
@interface PetCatSelectedViewController ()

@end

@implementation PetCatSelectedViewController
@synthesize arrData,catid;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/petition/getpetitioncatid/?catid=%@",catid];
    
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    arrData=[[NSMutableArray alloc]init];
    arrData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

   // arrData = [[NSMutableArray alloc] initWithObjects:@"iPhone",@"iPod",@"MacBook",@"MacBook Pro",nil];
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
   // cell.detailTextLabel.text=[arrData objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InnerPetitionViewController *inner=[[InnerPetitionViewController alloc]initWithNibName:@"InnerPetitionViewController" bundle:nil];
    int i=indexPath.row+1;
   inner.petid=[[NSString alloc]initWithFormat:@"%d",i];
    [self.navigationController pushViewController:inner animated:YES];
}
- (IBAction)btnBack:(id)sender {
   // CategoryPetitionViewController *cat=[[CategoryPetitionViewController alloc]initWithNibName:@"CategoryPetitionViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
