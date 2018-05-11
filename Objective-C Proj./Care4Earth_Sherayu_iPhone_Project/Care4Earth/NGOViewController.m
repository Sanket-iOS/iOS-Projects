//
//  NGOViewController.m
//  Care4Earth
//
//  Created by mac on 2/25/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "NGOViewController.h"

@interface NGOViewController ()

@end

@implementation NGOViewController
@synthesize arrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
     arrData = [[NSMutableArray alloc] initWithObjects:@"iPhone",@"iPod",@"MacBook",@"MacBook Pro",nil];
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
    
    cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



- (IBAction)btnback:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
