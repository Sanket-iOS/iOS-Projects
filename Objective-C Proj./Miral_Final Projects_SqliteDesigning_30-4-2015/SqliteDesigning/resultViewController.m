//
//  resultViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "resultViewController.h"
#import "DBmanger.h"

@interface resultViewController ()

@end

@implementation resultViewController


@synthesize Login_id,name,enno,SBid,marks_arr,sub_arr,tableview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];
    
    self.tableview.backgroundColor = [UIColor clearColor];
    
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    enno.text=[dbm.en_arr objectAtIndex:[Login_id intValue]];
    name.text=[dbm.name_arr objectAtIndex:[Login_id intValue]];
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"select id from branchID where bname='%@' ",[dbm.branch_arr objectAtIndex:[Login_id intValue]] ];
    
    
    NSString *branchID=[[NSString alloc]init];
    
    branchID=[dbm DMLOpertion_other:str];
    
    SBid=[[NSMutableString alloc]initWithString:[dbm.sem_arr objectAtIndex:[Login_id intValue]]];
    
    [SBid appendString:branchID];
    
    NSString *sub_query=[[NSString alloc]initWithFormat:@"select subject from subjectinformation where SBid='%@' ",SBid];
    
    sub_arr=[[NSMutableArray alloc]init];
    sub_arr=[dbm DMLOpertion_detailArr:sub_query];
    
    
    
    NSString *query=[[NSString alloc]initWithFormat:@"select marks from resultinformation where Enno='%@'",self.enno.text];
    
    marks_arr=[[NSMutableArray alloc]init];
    
    marks_arr=[dbm DMLOpertion_detailArr:query];
    
    
    
    // Do any additional setup after loading the view.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [marks_arr count]+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
        
    }
    
    [[cell textLabel] setNumberOfLines: 0];
   
    
    if(indexPath.row==0)
    {
        cell.textLabel.text=@"subject";
        cell.detailTextLabel.text=@"marks";
    }
    else
    {
        cell.textLabel.text=[sub_arr objectAtIndex:indexPath.row-1];
        cell.detailTextLabel.text=[marks_arr objectAtIndex:indexPath.row-1];
    }
    
    cell.backgroundColor =  [UIColor clearColor];
    
    
    return  cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
