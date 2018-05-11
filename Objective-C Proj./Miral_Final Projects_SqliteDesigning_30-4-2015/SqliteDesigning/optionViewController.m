//
//  optionViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "optionViewController.h"
#import "DBmanger.h"
#import "profileViewController.h"
#import "syllabusViewController.h"
#import "resultViewController.h"
#import "DayViewController.h"
#import "saveNoteViewController.h"
#import "noticeViewController.h"

@interface optionViewController ()
@property NSMutableArray *options;
@end

@implementation optionViewController
{
    NSMutableArray *images1;
}
@synthesize name_label,name_arr,Login_id,options,tableview,hi_image
;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"engineering college,gandhinagar";
    
    self.tableview.backgroundColor = [UIColor clearColor];
  
    self.view.backgroundColor=[UIColor clearColor];


    self.tableview.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0);
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.01f)];
    
    
    self.hi_image.layer.cornerRadius = self.hi_image.frame.size.width / 2;
    self.hi_image.clipsToBounds = YES;
    
    hi_image.image=[UIImage imageNamed:@"8.jpg"];
    
    name_label.text=[name_arr objectAtIndex:[Login_id intValue]];
    options=[[NSMutableArray alloc]initWithObjects:@"NOTICE",@"TIME-TABLE",@"SYLLABUS",@"RESULT",@"PROFILE-INFORMATION",@"NOTES",@"PLACEMENT-DETAILS", nil];
    images1=[[NSMutableArray alloc]initWithObjects:@"notice.jpg",@"timetable.jpg",@"syallbus.jpg",@"result.jpg",@"profile.jpg",@"note.jpg",@"placement.jpg", nil];
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    
    [dbm DMLOperation:@"select * from profileinformation"];
    
    if(![[dbm.sem_arr objectAtIndex:[Login_id intValue]] isEqualToString:@"8"])
    {
        [options removeLastObject];
        [images1 removeLastObject];
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [options count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    
    
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    
   
    
    cell.backgroundColor =  [UIColor clearColor];
    
    
    cell.textLabel.font=[UIFont fontWithName:@"Cuckoo" size:22];
    
    
    cell.textLabel.font=[UIFont fontWithName:@"Chalkduster 23.0" size:16];
    
    cell.textLabel.text=[options objectAtIndex:indexPath.row];
    
    cell.imageView.image=[UIImage imageNamed:[images1 objectAtIndex:indexPath.row]];
    
    
    
    cell.backgroundColor =  [UIColor clearColor];
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0 || indexPath.row==6)
    {
        noticeViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"notice"];
        if(indexPath.row==0)
        {
            nvc.check=@"notice";
        }
        else
        {
            nvc.check=@"placement";
        }
        
        nvc.Login_id=Login_id;
        [self.navigationController pushViewController:nvc animated:YES];
    }
    
    
    if(indexPath.row==1)
    {
        
        
                DayViewController *dvc=[self.storyboard instantiateViewControllerWithIdentifier:@"day"];
                
                dvc.Login_id=Login_id;
                [self.navigationController pushViewController:dvc animated:YES];
    
        
        
    }
    
    
    if(indexPath.row==2)
    {
        syllabusViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"syllabus"];
        svc.Login_id=Login_id;
        [self.navigationController pushViewController:svc animated:YES];
    }
    
    
    if(indexPath.row==3)
    {
        resultViewController *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"result"];
        rvc.Login_id=Login_id;
        [self.navigationController pushViewController:rvc animated:YES];
    }
    
    
    if(indexPath.row==4)
    {
        profileViewController *pvc=[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
        pvc.Login_id=Login_id;
        [self.navigationController pushViewController:pvc animated:YES];
    }
    
    if(indexPath.row==5)
    {
        saveNoteViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"save"];
        svc.Login_id=Login_id;
        [self.navigationController pushViewController:svc animated:YES];
    }
   
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
