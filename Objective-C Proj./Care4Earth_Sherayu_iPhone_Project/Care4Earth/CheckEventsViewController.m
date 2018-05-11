//
//  CheckEventsViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "CheckEventsViewController.h"
#import "InnerEventViewController.h"
#import "HomeMenuViewController.h"
@interface CheckEventsViewController ()

@end

@implementation CheckEventsViewController
@synthesize arrData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/event/getallevents"];
    
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
    InnerEventViewController *inner=[[InnerEventViewController alloc]initWithNibName:@"InnerEventViewController" bundle:nil];
    [self.navigationController pushViewController:inner animated:YES];
}

- (IBAction)btnback:(id)sender {
    HomeMenuViewController *home=[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
}
@end
