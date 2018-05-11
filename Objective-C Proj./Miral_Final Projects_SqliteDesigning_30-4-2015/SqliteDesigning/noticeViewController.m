//
//  noticeViewController.m
//  SqliteDesigning
//
//  Created by mac on 3/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "noticeViewController.h"
#import "DBmanger.h"
#import "shownoticeViewController.h"

@interface noticeViewController ()

@end

@implementation noticeViewController
@synthesize Login_id,SBid,notice_arr,notice_arr1,check,lbl_notice_placement,tableview,date_arr;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];
    
    self.tableview.backgroundColor = [UIColor clearColor];
    
    
    self.tableview.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0);
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.01f)];
    
    
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    
    [dbm DMLOperation:@"select * from profileinformation"];
    
    NSString *str=[[NSString alloc]initWithFormat:@"select id from branchID where bname='%@' ",[dbm.branch_arr objectAtIndex:[Login_id intValue]] ];
    
    NSString *branchID=[[NSString alloc]init];
    
    branchID=[dbm DMLOpertion_other:str];
    
    SBid=[[NSMutableString alloc]initWithString:[dbm.sem_arr objectAtIndex:[Login_id intValue]]];
    
    [SBid appendString:branchID];
    
    NSString *query,*date_query;
    
    if([check isEqualToString:@"notice"])
    {
       lbl_notice_placement.text=@"NOTICE";
        query=[[NSString alloc]initWithFormat:@"select noticetitle from noticeinformation where SBid='%@' or SBid='0000' ",SBid];
        date_query=[[NSString alloc]initWithFormat:@"select date from noticeinformation where SBid='%@' or SBid='0000' ",SBid];
    }
    else
    {
        lbl_notice_placement.text=@"PLACEMENT NOTICE";
       
        query=[[NSString alloc]initWithFormat:@"select placement_title from placementinformation where SBid='%@'",SBid];
        date_query=[[NSString alloc]initWithFormat:@"select date from placementinformation where SBid='%@'",SBid];

        
        
    }
    
    notice_arr=[[NSMutableArray alloc]init];
    date_arr=[[NSMutableArray alloc]init];
    
    notice_arr=[dbm DMLOpertion_detailArr:query];
    date_arr=[dbm DMLOpertion_detailArr:date_query];
    
    notice_arr=[[[notice_arr reverseObjectEnumerator]allObjects]mutableCopy];
    date_arr=[[[date_arr reverseObjectEnumerator]allObjects]mutableCopy];
    
    
    NSString *query1;
    
    if([check isEqualToString:@"notice"])
    {
    query1=[[NSString alloc]initWithFormat:@"select noticedetails from noticeinformation where SBid='%@' or SBid='0000' ",SBid];
    }
    else
    {
        query1=[[NSString alloc]initWithFormat:@"select notes from placementinformation where SBid='%@' ",SBid];
        
        
    }
    
    notice_arr1=[[NSMutableArray alloc]init];
    
    notice_arr1=[dbm DMLOpertion_detailArr:query1];
    
    notice_arr1=[[[notice_arr1 reverseObjectEnumerator]allObjects]mutableCopy];
   
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [notice_arr count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil)
    {
      cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
    }
    cell.textLabel.text=[notice_arr objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[date_arr objectAtIndex:indexPath.row];
    
    cell.backgroundColor =  [UIColor clearColor];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    shownoticeViewController *snvc=[self.storyboard instantiateViewControllerWithIdentifier:@"shownotice"];
    
   
    snvc.title_name=[notice_arr objectAtIndex:indexPath.row];
    snvc.note=[notice_arr1 objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:snvc animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
