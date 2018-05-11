//
//  HistoryView.m
//  Expense
//
//  Created by mac on 2/20/15.
//  Copyright (c) 2015 tops. All rights reserved.
//
#import "HistoryView.h"
#import "History_Displaydata.h"

@interface HistoryView ()

@end

@implementation HistoryView
- (void)viewDidLoad {
    [super viewDidLoad];
    history=[[NSArray alloc]initWithObjects:@"All",@"Date",@"Month",@"Category",@"Mode",@"Custom", nil];
    his_desc=[[NSArray alloc]initWithObjects:@"See all the saved TRansaction",@"Date wise Transaction",@"All TRansaction during Month",@"Category Wise TRansaction",@"Search Custom", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return his_desc.count;
    
    return history.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
        cell.textLabel.text=[history objectAtIndex:indexPath.row];
        cell.detailTextLabel.text=[his_desc objectAtIndex:indexPath.row];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.detailTextLabel.textColor=[UIColor whiteColor];
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"onebanner.jpeg"]]];
        
    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        
        History_Displaydata *hd=[self.storyboard instantiateViewControllerWithIdentifier:@"His_dis"];
        hd.Item=0;
        
        
        [self.navigationController pushViewController:hd animated:YES];
        NSLog(@"fhds");
        
    }
    else if(indexPath.row==1)
    {
        History_Displaydata *hd=[self.storyboard instantiateViewControllerWithIdentifier:@"His_dis"];
        hd.Item=1;
        [self.navigationController pushViewController:hd animated:YES];
    }
    else if(indexPath.row==2)
    {
        History_Displaydata *hd=[self.storyboard instantiateViewControllerWithIdentifier:@"His_dis"];
        hd.Item=2;
        [self.navigationController pushViewController:hd animated:YES];
    }
    else if(indexPath.row==3)
    {
        History_Displaydata *hd=[self.storyboard instantiateViewControllerWithIdentifier:@"His_dis"];
        hd.Item=3;
        [self.navigationController pushViewController:hd animated:YES];
    }
    else if(indexPath.row==4)
    {
        History_Displaydata *hd=[self.storyboard instantiateViewControllerWithIdentifier:@"His_dis"];
        hd.Item=4;
        [self.navigationController pushViewController:hd animated:YES];
    }
    else
    {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"message" message:@"Not Avilabel" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alt show];
    }
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
