//
//  AddEditReminderView.m
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AddEditReminderView.h"
#import "DbOperation.h"
#import "Validation.h"
@interface AddEditReminderView ()

@end

@implementation AddEditReminderView
@synthesize checkbox,RecurringBox,ReminDateBox,ReminImageView,PriceBox,AddBox,TimeBox,DetailBox,headingBox,blankeError1,blankeError2,blankeError3,blankeError4,blankeError5,blankeError6,blankeError7;
NSString *str;


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
- (IBAction)checkboxClicked:(id)sender {
    
    
    if([checkbox.currentImage isEqual:[UIImage imageNamed:@"checkbox.png"]])
    {
        [sender  setImage:[UIImage imageNamed: @"checkbox-checked.png"] forState:UIControlStateNormal];
        Notified=true;
        
    }
    else
    {
        [sender  setImage:[UIImage imageNamed: @"checkbox.png"] forState:UIControlStateNormal];
        Notified=false;
        
    }
}

- (IBAction)SelectReminDate:(id)sender
{
    Remin_DatePicker =[[UIDatePicker alloc]init];
    [Remin_DatePicker setFrame:CGRectMake(10, 100, 300, 400)];
    [Remin_DatePicker addTarget:self action:@selector(Reminselect:) forControlEvents:UIControlEventValueChanged];
    Remin_DatePicker.datePickerMode=UIDatePickerModeDate;
    Remin_DatePicker.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:Remin_DatePicker];
    
    
    
}
-(void)Reminselect:(id)sender
{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"YYYY-MM-dd"];
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

- (IBAction)TimePicker:(id)sender {
    Remin_TimePicker =[[UIDatePicker alloc]init];
    [Remin_TimePicker setFrame:CGRectMake(10, 100, 300, 400)];
    [Remin_TimePicker addTarget:self action:@selector(ReminTimeselect:) forControlEvents:UIControlEventValueChanged];
    Remin_TimePicker.datePickerMode=UIDatePickerModeTime;
    Remin_TimePicker.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:Remin_TimePicker];
    

}
-(void)ReminTimeselect:(id)sender
{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"HH:mm a"];
    TimeBox.text=[format stringFromDate:Remin_TimePicker.date];
    Remin_TimePicker.hidden=YES;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 check time validation /^\d{1,2}\/\d{1,2}\/\d{4}$/
*/



-(void)RequireValid
{
    
    if([ReminDateBox.text isEqualToString:@""])
    {blankeError1.hidden=NO;
        str=@"No Val";}
    else
    {
        str=@"YES";
        blankeError1.hidden=YES;}
    if([TimeBox.text isEqualToString:@""])
    {blankeError2.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankeError2.hidden=YES;}
    if([headingBox.text isEqualToString:@""])
    {blankeError3.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankeError3.hidden=YES;}
    if([PriceBox.text isEqualToString:@""])
    {blankeError4.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
        blankeError4.hidden=YES;}
    if([DetailBox.text isEqualToString:@""])
    {blankeError5.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
        blankeError5.hidden=YES;}
    if([AddBox.text isEqualToString:@""])
    {blankeError6.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankeError6.hidden=YES;}
    if([RecurringBox.text isEqualToString:@""])
    {blankeError7.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankeError7.hidden=YES;}
    
    
}
- (IBAction)EditReminder:(id)sender
{
    Validation *vl=[[Validation alloc]init];
    NSString *price=PriceBox.text;
    NSString *time=TimeBox.text;
    [vl ValidNumber:price];
    [vl ValidTime:time];
    [self RequireValid];
    if([str isEqualToString:@"YES"])
    {
        if([vl.Validationmsg isEqualToString:@"YES Matche"])
        {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"What is your Reminder ID"message:nil delegate:self                                            cancelButtonTitle:@"Cancel"                                            otherButtonTitles:@"Edit",@"ADD", nil];
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];

    [message show];
        }
    }
  
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *rid=[alertView textFieldAtIndex:0].text;
    NSInteger RID = [rid intValue];

