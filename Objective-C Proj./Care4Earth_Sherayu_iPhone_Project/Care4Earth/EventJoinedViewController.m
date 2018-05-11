//
//  EventJoinedViewController.m
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "EventJoinedViewController.h"
#import "JoinedInnerViewController.h"
@interface EventJoinedViewController ()

@end

@implementation EventJoinedViewController
@synthesize arrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/event/geteventjoined/?userid=1"];
    
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
    
     cell.textLabel.text=[[arrData objectAtIndex:indexPath.row]objectForKey:@"EventName"];       
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JoinedInnerViewController *inner=[[JoinedInnerViewController alloc]initWithNibName:@"JoinedInnerViewController" bundle:nil];
    [self.navigationController pushViewController:inner animated:YES];
}


- (IBAction)btnback:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
