//
//  TipsMainViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "TipsMainViewController.h"
#import "TipsInnerViewController.h"

@interface TipsMainViewController ()

@end

@implementation TipsMainViewController
@synthesize arrData,tblTips;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
   // self.tblTips.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/tips/getalltips"];
    
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    arrData=[[NSMutableArray alloc]init];
    arrData =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",arrData);

    //arrData = [[NSMutableArray alloc] initWithObjects:@"iPhone",@"iPod",@"MacBook",@"MacBook Pro",nil];
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
        cell.textLabel.text=[[arrData objectAtIndex:indexPath.row]objectForKey:@"Title"];
        
        //cell.imageView.image=[UIImage imageNamed:[[arrData objectAtIndex:indexPath.row]objectForKey:@"image"]];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     TipsInnerViewController *pet=[[TipsInnerViewController alloc]initWithNibName:@"TipsInnerViewController" bundle:nil];
    int i=indexPath.row+1;
    pet.tipsid=[[NSString alloc]initWithFormat:@"%d",i];
    [self.navigationController pushViewController:pet animated:YES];
}


- (IBAction)btnback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnlogout:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
