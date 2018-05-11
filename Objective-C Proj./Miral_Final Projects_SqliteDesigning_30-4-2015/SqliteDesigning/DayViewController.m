//
//  DayViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "DayViewController.h"
#import "DBmanger.h"
#import "timetableViewController.h"


@interface DayViewController ()

@end

@implementation DayViewController
{
    NSArray *day_arr;
}
@synthesize Login_id,tableview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];
    
    self.tableview.backgroundColor = [UIColor clearColor];
    
    
    
    self.tableview.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0);    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.01f)];

    
    
    day_arr=[[NSArray alloc]initWithObjects:@"MONDAY",@"TUESDAY",@"WEDNESDAY",@"THURSDAY",@"FRIDAY",@"SATURDAY", nil];
    
    
    [tableview reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [day_arr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    cell.textLabel.text=[day_arr objectAtIndex:indexPath.row];
   
    cell.backgroundColor =  [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString=[dateFormat stringFromDate:date];
   
    
    DBmanger *dbm=[[DBmanger alloc]init];
    
    NSString *date_query=@"select date from holidayinformation ";
    
    NSArray *date_arr=[dbm DMLOpertion_detailArr:date_query];
    for(int i=0;i<[date_arr count];i++)
    {
        if([dateString isEqual:[date_arr objectAtIndex:i]])
        {
            
            NSString *name=[[NSString alloc]initWithFormat:@"select holiday from holidayinformation where serial =%d",(i+1)];
            NSArray *show=[dbm DMLOpertion_detailArr:name];
            NSString *name1=[show objectAtIndex:0];
            
            
            NSString *name2=[[NSString alloc]initWithFormat:@"select day from holidayinformation where serial =%d",(i+1)];
            NSArray *show1=[dbm DMLOpertion_detailArr:name2];
            NSString *name3=[show1 objectAtIndex:0];
            
            if([name3 isEqualToString:[day_arr objectAtIndex:indexPath.row]])
            {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"MESSAGE" message:name1 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            break;
            }
        }
        else
        {
            timetableViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"timetable"];
            tvc.day_name=[day_arr objectAtIndex:indexPath.row];
            tvc.Login_id=Login_id;
            if(indexPath.row==0)
            {
                tvc.select_day=@"mon";
            }
            else if(indexPath.row==1)
            {
                tvc.select_day=@"tue";
            }
            else if(indexPath.row==2)
            {
                tvc.select_day=@"wed";
            }
            else if(indexPath.row==3)
            {
                tvc.select_day=@"thu";
            }
            else if(indexPath.row==4)
            {
                tvc.select_day=@"fri";
            }
            else
            {
                tvc.select_day=@"sat";
            }
            
            [self.navigationController pushViewController:tvc animated:YES];
          }
        
    }
        
        
    
}
- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    
    
@end
