//
//  syllabusViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "syllabusViewController.h"
#import "DBmanger.h"
#import "shownoticeViewController.h"

@interface syllabusViewController ()

@end

@implementation syllabusViewController
@synthesize Login_id,branch,sem,sub_arr,SBid,tableview,syllabus_arr;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];
    
    self.tableview.backgroundColor = [UIColor clearColor];
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    branch.text=[dbm.branch_arr objectAtIndex:[Login_id intValue]];
    sem.text=[dbm.sem_arr objectAtIndex:[Login_id intValue]];
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"select id from branchID where bname='%@' ",self.branch.text ];
    
    NSString *branchID=[[NSString alloc]init];
    
    branchID=[dbm DMLOpertion_other:str];
    
    SBid=[[NSMutableString alloc]initWithString:sem.text];
    
    [SBid appendString:branchID];
    
    
    NSString *sub_query=[[NSString alloc]initWithFormat:@"select subject from subjectinformation where SBid='%@' ",SBid];
    
    sub_arr=[[NSMutableArray alloc]init];
    
    sub_arr=[dbm DMLOpertion_detailArr:sub_query];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sub_arr count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.numberOfLines = 0;
    
    
    
    
    cell.textLabel.text=[sub_arr objectAtIndex:indexPath.row];
    
    cell.backgroundColor =  [UIColor clearColor];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    shownoticeViewController *snvc=[self.storyboard instantiateViewControllerWithIdentifier:@"shownotice"];
    
     snvc.title_name=[sub_arr objectAtIndex:indexPath.row];
    
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    
    [SBid appendString:@"0"];
    NSString *str=[NSString stringWithFormat:@"%li",(long)(indexPath.row+1)];
    [SBid appendString:str];
    
    NSString *sub_query1=[[NSString alloc]initWithFormat:@"select syllabus from subjectinformation where SUBid='%@' ",SBid];
    
    syllabus_arr=[[NSMutableArray alloc]init];
    
    syllabus_arr=[dbm DMLOpertion_detailArr:sub_query1];
    
    snvc.note=[syllabus_arr objectAtIndex:0];
    
   
    [SBid deleteCharactersInRange:NSMakeRange(4,2)];
    
    
    
    
    [self.navigationController pushViewController:snvc animated:YES];

    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
