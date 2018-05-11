//
//  ViewDeleteReminder.m
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ViewDeleteReminder.h"
#import "ReminderCell.h"
#import "DbOperation.h"
@interface ViewDeleteReminder ()

@end

@implementation ViewDeleteReminder

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    DbOperation *DB=[[DbOperation alloc]init];
    SelRData=[DB selectRemin];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    DbOperation *db=[[DbOperation alloc]init];
    
    
    Seldata=[db selectRemin];
    NSLog(@"%@",NSHomeDirectory());
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Seldata.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ReminderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ReminderCell"];
    
    
    if (cell == nil)
    {
        cell = [[ReminderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReminderCell"];
    }
    
    //cell with nil problem
    cell.addl.text=[[Seldata objectAtIndex:indexPath.row]objectForKey:@"ADD"];
    cell.timel.text=[[Seldata objectAtIndex:indexPath.row]objectForKey:@"TIME"];
    cell.datel.text=[[Seldata objectAtIndex:indexPath.row]objectForKey:@"DATE"];
    
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void) performExpand{
    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"nfdj" message:@"Delete Record" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [al show];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        
        int userid=[[[SelRData objectAtIndex:indexPath.row] objectForKey:@"RID"] intValue];
        NSString *deleteQuSery=[NSString stringWithFormat:@"delete from Reminder where Rid=%d",userid];
        DbOperation *db=[[DbOperation alloc]init];
        [db DMLOperation:deleteQuSery];
        
        [SelRData removeObjectAtIndex:indexPath.row];
        
        [Seldata removeObjectAtIndex:indexPath.row];
        
        [tableView reloadData];
        
        
    }
}

@end
