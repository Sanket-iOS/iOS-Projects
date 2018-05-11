//
//  CategoryPetitionViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "CategoryPetitionViewController.h"
#import "PetCatSelectedViewController.h"
#import "PetitionHomeViewController.h"
@interface CategoryPetitionViewController ()

@end

@implementation CategoryPetitionViewController
@synthesize arrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/categorydetail/getallcategory"];
    
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
    
   cell.textLabel.text=[[arrData objectAtIndex:indexPath.row]objectForKey:@"CategoryName"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PetCatSelectedViewController *pet=[[PetCatSelectedViewController alloc]initWithNibName:@"PetCatSelectedViewController" bundle:nil];
    int i=indexPath.row+1;
    pet.catid=[[NSString alloc]initWithFormat:@"%d",i];
    [self.navigationController pushViewController:pet animated:YES];
}

- (IBAction)btnback:(id)sender {
    PetitionHomeViewController *pet=[[PetitionHomeViewController alloc]initWithNibName:@"PetitionHomeViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
