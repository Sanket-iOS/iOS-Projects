//
//  timetableViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "timetableViewController.h"
#import "DBmanger.h"

@interface timetableViewController ()

@end

@implementation timetableViewController
{
    NSMutableString *SBid;
    NSMutableArray *time_arr,*sub_arr;
}
@synthesize day,sem,branch,day_name,Login_id,select_day,tableview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"engineering college,gandhinagar";
   
     self.view.backgroundColor=[UIColor clearColor];    
    
    self.tableview.backgroundColor = [UIColor clearColor];
    
    time_arr=[[NSMutableArray alloc]init];
    sub_arr=[[NSMutableArray alloc]init];
    
    day.text=day_name;
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    sem.text=[dbm.sem_arr objectAtIndex:[Login_id intValue]];
    branch.text=[dbm.branch_arr objectAtIndex:[Login_id intValue]];
    
    
     NSString *str=[[NSString alloc]initWithFormat:@"select id from branchID where bname='%@' ",self.branch.text ];
    
    NSString *branchID=[[NSString alloc]init];
    
    branchID=[dbm DMLOpertion_other:str];
    
    SBid=[[NSMutableString alloc]initWithString:sem.text];
    
    [SBid appendString:branchID];

    [SBid appendString:select_day];
    
    NSLog(@"%@",SBid);

    NSString *time_query=[[NSString alloc]initWithFormat:@"select time from timetableinformation where Tid='%@'",SBid];
   
    NSString *sub_query=[[NSString alloc]initWithFormat:@"select s.subject from subjectinformation as s ,timetableinformation as t where s.SUBid=t.SUBid and t.Tid='%@'",SBid];
    
    time_arr=[dbm DMLOpertion_detailArr:time_query];
   
    sub_arr=[dbm DMLOpertion_detailArr:sub_query];



}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sub_arr count]+1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
    }
    
    cell.textLabel.numberOfLines = 0;
    
    if(indexPath.row==0)
    {
        cell.textLabel.text=@"Subject";
        cell.detailTextLabel.text=@"time";
    }
    else
    {
        cell.textLabel.text=[sub_arr objectAtIndex:indexPath.row -1];
        cell.detailTextLabel.text=[time_arr objectAtIndex:indexPath.row-1];
    }
    
    cell.backgroundColor =  [UIColor clearColor];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
