//
//  ReminderView.m
//  Expense
//
//  Created by mac on 2/17/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ReminderView.h"
#import "TableViewCell.h"
#import "AddEditReminderView.h"
#import "ViewDeleteReminder.h"
#import "ReminderCell.h"
@interface ReminderView ()

@end

@implementation ReminderView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Re_Nm=[[NSArray alloc]initWithObjects:@"Add",@"Edit",@"View & Delete", nil];
    Re_Desc=[[NSArray alloc]initWithObjects:@"Add a new Reminder",@"Update Reminder",@"Select & Delete Reminder", nil];
    Re_IMG=[[NSArray alloc]initWithObjects:@"Add_SICN.png",@"Edit_SICN.png",@"View_SICN.png", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Re_Nm.count;
    return Re_Desc.count;
    return Re_IMG.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Group_Cell"];
    cell.labelNm.text=[Re_Nm objectAtIndex:indexPath.row];
    cell.lbldesc.text=[Re_Desc objectAtIndex:indexPath.row];
    cell.MyImageview.image=[UIImage imageNamed:[Re_IMG objectAtIndex:indexPath.row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.row==0)
    {
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hh.jpeg"]]];
        
    }
    else if(indexPath.row==1)
    {
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hv.jpeg"]]];
    }
    else if(indexPath.row==2)
    {
        [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hh.jpeg"]]];
    }
  
   else
    {
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0||indexPath.row==1)
    {
     AddEditReminderView *AE=[self.storyboard instantiateViewControllerWithIdentifier:@"Ad_Ed_Remin"];
        [self.navigationController pushViewController:AE animated:YES];
    }

    else if(indexPath.row==2)
    {
        ViewDeleteReminder *VR=[self.storyboard instantiateViewControllerWithIdentifier:@"V_D_Remin"];
        [self.navigationController pushViewController:VR animated:YES];
    }
       
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

@end
