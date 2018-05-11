//
//  AddReminder.m
//  Expense
//
//  Created by MAC on 2/16/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AddReminder.h"

@interface AddReminder ()

@end

@implementation AddReminder
@synthesize checkbox,ReminDateBox,AddBox,RecurringBox,ReminImageView;
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
    Add=[[NSArray alloc]initWithObjects:@"Personal",@"Clothing",@"Automobile",@"Bank Charges",@"Food",@"HouseHold",@"Health",@"Education",@"Events",@"Gifts",@"Job Expenses",@"Leisure(daily/non-vaction",@"Savings",@"Ulities",@"Vaction",@"hobbies", nil];
    Recurring=[[NSArray alloc]initWithObjects:@"Insurences",@"Loans",@"Taxes",@"Fees", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)checkboxClicked:(id)sender {
    
    
    if([checkbox.currentImage isEqual:[UIImage imageNamed:@"checkbox.png"]])
    {
        [sender  setImage:[UIImage imageNamed: @"checkbox-checked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [sender  setImage:[UIImage imageNamed: @"checkbox.png"] forState:UIControlStateNormal];
        
    }
}

- (IBAction)SelectReminDate:(id)sender
{
    Remin_DatePicker =[[UIDatePicker alloc]init];
    [Remin_DatePicker setFrame:CGRectMake(10, 100, 300, 400)];
    [Remin_DatePicker addTarget:self action:@selector(Reminselect:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Remin_DatePicker];
    
    
    
}
-(void)Reminselect:(id)sender
{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateStyle:NSDateFormatterMediumStyle];
    ReminDateBox.text=[format stringFromDate:Remin_DatePicker.date];
    Remin_DatePicker.hidden=YES;
    
}
- (IBAction)AddClick:(id)sender {
    if(Add_Table==nil)
    {
        
    
    Add_Table=[[UITableView alloc]initWithFrame:CGRectMake(10, 250, 300, 400) style:UITableViewStylePlain];
    Add_Table.delegate=self;
    Add_Table.dataSource=self;
    [self.view addSubview:Add_Table];
}

}
- (IBAction)ReminClick:(id)sender {
    if(Recurring_Table==nil)
    {
        Recurring_Table=[[UITableView alloc]initWithFrame:CGRectMake(10, 270, 300, 400) style:UITableViewStylePlain];
        Recurring_Table.delegate=self;
        Recurring_Table.dataSource=self;
        [self.view addSubview:Recurring_Table];
    }
}

- (IBAction)ReminImagePicking:(id)sender {
    UIImagePickerController *Picking=[[UIImagePickerController alloc]init];
    
    Picking.delegate=self;
    Picking.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:Picking animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    ReminImageView.image=image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==Add_Table)
        return Add.count;
    else if(tableView==Recurring_Table)
        return Recurring.count;
    else
        return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if(tableView==Add_Table)
    {
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Add objectAtIndex:indexPath.row];
            
        }
    }
    else if(tableView==Recurring_Table)
    {
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Recurring objectAtIndex:indexPath.row];
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==Add_Table)
    {
        AddBox.text=[Add objectAtIndex:indexPath.row];
        [Add_Table removeFromSuperview];
        Add_Table=nil;
    }
    else if(tableView==Recurring_Table)
    {
        RecurringBox.text=[Recurring objectAtIndex:indexPath.row];
        [Recurring_Table removeFromSuperview];
        Recurring_Table=nil;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