if (buttonIndex == 1)
{
    if([checkbox.currentImage isEqual:[UIImage imageNamed:@"checkbox-checked.png"]])
        Notified=true;
    else
        Notified=false;
     NSString *UpdateQuery=[[NSString alloc]initWithFormat:@"UPDATE Reminder set Rdate='%@',Rtime='%@',Heading='%@',Price='%@',Details='%@',Addto='%@',Recurring='%@', Notified='%i' where Rid='%ld'",ReminDateBox.text,TimeBox.text,headingBox.text, PriceBox.text,DetailBox.text,AddBox.text, AddBox.text,Notified, RID] ;
    DbOperation *db=[[DbOperation alloc]init];
    BOOL res=[db DMLOperation:UpdateQuery];
    
    NSString *msg;
    if(res)
    {
        msg=@"Reminder Updated!!";
    }
    else
    {
        msg=@"not Update";
    }
    UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Update message" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alt show];
}
    if(buttonIndex==2)
    {
        if([checkbox.currentImage isEqual:[UIImage imageNamed:@"checkbox-checked.png"]])
            Notified=true;
        else
            Notified=false;
        DbOperation *Db=[[DbOperation alloc]init];
        
        NSString *insQuery=[[NSString alloc]initWithFormat:@"insert into Reminder (Rdate,Rtime,Heading,Price,Details,Addto,Recurring,Notified,Rid)values('%@','%@','%@',%d,'%@','%@','%@','%i',%ld)",ReminDateBox.text,TimeBox.text,headingBox.text,[PriceBox.text intValue],DetailBox.text,AddBox.text,RecurringBox.text,Notified,RID];
        
        BOOL result=[Db DMLOperation:insQuery];
        NSString *msg;
        if(result)
        {
            msg=@"Reminder added!!";
        }
        else
        {
            msg=@"Don't Reminder add";
        }
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Message" message:msg delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [alt show];
        //get date,time     today(
       DbOperation *db=[[DbOperation alloc]init];
        
      NSString *strQuery=[[NSString alloc]initWithFormat:@"select Rdate,Rtime,Addto,Recurring,Price from Reminder where Rid=%ld",RID];
        Notifiedarr =[db selectDateAndTime:strQuery];
    NSLog(@"%@",Notifiedarr);
         NSString *strTime=[[Notifiedarr objectAtIndex:0]objectForKey:@"TIME"];
        NSString *strAdd=[[Notifiedarr objectAtIndex:0]objectForKey:@"ADD"];
        NSString *strRecure=[[Notifiedarr objectAtIndex:0]objectForKey:@"RECURE"];
        NSNumber *numPrice=[[Notifiedarr objectAtIndex:0]objectForKey:@"PRICE"];
        
      //concate date and time
//        NSString *dbDate=;
//        NSDateFormatter *dfmt=[[NSDateFormatter alloc]init];
//        [dfmt setDateFormat:@"YYYY-MM-dd"];
//        NSDate *gtDate=[dfmt dateFromString:dbDate];
//        NSLog(@"%@",gtDate);
       NSString *str=[[Notifiedarr objectAtIndex:0]objectForKey:@"DATE"];
        NSString *str1=[str stringByAppendingString:@" "];
       

        //yha problem aa rha...................................................
        NSString *strCondate=[str1 stringByAppendingString:strTime];
        NSLog(@"%@",strCondate);
//        
//        
//        //convert string to date
        NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
        [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm aaa"];

       //not convert string to date
       NSDate *date= [dateFormate dateFromString:strCondate];
         NSLog(@"%@",date);
//     
//        
//        
//        //notification code
       NSString *message=[[NSString alloc]initWithFormat:@"Today('%@')have Payment of Rupee '%@' of '%@'",strCondate,numPrice,strAdd ];
    //   NSDate *pickerDate = date;
//        
//        // Schedule the notification
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = strCondate;
       localNotification.alertBody = message;
        //localNotification.alertAction = @"Show me the item";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
//        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//        
//        // Request to reload table view data
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
//        
//        

    }
        
}


@end
