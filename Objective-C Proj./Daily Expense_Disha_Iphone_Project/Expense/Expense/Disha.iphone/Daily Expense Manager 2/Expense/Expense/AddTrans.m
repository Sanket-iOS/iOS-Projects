//
//  AddTrans.m
//  Expense
//
//  Created by tops on 2/11/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AddTrans.h"
#import "DbOperation.h"
#import "Validation.h"
@interface AddTrans ()

@end

@implementation AddTrans

@synthesize DateTextBox,CategoryBox,ModeTextBox,TraImgView,ItemBox,DescTextView,PriceBox,blankerror1,blankerror2,blankerror3,blankerror4,blankerror5,blankerror6;


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
    Category=[[NSArray alloc]initWithObjects:@"Personal",@"Clothing",@"Automobile",@"Bank Charges",@"Food",@"HouseHold",@"Insurences",@"Health",@"Education",@"Events",@"Gifts",@"Job Expenses",@"Leisure(daily/non-vaction",@"Loans",@"Savings",@"Taxes",@"Ulities",@"Vaction",@"hobbies", nil];
    Pay_mod=[[NSArray alloc]initWithObjects:@"Credit_Card",@"Cash",@"Cheque",@"OnAccount", nil];
    NSLog(@"%@",NSHomeDirectory());
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

-(IBAction)SelectDate:(id)sender {
    MyDatePicker=[[UIDatePicker alloc]init];
    [MyDatePicker setFrame:CGRectMake(20, 200, 250, 350)];
    [MyDatePicker addTarget:self action:@selector(select:) forControlEvents:UIControlEventValueChanged];
    MyDatePicker.datePickerMode=UIDatePickerModeDate;
  //  [UIView appearanceWhenContainedIn:[UIDatePicker class], nil].backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    MyDatePicker.backgroundColor = [UIColor whiteColor];
   
    [self.view addSubview:MyDatePicker];
}


-(void)RequireValid
{
    
    if([DateTextBox.text isEqualToString:@""])
    {blankerror1.hidden=NO;
        str=@"No Val";}
    else
    {
        str=@"YES";
        blankerror1.hidden=YES;}
    if([CategoryBox.text isEqualToString:@""])
    {blankerror2.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
      blankerror2.hidden=YES;}
    if([ModeTextBox.text isEqualToString:@""])
    {blankerror3.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankerror3.hidden=YES;}
    if([ItemBox.text isEqualToString:@""])
    {blankerror4.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
        blankerror4.hidden=YES;}
    if([DescTextView.text isEqualToString:@""])
    {blankerror5.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
       blankerror5.hidden=YES;}
    if([PriceBox.text isEqualToString:@""])
    {blankerror6.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
       blankerror6.hidden=YES;}
    
    
}

-(void)select:(id)sender
{
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/MM/YYY"];

    DateTextBox.text=[format stringFromDate:MyDatePicker.date];
    MyDatePicker.hidden=YES;
}
    


- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SelectCategory:(id)sender {
    if (CategoryTable==NULL) {
        
        CategoryTable=[[UITableView alloc]initWithFrame:CGRectMake(100, 50, 200, 600)
                                                  style:UITableViewStylePlain];
        CategoryTable.delegate=self;
        CategoryTable.dataSource=self;
        [self.view addSubview:CategoryTable];
        
    }

    
    
}

- (IBAction)SelectPaymentMode:(id)sender {
    if (Pay_ModeTable==NULL) {
        
        Pay_ModeTable=[[UITableView alloc]initWithFrame:CGRectMake(150, 240, 130, 200)
                                                  style:UITableViewStylePlain];
        Pay_ModeTable.delegate=self;
        Pay_ModeTable.dataSource=self;
        [self.view addSubview:Pay_ModeTable];
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView ==CategoryTable)
        
        return Category.count;
    
    else if(tableView==Pay_ModeTable)
        
        return  Pay_mod.count;
    else
        return 1;
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell=[CategoryTable dequeueReusableCellWithIdentifier:@"cell1"];
    if(tableView ==CategoryTable)
    {
        
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Category objectAtIndex:indexPath.row];
        }
        
    }
    else if(tableView==Pay_ModeTable)
    {
        
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Pay_mod objectAtIndex:indexPath.row];
        }
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==CategoryTable)
    {
        CategoryBox.text=[Category objectAtIndex:indexPath.row];
        [CategoryTable removeFromSuperview];
        CategoryTable=nil;
    }
    else if(tableView==Pay_ModeTable)
    {
        ModeTextBox.text=[Pay_mod objectAtIndex:indexPath.row];
        [Pay_ModeTable removeFromSuperview];
        Pay_ModeTable=nil;
    }
}

- (IBAction)PickImg:(id)sender {
    UIImagePickerController *Picking=[[UIImagePickerController alloc]init];
    Picking.delegate=self;
    Picking.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:Picking animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    TraImgView.image=image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)SaveRecord:(id)sender {
    [self RequireValid];
    Validation *vl=[[Validation alloc]init];
    NSString *pr=PriceBox.text;
    [vl ValidNumber:pr];
    if([str isEqualToString:@"YES"])
    {
        if([vl.Validationmsg isEqualToString:@"YES Matche"])
        {
    NSString *insertQuery=[NSString stringWithFormat:@"insert into Trans(Item,Price,Category,Date,Desc,Mode) Values('%@',%d,'%@','%@','%@','%@')",ItemBox.text,[PriceBox.text intValue],CategoryBox.text,DateTextBox.text,DescTextView.text,ModeTextBox.text];
    
    DbOperation *Db=[[DbOperation alloc]init];
    BOOL result=[Db DMLOperation:insertQuery];
    NSString *msg;
    if(result)
    {
        msg=@"Record Saved!";
    }
    else
    {
        msg=@"Record Dosen't Inserted!!";
    }
    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Message" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [al show];
    
        }
    }
}
@end
